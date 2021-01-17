<%-- 
    Document   : about
    Created on : Jan 13, 2021, 9:55:40 PM
    Author     : thu26
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                        <div class="row">
                            <div class="col-lg-12 col-md-12 u-s-m-b-30">
                                <div class="empty">
                                    <div class="empty__wrap">

                                        <span class="empty__big-text">EMPTY</span>

                                        <span class="empty__text-1">No items found on your cart.</span>

                                        <a class="empty__redirect-link btn--e-brand" href="shop-side-version-2.html">CONTINUE SHOPPING</a></div>
                                </div>
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
