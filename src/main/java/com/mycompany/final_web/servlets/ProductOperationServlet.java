/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.final_web.servlets;

import com.mycompany.final_web.dao.CategoryDao;
import com.mycompany.final_web.dao.ProductDao;
import com.mycompany.final_web.entities.Category;
import com.mycompany.final_web.entities.Product;
import com.mycompany.final_web.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author thu26
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

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
            
            //servlet 2:
            //add category
            //add product
            String op=request.getParameter("operation");
            if(op.trim().equals("addcategory"))
            {
                //add category
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                Category category=new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                
                //category database save:
                CategoryDao categoryDao =new CategoryDao(FactoryProvider.getFactory());
                int catId=categoryDao.saveCategory(category);
                //out.println("Category Saved");
                HttpSession httpSesion=request.getSession();
                httpSesion.setAttribute("message_admin", "Category added successfully");
                response.sendRedirect("admin.jsp");
                return;
            }else if(op.trim().equals("addproduct"))
            {
                //add product
                String pName=request.getParameter("pName");
                String pDesc=request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");
                Product p=new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                //get category by id
                CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdoa.getCategoryById(catId);
                
                p.setCategory(category);
                
                //product save...
                ProductDao pdao =new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                
                
                //pic uplaod
                //find out the path to upload photo
                String path = request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                System.out.println(path);
                
                
                try {
                   
                //uploading code
                FileOutputStream fos = new FileOutputStream(path);
                
                InputStream is = part.getInputStream();
                
                //reading data
                byte[] data = new byte [is.available()];
                is.read(data);
                
                //writing data
                fos.write(data);
                fos.close();
                }catch (Exception e) {
                    e.printStackTrace();
                }
                //out.println("Product Saved");
                HttpSession httpSesion=request.getSession();
                httpSesion.setAttribute("message_admin", "Product added successfully");
                response.sendRedirect("admin.jsp");
                return;
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
