<%-- 
    Document   : register_page
    Created on : Jun 17, 2023, 12:33:20 AM
    Author     : shash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path:polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 66% 100%, 31% 92%, 0 100%, 0 0);
            }
        </style>




    </head>
    <body>


        <!--navbar-->
        <%@include file="normal_navbar.jsp"%>
        <main class="primary-background p-5  "style="padding-bottom: 80px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <p>Register Here</p>
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">

                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Select gender</label> 
                                    <br>
                                    <input type="radio"  id="gender"name=gender value="Male" > Male
                                    <input type="radio"  id="gender"name=gender value="Female"> Female
                                </div>

                                <div class="form-group">

                                    <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter somthing about yourself"></textarea>
                                </div>


                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree term and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="laoder" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>
                                <button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
                            </form>

                        </div>

                    </div>


                </div>
            </div>


        </main>



        <!--java_script-->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
            console.log("loaded......")

                    $('#reg-form').on('submit', function (event) {
            event.preventDefault();
            let form = new FormData(this);
            
            
            $("#submit-btn").hide();
            $("#loader").show();
            //sed register servlet:

            $.ajax({
            url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                    console.log(data)

                    $("#submit-btn").show();
                    $("#loader").hide();
                    if (data.trim() == 'done'){
                    swal("Register Successfully..we are going to redirect to login page")
                            .then((value) => {
                            window.location = "login_page.jsp"
                            });
                }else{
                swal(data);
                }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();
                           
                            swal("Somthing went wrong.. try again");
                            
                        },
                        processData: false,
                        contentType: false
                    });

                });
            });
        </script>





    </body>
</html>
