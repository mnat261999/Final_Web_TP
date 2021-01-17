/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.final_web.servlets;

import com.mycompany.final_web.dao.UserDao;
import com.mycompany.final_web.entities.User;
import com.mycompany.final_web.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thu26
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            //coding area
            String email =request.getParameter("email");
            String passsword =request.getParameter("password");
            
            //validations
            
            //authenticating user
            UserDao userDao=new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(email, passsword);
            //System.out.print(user);
            HttpSession httpSession = request.getSession();
            if(user==null)
            {
                httpSession.setAttribute("message", "Invalid!!");
                response.sendRedirect("login.jsp");
                return;
            }
            else
            {
                out.print("<h1>Welcome "+user.getUserName()+"</h1>");
                //login
                httpSession.setAttribute("current-user", user);
                if(user.getUserType().equals("admin"))
                {
                    response.sendRedirect("admin.jsp");
                }
                else if(user.getUserType().equals("normal"))
                {
                    response.sendRedirect("index.jsp");
                }
                else{
                    out.println("We have not indentified user type");
                }
                //admin.jsp
                
                //normal.jsp
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
