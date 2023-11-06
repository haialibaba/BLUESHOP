/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ProductMODEL;
import util.DBUtil;

/**
 *
 * @author dhuynh
 */
public class ProductDAO {
    Connection conn = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public ProductDAO(){
        
    }
    

    public List<ProductMODEL> getAllProduct() {
        List<ProductMODEL> list = new ArrayList<>();
        String query = "SELECT sanphamchinh.*, spncc.*,ctbrand.*, category.name AS category_name, brand.name AS brand_name " +
                        "FROM sanphamchinh " +
                        "INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id " +
                        "INNER JOIN ctbrand ON spncc.id_ctbrand = ctbrand.id " +
                        "INNER JOIN category ON ctbrand.id_category = category.id " +
                        "INNER JOIN brand ON ctbrand.id_brand = brand.id " +
                        "LIMIT 0, 6";

        try {
            conn = new DBUtil().getConnection();//mo ket noi voi sql
            stm = conn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                ProductMODEL product = new ProductMODEL();
                product.setIdSP(rs.getString("id"));
                product.setPriceSP(rs.getDouble("price"));
                product.setQuantitySP(rs.getInt("quantity"));
                product.setId_spnccSP(rs.getString("id_spncc"));
                product.setNameSP(rs.getString("name"));
                product.setImageSP(rs.getString("image"));
                product.setImageSP1(rs.getString("image1"));
                product.setImageSP2(rs.getString("image2"));
                product.setImageSP3(rs.getString("image3"));
                product.setCategorySP(rs.getString("category_name"));
                product.setBrandSP(rs.getString("brand_name"));
                product.setDescriptionSP(rs.getString("description"));
                product.setRatingSP(rs.getDouble("rating"));
                product.setDiscountSP(rs.getInt("discount"));
                product.setId_producer(rs.getInt("id_producer"));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public ProductMODEL getProductById(String productId) {
        String query = "SELECT sanphamchinh.*, spncc.*, ctbrand.*, category.name AS category_name, brand.name AS brand_name " +
                       "FROM sanphamchinh " +
                       "INNER JOIN spncc ON sanphamchinh.id_spncc = spncc.id " +
                       "INNER JOIN ctbrand ON spncc.id_ctbrand = ctbrand.id " +
                       "INNER JOIN category ON ctbrand.id_category = category.id " +
                       "INNER JOIN brand ON ctbrand.id_brand = brand.id " +
                       "WHERE sanphamchinh.id = ?"; // Modify the query to filter by product ID

        try {
            conn = new DBUtil().getConnection(); // Open a connection to SQL
            stm = conn.prepareStatement(query);
            stm.setString(1, productId); // Set the product ID as a parameter
            rs = stm.executeQuery();

            if (rs.next()) {
                // Create and populate a Product object with the retrieved data
                ProductMODEL product = new ProductMODEL();
                product.setIdSP(rs.getString("id"));
                product.setPriceSP(rs.getDouble("price"));
                product.setQuantitySP(rs.getInt("quantity"));
                product.setId_spnccSP(rs.getString("id_spncc"));
                product.setNameSP(rs.getString("name"));
                product.setImageSP(rs.getString("image"));
                product.setImageSP1(rs.getString("image1"));
                product.setImageSP2(rs.getString("image2"));
                product.setImageSP3(rs.getString("image3"));
                product.setCategorySP(rs.getString("category_name"));
                product.setBrandSP(rs.getString("brand_name"));
                product.setDescriptionSP(rs.getString("description"));
                product.setRatingSP(rs.getDouble("rating"));
                product.setDiscountSP(rs.getInt("discount"));
                product.setId_producer(rs.getInt("id_producer"));

                return product; // Return the populated Product object
            }
        } catch (Exception e) {
            // Handle exceptions here (e.g., log or throw)
            e.printStackTrace();
        } finally {
            // Close resources (connection, statement, result set) in a finally block
            try {
                if (rs != null) rs.close();
                if (stm != null) stm.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                // Handle closing exceptions if necessary
                e.printStackTrace();
            }
        }

        return null; // Return null if the product with the specified ID is not found
    }
}
