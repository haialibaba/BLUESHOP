package controller;

import java.io.IOException;
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

@WebServlet(name = "CartController", urlPatterns = { "/Cart" })
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Get the current session or create a new one if it doesn't exist
            HttpSession session = request.getSession(true);

            if (session != null) {
                // Retrieve the product IDs stored in the session
                List<String> cartItems = (List<String>) session.getAttribute("cart");

                if (cartItems != null) {
                    // Create a list to store product models
                    List<ProductMODEL> productsInCart = new ArrayList<>();

                    // Retrieve product details for each product ID in the cart
                    ProductDAO productDAO = new ProductDAO();

                    for (String productId : cartItems) {
                        ProductMODEL product = productDAO.getProductById(productId);
                        if (product != null) {
                            productsInCart.add(product);
                        }
                    }

                    // Set the list of product models as an attribute in the request
                    request.setAttribute("productsInCart", productsInCart);

                    // Forward the request to Cart.jsp to display the cart contents
                    request.getRequestDispatcher("Cart.jsp").forward(request, response);
                } else {
                    // Handle the case where the cart is empty
                    response.getWriter().write("Your cart is empty.");
                }
            } else {
                // Handle the case where the session is empty
                response.getWriter().write("Your cart is empty.");
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String removeProductId = request.getParameter("removeProduct");

        // Check if the removeProduct parameter is not null
        if (removeProductId != null) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                List<String> cartItems = (List<String>) session.getAttribute("cart");
                if (cartItems != null) {
                    cartItems.remove(removeProductId);
                    // Update the session's cart
                    session.setAttribute("cart", cartItems);
                    // response.sendRedirect(request.getRequestURI());
                }
            }
        }
        

    }

    @Override
    public String getServletInfo() {
        return "Cart Controller";
    }
}
