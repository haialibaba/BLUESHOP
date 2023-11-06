package dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;


public class testPayment {
    public String checkQuantity(List<Integer> productID, List<Integer> quantities) throws SQLException{
        try (Connection conn = new MySQLConnect().getConnection()){
            String query = "SELECT spc.id AS product_id, spc.quantity AS available_quantity "
                 + "FROM sanphamchinh spc "
                 + "WHERE spc.id = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            
            for (int i = 0; i < productID.size(); i++) {
                int productId = productID.get(i);
                int quantity = quantities.get(i);

                statement.setInt(1, productId);
                try (ResultSet rs = statement.executeQuery()) {
                    if (rs.next()) {
                        int availableQuantity = rs.getInt("available_quantity");
                        if (availableQuantity < quantity) {
                            return "Sản phẩm có ID " + productId + " không có đủ số lượng.";
                        }
                    } else {
                        return "Không tìm thấy sản phẩm có ID " + productId + ".";
                    }
                }
            }
            return "Thanh toán thành công";
            
        } catch (Exception e) {
            e.printStackTrace();
            return "Lỗi khi kiểm tra số lượng sản phẩm.";
        }
    }
    
    public static void insertInvoice(String phoneNumber, String address){
        try (Connection conn = MySQLConnect.getConnection()){
            String getMaxIdQuery = "SELECT MAX(id) FROM hoadon";
            PreparedStatement statement = conn.prepareStatement(getMaxIdQuery);
            ResultSet rs = statement.executeQuery();            
            
            int currentMaxId = 0;

            if (rs.next()) {
                currentMaxId = rs.getInt(1);
            }
            
            int newID = currentMaxId + 1;
            
            String sql = "INSERT INTO hoadon (id, phone, address, createdAt, updatedAt, status) VALUES (?, ?, ?, NOW(), NOW(), 4)";
            
            try (PreparedStatement st = conn.prepareStatement(sql)) {
                st.setInt(1, newID);
                st.setString(2, phoneNumber);
                st.setString(3, address);

                int rowsInserted = st.executeUpdate(); // Thực hiện câu lệnh SQL

                if (rowsInserted > 0) {
                System.out.println("Thanh toán thành công, ID của hóa đơn mới là: " + newID);
                } else {
                System.out.println("Thanh toán thất bại.");
                } 
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Đăng ký tài khoản thất bại");           
        }
    }
    
    public static void insertInvoiceDetail(int id_hoadon, List<InvoiceDetail> details){
        try (Connection conn = MySQLConnect.getConnection()){
            String getMaxIdQuery = "SELECT MAX(id) FROM cthd";
            PreparedStatement statement = conn.prepareStatement(getMaxIdQuery);
            ResultSet rs = statement.executeQuery();
            
            int currentMaxId = 0;

            if (rs.next()) {
                currentMaxId = rs.getInt(1);
            }
            
            currentMaxId ++;
            String sql = "INSERT INTO cthd (id, id_hoadon, id_spc, id_user, quantity, price) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement st = conn.prepareStatement(sql)) {
                for(InvoiceDetail detail : details){                   
                    st.setInt(1, currentMaxId);
                    st.setInt(2, id_hoadon);
                    st.setInt(3, detail.getId_spc());
                    st.setInt(4, detail.getId_user());
                    st.setInt(5, detail.getId_user());
                    st.setInt(6, detail.getPrice());
                    st.addBatch();
                    
                    currentMaxId ++;
                }

                int[] rowsInserted = st.executeBatch(); // Thực hiện câu lệnh SQL

                if (rowsInserted.length == details.size()) {
                System.out.println("Thêm chi tiết hóa đơn thành công:");
                } else {
                System.out.println("Thêm chi tiết hóa đơn thất bại.");
                } 
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Thêm chi tiết hóa đơn thất bại");  
        }
    }
    
    public static int getIdInvoiceByPhoneNumber(String phoneNumber){
        try (Connection conn = MySQLConnect.getConnection()){
            String sql = "SELECT id FROM hoadon WHERE phone = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, phoneNumber);
            ResultSet rs = statement.executeQuery();
            
            if(rs.next()){
                return rs.getInt("id");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public static void main(String[] args) throws SQLException {
        String phoneNumber = "0327037178";
        int idHoadon = getIdInvoiceByPhoneNumber(phoneNumber);
        
        List<InvoiceDetail> details = new ArrayList<>();
        details.add(new InvoiceDetail(1, 2, 3, 1000000)); // Sản phẩm 1
        details.add(new InvoiceDetail(2, 2, 2, 5000000)); // Sản phẩm 2
        details.add(new InvoiceDetail(3, 3, 4, 800000)); // Sản phẩm 3
        
        insertInvoiceDetail(idHoadon, details);
    }
}

