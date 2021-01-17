<%@page import="com.mycompany.final_web.entities.User"%>
<%
    User user1 =(User)session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand">Admin Panel</a>
                <div class="nav justify-content-end" id="navbarNavDarkDropdown">
                          <ul class="navbar-nav">
                              <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                               <li class="nav-item dropdown">
                                    <%
                                            if(user1 == null)
                                            {
                                                %>
                                                <a class="nav-link" href="#" data-toggle="dropdown"> <i class="fas fa-user-circle"></i> </a>
                                                <%
                                            }
                                            else{
                                                %>
                                                <a class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown"><i class="fas fa-user-circle"></i><span style="margin-left:3px;"><%= user1.getUserName()%></span></a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="#">Profile</a></li>
                                                        <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                                                    </ul>
                                                <%

                                            }
                                     %>
                                    
                               </li>
                           </ul>
                </div>
            </div>
        </nav>