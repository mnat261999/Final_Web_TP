<%-- 
    Document   : register
    Created on : Jan 14, 2021, 5:20:06 PM
    Author     : thu26
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       <%@include file="components/common_css.html"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
      
        <div class="app-content">

            <!--====== Section 1 ======-->
            <div class="u-s-p-y-60">

                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="breadcrumb">
                            <div class="breadcrumb__wrap">
                                <ul class="breadcrumb__list">
                                    <li class="has-separator">

                                        <a href="index.html">Home</a></li>
                                    <li class="is-marked">

                                        <a href="signup.html">Signup</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section 1 ======-->


            <!--====== Section 2 ======-->
            <div class="u-s-p-b-60">

                <!--====== Section Intro ======-->
                <div class="section__intro u-s-m-b-60">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section__text-wrap">
                                    <h1 class="section__heading u-c-secondary">CREATE AN ACCOUNT</h1>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Intro ======-->

                <div class="container">
                    <div class="row row--center">
                        <div class="col-lg-6 col-md-8 u-s-m-b-30">
                            <%@include file="components/message.jsp"%>
                        </div>
                        
                    </div>
                </div>

                
                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="row row--center">
                            <div class="col-lg-6 col-md-8 u-s-m-b-30">
                                <div class="l-f-o">
                                    <div class="l-f-o__pad-box">
                                        <h1 class="gl-h1">PERSONAL INFORMATION</h1>
                                        <form action="RegisterServlet" method="post" class="l-f-o__form">
                                            <div class="gl-s-api">
                                                <div class="u-s-m-b-15">

                                                    <button class="gl-s-api__btn gl-s-api__btn--fb" type="button"><i class="fab fa-facebook-f"></i>

                                                        <span>Signup with Facebook</span></button></div>
                                                <div class="u-s-m-b-30">

                                                    <button class="gl-s-api__btn gl-s-api__btn--gplus" type="button"><i class="fab fa-google"></i>

                                                        <span>Signup with Google</span></button></div>
                                            </div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="name">USER NAME *</label>

                                                <input name="user_name" class="input-text input-text--primary-style" type="text" id="reg-fname" placeholder="Enter user name"></div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="email">EMAIL *</label>

                                                <input name="user_email" class="input-text input-text--primary-style" type="text" id="reg-lname" placeholder="Enter email"></div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="password">PASSWORD *</label>

                                                <input name="user_password" class="input-text input-text--primary-style" type="password" id="reg-email" placeholder="Enter password"></div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="phone">PHONE *</label>

                                                <input name="user_phone" class="input-text input-text--primary-style" type="number" id="reg-password" placeholder="Enter phone"></div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="address">ADDRESS *</label>

                                                <input name="user_address" class="input-text input-text--primary-style" placeholder="Enter address"></div>
                                            <div class="u-s-m-b-15">
                                                
                                                <div class="btn-group-register">
                                                    <button class="btn btn--e-transparent-brand-b-2" type="submit">CREATE</button></div>
                                                    <button class="btn-reset btn btn--e-transparent-brand-b-2 " type="reset">RESET</button></div>
                                                </div>

                                            <a class="return-store gl-link" href="#">Return to Store</a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
            </div>
            <!--====== End - Section 2 ======-->
        </div>
         <%@include file="components/footer.jsp"%>
         <%@include file="components/fixjs.html"%>
    </body>
</html>
