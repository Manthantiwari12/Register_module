<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <style>
        ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
        color: black;
        opacity: 1; /* Firefox */
        }

        :-ms-input-placeholder { /* Internet Explorer 10-11 */
        color:  black;
        }

        ::-ms-input-placeholder { /* Microsoft Edge */
        color: black;
        }
    </style>
            
</head>
<body style="background: url(img/background.jpg); background-size: cover; background-attachment: fixed;">
    <div class="container" >
        <div class="row">
            <div class="col m6 offset-m3">
                <div class="card" style="background-color: rgba(255, 255, 255, 0.5); color: #fff;">
                    <div class="card-content">
                        <h3 style="margin-top: 10px;color: black;" class="center-align">Register Here !!</h3>
						<h5 id="msg" class="center-align" ></h5>
                        <div class="form center-align">
                            <form action="Register" method="post" id="myform" enctype="multipart/form-data">
                                <input type="text" name="user_name" placeholder="Enter User Name">
                                <input type="password" name="user_password" placeholder="Enter User Password">
                                <input type="email" name="user_email" placeholder="Enter User Email">
                                <div class="file-field input-field">
							      <div class="btn blue">
							        <span>File</span>
							        <input type="file" name="image">
							      </div>
							      <div class="file-path-wrapper">
							        <input class="file-path validate" type="text">
							      </div>
							    </div>
                                <button type="submit" class="btn blue">Register</button>
                            </form>
                        </div>

                        <div class="loader center-align" style="margin-top: 10px; display: none;">
                            <div class="preloader-wrapper big active">
                                <div class="spinner-layer spinner-blue">
                                  <div class="circle-clipper left">
                                    <div class="circle"></div>
                                  </div><div class="gap-patch">
                                    <div class="circle"></div>
                                  </div><div class="circle-clipper right">
                                    <div class="circle"></div>
                                  </div>
                                </div>
                          
                                <div class="spinner-layer spinner-red">
                                  <div class="circle-clipper left">
                                    <div class="circle"></div>
                                  </div><div class="gap-patch">
                                    <div class="circle"></div>
                                  </div><div class="circle-clipper right">
                                    <div class="circle"></div>
                                  </div>
                                </div>
                          
                                <div class="spinner-layer spinner-yellow">
                                  <div class="circle-clipper left">
                                    <div class="circle"></div>
                                  </div><div class="gap-patch">
                                    <div class="circle"></div>
                                  </div><div class="circle-clipper right">
                                    <div class="circle"></div>
                                  </div>
                                </div>
                          
                                <div class="spinner-layer spinner-green">
                                  <div class="circle-clipper left">
                                    <div class="circle"></div>
                                  </div><div class="gap-patch">
                                    <div class="circle"></div>
                                  </div><div class="circle-clipper right">
                                    <div class="circle"></div>
                                  </div>
                                </div>
                              </div>
                              <h5>Please Wait . . .</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
     
    <script>
        $(document).ready(function(){
            console.log("page is ready")
            $("#myform").on('submit',function(event){
            	event.preventDefault();
            	//var f = $(this).serialize();
            	let f = new FormData(this);
            	console.log(f);
            	$(".loader").show();
            	$(".form").hide();
            	
            	$.ajax({
            		url: "Register",
            		data: f,
            		type: 'POST',
            		success: function (data, textStatus, jqXHR){
            			console.log(data);
            			console.log("success")
            			$(".loader").hide();
                    	$(".form").show();
                    	if (data.trim() === 'done') 
                    	{
							$('#msg').html("Successfully Registered . . .")
							$('#msg').addClass('green-text')
						}else 
						{
							$('#msg').html("Something Went Wrong on Server . . .")
							$('#msg').addClass('red-text')
						}
                   
                	
                    	
            		},
            		error: function (jqXHR, textStatus, errorThrown){
            			console.log(data);
            			console.log("error");	
            			$(".loader").hide();
                    	$(".form").show();
                    	$('msg').html("Something Went Wrong on Server . . .")
                    	$('#msg').addClass('red-text')
            		},
            		processData: false,
            		contentType: false            	})
            })
        })
    </script>
   
</body>
</html>