package com.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.print.DocFlavor.INPUT_STREAM;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("user_name");
		String password = request.getParameter("user_password");
		String email = request.getParameter("user_email");
		Part part = request.getPart("image");
		String filename = part.getSubmittedFileName();
		//out.println(filename);
		try {
			Thread.sleep(3000);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","172005manu");
			String query = "insert into user(username,password,email,imagename) values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setString(4, filename);
			ps.executeUpdate();
			InputStream is = part.getInputStream();
			byte []data = new byte[is.available()];
			is.read(data);
			
			//out.print(path);
			FileOutputStream fos = new FileOutputStream("E:\\upload\\"+filename);
			fos.write(data);
			fos.close();
			out.print("done");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			out.print(e);
		}
	}

}
