<%-- 
    Document   : about
    Created on : Jan 13, 2021, 9:55:40 PM
    Author     : thu26
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message", "You are not logged in!! Login first to access cart page");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            .header-table{
                text-align: center;
            }
            .header-item{
                position: absolute;
                left: 15%;
            }
        </style>
       <%@include file="components/common_css.html"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div id="cart">
            <div class="cart-body">
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

                                        <a href="cart.html">Cart</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                
                
                
            <div class="u-s-p-b-60">

                <!--====== Section Intro ======-->
                <div class="section__intro u-s-m-b-60">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section__text-wrap">
                                    <h1 class="section__heading u-c-secondary">SHOPPING CART</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Intro ======-->


                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
                                <div class="table-responsive">

                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="route-box">
                                    <div class="route-box__g1">

                                        <a class="route-box__link" href="shop-side-version-2.html"><i class="fas fa-long-arrow-alt-left"></i>

                                            <span>CONTINUE SHOPPING</span></a></div>
                                    <div class="route-box__g2">

                                        <a class="route-box__link" href="cart.html"><i class="fas fa-trash"></i>

                                            <span>CLEAR CART</span></a>

                                        <a class="route-box__link" href="cart.html"><i class="fas fa-sync"></i>

                                            <span>UPDATE CART</span></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
            </div>
                
                
                
                
                
            <div class="u-s-p-b-60">

                <!--====== Section Content ======-->
                <div class="section__content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
                                <form class="f-cart">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                            <div class="f-cart__pad-box">
                                                <h1 class="gl-h1">YOUR DETAILS FOR ORDER</h1>

                                                <span class="gl-text u-s-m-b-30">Enter your destination to get a shipping estimate.</span>
                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="shipping-zip">Email Address *</label>

                                                    <input class="input-text input-text--primary-style" type="text"  placeholder="Enter Email"></div>
                                                <div class="u-s-m-b-30">

                                                    <!--====== Select Box ======-->
                                                   <label value="<%= user.getUserName()%>" class="gl-label" for="shipping-zip">Your Name *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="shipping-zip" placeholder="Enter Name">
                                                    <!--====== End - Select Box ======-->
                                                </div>
                                                <div class="u-s-m-b-30">
                                                    <label value="<%= user.getUserPhone()%>" class="gl-label" for="shipping-zip">Your Contain *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="shipping-zip" placeholder="Enter Number"></div>
                                                <div class="u-s-m-b-30">
                                                    <label value="<%= user.getUserAddress()%>" class="gl-label" for="shipping-zip">Your Shipping Address *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="shipping-zip" placeholder="Enter Address"></div>

                                                <span class="gl-text">Note: There are some countries where free shipping is available otherwise our flat rate charges or country delivery charges will be apply.</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                            <div class="f-cart__pad-box">
                                                <h1 class="gl-h1">NOTE</h1>

                                                <span class="gl-text u-s-m-b-30">Add Special Note About Your Product</span>
                                                <div>

                                                    <label for="f-cart-note"></label><textarea class="text-area text-area--primary-style" id="f-cart-note"></textarea></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                            <div class="f-cart__pad-box">
                                                <div class="u-s-m-b-30">
                                                    <table class="grand-total f-cart__table">
                                                        <tbody class="grand-total">
                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div>

                                                    <button class="btn btn--e-brand-b-2" type="submit"> PROCEED TO CHECKOUT</button></div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
            </div>
            </div>
        </div>
        <%@include file="components/footer.jsp"%>
        <%@include file="components/fixjs.html"%>
    </body>
</html>
