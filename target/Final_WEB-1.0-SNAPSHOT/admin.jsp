<%@page import="java.util.Map"%>
<%@page import="com.mycompany.final_web.helper.Helper"%>
<%@page import="com.mycompany.final_web.dao.UserDao"%>
<%@page import="com.mycompany.final_web.entities.Product"%>
<%@page import="com.mycompany.final_web.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.final_web.entities.Category"%>
<%@page import="com.mycompany.final_web.dao.CategoryDao"%>
<%@page import="com.mycompany.final_web.helper.FactoryProvider"%>
<%@page import="com.mycompany.final_web.entities.User"%>
<%
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message", "You are not logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(user.getUserType().equals("normal"))
        {
            session.setAttribute("message", "You are not admin!! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%
    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
    List<Category> list= cdao.getCategories();
// getting count 
    Map<String,Long> m= Helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="components/common-css-js-admin.html"%> 
    </head>
    <body>
        <%@include file="components/navbar_admin.jsp"%>
        <div class="container admin">
            
            <div class="container-fluid mt-3">
                <%@include file="components/message_admin.jsp"%>
            </div>
            
            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#list-user-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/icons8-conference-100.png" alt="users">
                            </div>
                            <h1><%= m.get("userCount")%></h1>
                            <h1 class="text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/icons8-categorize-100.png" alt="categories">
                            </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" data-toggle="modal" data-target="#list-product-modal">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/icons8-product-100.png" alt="product">
                            </div>
                            <h1><%= m.get("productCount")%></h1>
                            <h1 class="text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/icons8-add-property-100.png" alt="users">
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-poduct-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/icons8-add-to-collection-100.png" alt="categories">
                            </div>
                            <p class="mt-2">Click here to add new product</p>
                            <h1 class="text-muted">Add Product</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <!-- add category modal -->

            <!-- Modal -->
            <div id="add-category-modal" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-light">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category detail</h5>
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
                            </div>
                            
                            <div class="form-group">
                                <textarea class="form-control" style="height: 300px;" name="catDescription" placeholder="Enter category description" required></textarea>
                            </div>
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- end add category modal -->
        
        
        
         <!-- add product modal -->
         <div id="add-poduct-modal" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-light">
                        <h5 class="modal-title" id="exampleModalLabel">Product detail</h5>
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                            
                            <!-- product title -->
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter product name" required/>
                            </div>
                             
                            <!-- product price -->
                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter product price" required/>
                            </div>
                            
                            <!-- product discount -->
                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required/>
                            </div>
                            
                            <!-- product quantity -->
                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required/>
                            </div>
                            
                            
                            <!-- category for product -->
                         
                            <div class="form-group">
                                <select class="form-control" name="catId" id="">
                                    <%
                                        for(Category c:list){
                                    %>
                                    
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                    <%}%>
                                </select>
                            </div>
                            
                                <!-- product pic -->
                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required/>
                            </div>
                            
                                <!-- product desc -->
                            <div class="form-group">
                                <textarea class="form-control" style="height: 300px;" name="pDesc" placeholder="Enter product description" required></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
          <!-- end add product modal -->

    
         
         
      
                  
           <div id="list-user-modal" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl " role="document">
                <div class="modal-user modal-content" style="width: 112%; right: 6%;">
                    <div class="modal-header bg-dark text-light">
                        <h5 class="modal-title" id="exampleModalLabel">List Users</h5>
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="DeleteUserSerVlet" method="post">
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">User Id</th>
                                        <th scope="col">User Name</th>
                                        <th scope="col">User Email</th>
                                        <th scope="col">User Address</th>
                                        <th scope="col">User Password</th>
                                        <th scope="col">User Phone</th>
                                        <th scope="col">User Pic</th>
                                        <th scope="col">User Type</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                UserDao udao=new UserDao(FactoryProvider.getFactory());
                                List<User> ulist= udao.getAllUsers();
                                
                                    %>
                                    
                                        <%
                                            for(User u:ulist){%>
                                            <tr>
                                                <th scope="row"><%=u.getUserId()%></th>
                                                <input type="hidden" name="userId" value="<%=u.getUserId()%>">
                                                
                                                <td><%=u.getUserName()%></td>
                                                <input type="hidden" name="userName" value="<%=u.getUserName()%>">
                                                
                                                <td name="userEmail"><%=u.getUserEmail()%></td>
                                                <input type="hidden" name="userEmail" value="<%=u.getUserEmail()%>">
                                                
                                                <td name="userAddress"><%=u.getUserAddress()%></td>
                                                <input type="hidden" name="userAddress" value="<%=u.getUserAddress()%>">
                                                
                                                <td name="userPassword"><%=u.getUserPassword()%></td>
                                                <input type="hidden" name="userPassword" value="<%=u.getUserPassword()%>">
                                                
                                                <td name="userPhone"><%=u.getUserPhone()%></td>
                                                <input type="hidden" name="userPhone" value="<%=u.getUserPhone()%>">
                                                
                                                <td name="userPic"><%=u.getUserPic()%></td>
                                                <input type="hidden" name="userPic" value="<%=u.getUserPic()%>">
                                                
                                                <td name="userType"> <%=u.getUserType()%></td>
                                                <input type="hidden" name="userType" value="<%=u.getUserType()%>">
                                                
                                                <td>
                                                    <button class="btn btn-danger fas fa-trash"></button>
                                                    
                                                </td>
                                            </tr>
                                            <%}
                                        %>
                                        
                                    
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>   
                                        
                                        
                                        
                                        
                                        
                                        
        <div id="list-product-modal" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl " role="document">
                <div class="modal-user modal-content" style="width: 112%; right: 6%;">
                    <div class="modal-header bg-dark text-light">
                        <h5 class="modal-title" id="exampleModalLabel">List Products</h5>
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="DeleteProductServlet" method="post">
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Product Id</th>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Product Price</th>
                                        <th scope="col">Product Quantity</th>
                                        <th scope="col">Product Description</th>
                                        <th scope="col">Product Photo</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                                List<Product> plist= pdao.getAllProducts();
                                    %>
                                    
                                        <%
                                            for(Product p:plist){%>
                                            <tr>
                                                <th scope="row"><%=p.getpId()%></th>
                                                <input type="hidden" name="pId" value="<%=p.getpId()%>">
                                                

                                                
                                                <td><%=p.getpName()%></td>
                                                <input type="hidden" name="pName" value="<%=p.getpName()%>">
                                                
                                                <td><%=p.getpPrice()%></td>
                                                <input type="hidden" name="pPrice" value="<%=p.getpPrice()%>">
                                                
                                                <td><%=p.getpQuantity()%></td>
                                                <input type="hidden" name="pQuantity" value="<%=p.getpQuantity()%>">
   
                                              
                                                <td><%=p.getpDesc()%></td>
                                                <input type="hidden" name="pDesc" value="<%=p.getpDesc()%>">
                                                                                                <th><%=p.getpPhoto()%></th>
                                                <input type="hidden" name="pPhoto" value="<%=p.getpPhoto()%>">
                                                <td>
                                                    <button class="btn btn-danger fas fa-trash"></button>
                                                    
                                                </td>
                                            </tr>
                                            <%}
                                        %>
                                        
                                    
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>                                 

    </body>

</html>
