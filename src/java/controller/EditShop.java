/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ShopDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Shop;

/**
 *
 * @author pqtru
 */
public class EditShop extends HttpServlet {
   
    private static final long serialVersionUID = 1L;
    private ShopDAO shopDAO;

    @Override
    public void init() {
        shopDAO = new ShopDAO(); // Khởi tạo DAO
    }

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int shopId = Integer.parseInt(request.getParameter("id"));
        Shop shop = shopDAO.getShopId(shopId);
        
        if (shop != null) {
            request.setAttribute("shop", shop);  
            request.getRequestDispatcher("editshop.jsp").forward(request, response); 
        } else {
            response.sendRedirect("page-list-shop.jsp");  
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int shopId = Integer.parseInt(request.getParameter("shop_id"));
        String shopName = request.getParameter("shop_name");
        
        String shopAddress = request.getParameter("shop_address");
        String shopPhone = request.getParameter("shop_phone");
        String shopEmail = request.getParameter("shop_email");
        String shopOpening = request.getParameter("shop_opening_hours");
        String shopLogo = request.getParameter("shop_logo");

        
        Shop shop = new Shop(shopId, shopName, 
                shopAddress, shopPhone, shopEmail, shopOpening, shopLogo);
        
        
        shopDAO.updateShop(shop);

        
        response.sendRedirect("ListShop");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
