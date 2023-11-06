/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ProductMODEL;
import dao.ProductDAO;

/**
 *
 * @author dhuynh
 */
@WebServlet(name = "ProductDetailsController", urlPatterns = { "/details" })
public class ProductDetailsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String productId = request.getParameter("productId");
            HttpSession session = request.getSession(); // Get the current session or create a new one if it doesn't
                                                        // exist

            if (productId != null) {
                // Call the ProductService to fetch the product details by productId
                ProductDAO proDAO = new ProductDAO();
                ProductMODEL product = proDAO.getProductById(productId);

                if (product != null) {

                    String action = request.getParameter("action");
                    if (action != null && action.equals("addtocart")) {
                        // Retrieve the user's shopping cart from the session
                        List<String> cartItems = (List<String>) session.getAttribute("cart");

                        if (cartItems == null) {
                            // If the cart doesn't exist in the session, create a new one
                            cartItems = new ArrayList<>();
                        }
                        if (cartItems.contains(productId)) {
                            // Product is already in the cart, display an alert message
                            response.getWriter().write("Product is already in the cart.");
                        } else {
                            // Add the productId to the cart
                            cartItems.add(productId);

                        }
                        // Store the updated cart in the session
                        session.setAttribute("cart", cartItems);
                        
                        
                    }
                    request.setAttribute("product", product);
                    // Forward the request to the product details JSP view
                    request.getRequestDispatcher("product_details.jsp").forward(request, response);
                    
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
