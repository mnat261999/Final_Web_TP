/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.final_web.servlets;

import com.mycompany.final_web.entities.User;
import com.mycompany.final_web.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author thu26
 */
public class RegisterServlet extends HttpServlet {

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
            try {
                String userName =request.getParameter("user_name");
                String userEmail =request.getParameter("user_email");
                String userPassword =request.getParameter("user_password");
                String userPhone =request.getParameter("user_phone");
                String userAddress =request.getParameter("user_address");
                
                //validations
                if(userName.isEmpty())
                {
                    HttpSession httpSession = request.getSession();
                 httpSession.setAttribute("message", "You must name!!");
                 response.sendRedirect("register.jsp");
                    return;
                }
                if(userEmail.isEmpty())
                {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "You must email!!");
                    response.sendRedirect("register.jsp");
                    return;
                }
                if(userPassword.isEmpty())
                {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "You must password!!");
                    response.sendRedirect("register.jsp");
                    return;
                }
                if(userPhone.isEmpty())
                {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "You must phone!!");
                    response.sendRedirect("register.jsp");
                    return;
                }
                if(userAddress.isEmpty())
                {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "You must address!!");
                    response.sendRedirect("register.jsp");
                    return;
                }
                
                //creating user object to store data
                 User user  = new User(userName, userEmail, userPassword, userPhone,"default.jpg", userAddress,"normal");
                 Session hibernateSession = FactoryProvider.getFactory().openSession();
                 Transaction tx = hibernateSession.beginTransaction();
                 
                 int userId= (int) hibernateSession.save(user);
                 
                 tx.commit();
                 hibernateSession.close();
                 
                 HttpSession httpSession = request.getSession();
                 httpSession.setAttribute("message", "Registration Successful !!");
                 
                 response.sendRedirect("register.jsp");
                 return;
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("test"+e);
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
