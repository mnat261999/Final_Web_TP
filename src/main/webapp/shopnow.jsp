<%-- 
    Document   : shopnow
    Created on : Jan 16, 2021, 8:01:56 AM
    Author     : thu26
--%>

<%@page import="com.mycompany.final_web.entities.Category"%>
<%@page import="com.mycompany.final_web.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.final_web.entities.Product"%>
<%@page import="com.mycompany.final_web.dao.ProductDao"%>
<%@page import="com.mycompany.final_web.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Now</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       <%@include file="components/common_css.html"%>
       <style>
           .category_hover{
               color: black;
           }
           .category_hover:hover{
               color: #ff4500;
           }
           .gl-tag-sale{
                margin-left: 8px;
                display: inline-block;
                margin-bottom: 10px;
                padding: 5px 13px;
                font-size: 11px;
                font-weight: 600;
                border-radius: 22px;
           }
           .tag-sale{
                border: 1px solid #ff4500;
                box-shadow: 1px 2px 8px 0 rgba(36, 37, 38, 0.08);
                background-color: #ff4500;
                color: #ffffff;
                transition: background-color .3s linear, border-color .3s linear;
           }
           .price-first{
               margin-right: 1px;
                font-size: 15px;
           }
           .is-grid-active .product-m__add-cart > button {
              padding: 12px;
              border-radius: 0.125rem;
              font-size: 13px;
              width: 100%;
              text-align: center;
              display: block;}
       </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="u-s-p-y-90">
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
                    
                    <!-- Show category -->
                    
                    <div class="col-lg-3 col-md-12">
                            <div class="shop-w-master">
                                <h1 class="shop-w-master__heading u-s-m-b-30"><i class="fas fa-filter u-s-m-r-8"></i>

                                    <span>FILTERS</span></h1>
                                <div class="shop-w-master__sidebar">
                                    <div class="u-s-m-b-30">
                                        <div class="shop-w shop-w--style">
                                            <div class="shop-w__intro-wrap">
                                                <h1 class="shop-w__h"><a class="category_hover" href="shopnow.jsp?category=all">CATEGORY(<%=list.size()%>)</a></h1>

                                                <span class="fas fa-minus shop-w__toggle" data-target="#s-category" data-toggle="collapse"></span>
                                            </div>
                                            <div class="shop-w__wrap collapse show" id="s-category">
                                                <%for(Category category:clist)
                                                    {
                                                        %>
                                                        <ul class="shop-w__category-list gl-scroll">
                                                            <li>

                                                                <a href="shopnow.jsp?category=<%=category.getCategoryId()%>"><%=category.getCategoryTitle()%></a>

                                                               
                                                        </ul>
                                                    <%}%>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    
                    <!-- Show product -->
                    
                    <div class="col-lg-9 col-md-12">
                        <div class="shop-p__meta-wrap u-s-m-b-60">
                            <div class="shop-p__meta-text-2">

                                <span style="color:black;">Number of products is:</span>

                                <a class="gl-tag btn--e-brand-shadow" href="#"><%=list.size()%></a>
                            </div>
                        </div>
                            <div class="shop-p">

                                <div class="shop-p__collection">
                                    <div class="row is-grid-active">
                                       <!-- Traversing products -->
                                       <%for(Product product:list){
                                       %>
                                        <div class="col-lg-4 col-md-6 col-sm-6">
                                            <div class="product-m">
                                                <div class="product-m__thumb">

                                                    <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                        <img class="aspect__img" src="img/products/<%=product.getpPhoto()%>" alt=""></a>
                                                    <div class="product-m__quick-look">

                                                        <a class="fas fa-search" data-modal="modal" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="" data-original-title="Quick Look"></a></div>
                                                    <div class="product-m__add-cart">

                                                        <a class="btn--e-brand" data-modal="modal" data-modal-id="#add-to-cart" onclick="add_to_cart(<%=product.getpId()%>,'<%=product.getpName()%>',<%=product.getPriceAfterApplyingDiscount()%>)">Add to Cart</a></div>
                                                </div>
                                                <div class="product-m__content">
                                                    <div class="product-m__name">

                                                        <a href=""><%=product.getpName()%></a></div>
                                                    <div class="product-m__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i>

                                                        <span class="product-m__review">(<%=product.getpQuantity()%>)</span></div>
                                                        <div class="product-m__price"><%=product.getpPrice()%>&#8363;
                                                            <%
                                                                if(product.getpDiscount()==0)
                                                                {
                                                             %>
                                                               <% }
                                                                else
                                                                {
                                                               %>
                                                               <span class="gl-tag-sale tag-sale"><span class="price-first"><%=product.getPriceAfterApplyingDiscount()%>&#8363;/</span><%=product.getpDiscount()%>% off</span>
                                                               <% }
                                                            %>
                                                           
                                                        </div>
                                                    <div class="product-m__hover">
                                                        <div class="product-m__preview-description">

                                                            <span><%=product.getpDesc()%></span></div>
                                                        <div class="product-m__wishlist">

                                                            <a class="far fa-heart" href="#" data-tooltip="tooltip" data-placement="top" title="" data-original-title="Add to Wishlist"></a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}
                                            if(list.size() ==0)
                                            {
                                               out.println("No item in this category");
                                            }
                                        %>

                                    </div>
                                </div>
                                <div class="u-s-p-y-60">

                                    <!--====== Pagination ======-->
                                    <ul class="shop-p__pagination">
                                        <li class="is-active">

                                            <a href="shop-side-version-2.html">1</a></li>
                                        <li>

                                            <a href="shop-side-version-2.html">2</a></li>
                                        <li>

                                            <a href="shop-side-version-2.html">3</a></li>
                                        <li>

                                            <a href="shop-side-version-2.html">4</a></li>
                                        <li>

                                            <a class="fas fa-angle-right" href="shop-side-version-2.html"></a></li>
                                    </ul>
                                    <!--====== End - Pagination ======-->
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp"%>
        
        <%@include file="components/fixjs.html"%>
    </body>
</html>
