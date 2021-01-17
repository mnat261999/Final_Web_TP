<%-- 
    Document   : index
    Created on : Jan 13, 2021, 8:19:04 PM
    Author     : thu26
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.mycompany.final_web.entities.Category"%>
<%@page import="com.mycompany.final_web.dao.CategoryDao"%>
<%@page import="com.mycompany.final_web.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.final_web.dao.ProductDao"%>
<%@page import="com.mycompany.final_web.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       <%@include file="components/common_css.html"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <%@include file="components/slider.jsp"%>
        <div class="u-s-p-b-60">

                <!--====== Section Intro ======-->
                <div class="section__intro u-s-m-b-16">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section__text-wrap">
                                    <h1 class="section__heading u-c-secondary u-s-m-b-12">Product</h1>

                                    <span class="section__span u-c-silver">CHOOSE CATEGORY</span>
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
                    <%
                        String cat = request.getParameter("category");
                        
                        ProductDao dao=new ProductDao(FactoryProvider.getFactory());
                        
                        List <Product> list=null;

                        
                        if(cat==null || cat.trim().equals("all"))
                        {
                            list= dao.getAllProducts();
                        }
                        else
                        {
                            int cid = Integer.parseInt(cat.trim());
                            list=dao.getAllProductsById(cid);
                        }
                        
                        CategoryDao cdo=new CategoryDao(FactoryProvider.getFactory());
                        List <Category> clist=cdo.getCategories();
                       
                    %>
                            <div class="col-lg-12">
                                <div class="filter-category-container">
                                    <div class="filter__category-wrapper">

                                        <a href="index.jsp?category=all" class="btn filter__btn filter__btn--style-1" data-filter="*">ALL</a></div>
                                    <%
                                        for(Category category:clist)
                                                    {%>
                                         <div class="filter__category-wrapper">

                                            <a href="index.jsp?category=<%=category.getCategoryId()%>" class="btn filter__btn filter__btn--style-1" data-filter=".<%=category.getCategoryTitle()%>"><%=category.getCategoryTitle()%></a>
                                        </div>           
                                    <%}%>
                                    
                                </div>
                                
                                
                                <div class="filter__grid-wrapper u-s-m-t-30" style="position: relative; height: 1135.5px;">
                                    <div class="row">
                                         <%for(Product product:list){
                                       %>
                                        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item headphone" style="position: absolute; left: 0px; top: 0px;">
                                            <div class="product-o product-o--hover-on product-o--radius">
                                                <div class="product-o__wrap">

                                                    <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                        <img class="aspect__img" src="img/products/<%=product.getpPhoto()%>" alt=""></a>
                                                    <div class="product-o__action-wrap">
                                                        <ul class="product-o__action-list">
                                                            <li>

                                                                <a onclick="add_to_cart(<%=product.getpId()%>,'<%=product.getpName()%>',<%=product.getPriceAfterApplyingDiscount()%>)" data-modal="modal" data-modal-id="#add-to-cart" data-tooltip="tooltip" data-placement="top" title="" data-original-title="Add to Cart"><i class="fas fa-plus-circle"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <span class="product-o__name">

                                                    <a href="product-detail.html"><%=product.getpName()%></a></span>
                                                <div class="product-o__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>

                                                    <span class="product-o__review">(<%=product.getpQuantity()%>)</span></div>
                                                    
                                                    
                                                    <%
                                                                if(product.getpDiscount()==0)
                                                                {
                                                             %>
                                                             <span class="product-o__price"><%=product.getpPrice()%>&#8363;
                                                               <% }
                                                                else
                                                                {
                                                               %>
                                                               <span class="product-o__price"><%=product.getPriceAfterApplyingDiscount()%>&#8363;
                                                               <span class="product-o__discount"><%=product.getpPrice()%>&#8363;</span></span>
                                                               <% }
                                                            %>
                                                
                                                    
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
            </div>
        <%@include file="components/footer.jsp"%>
        <%@include file="components/fixjs.html"%>
    </body>
</html>
