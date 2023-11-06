/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import util.DBUtil;

public class PaymentDAO {
    public String checkQuantity(List<Integer> productID, List<Integer> quantities) throws SQLException {
        Connection conn = null;
        PreparedStatement statementSanphamChinh = null;
        PreparedStatement statementSanphamNhaCungCap = null;
        List<Integer> insufficientProducts = new ArrayList<>(); // Danh sách sản phẩm không đủ số lượng

        try {
            conn = new MySQLConnect().getConnection();
            conn.setAutoCommit(false); // Tắt chế độ tự động commit để cập nhật số lượng sản phẩm

            for (int i = 0; i < productID.size(); i++) {
                int productId = productID.get(i);
                int quantity = quantities.get(i);

                // Kiểm tra số lượng sản phẩm trong bảng sanphamchinh
                String querySanphamChinh = "SELECT spc.id_spncc AS product_id, spc.quantity AS available_quantity "
                        + "FROM sanphamchinh spc "
                        + "WHERE spc.id = ?";
                statementSanphamChinh = conn.prepareStatement(querySanphamChinh);
                statementSanphamChinh.setInt(1, productId);

                try (ResultSet rs = statementSanphamChinh.executeQuery()) {
                    if (rs.next()) {
                        int availableQuantity = rs.getInt("available_quantity");
                        if (availableQuantity < quantity) {
                            insufficientProducts.add(productId); // Thêm sản phẩm không đủ số lượng vào danh sách
                        } else {
                            // Cập nhật số lượng sản phẩm trong bảng sanphamchinh
                            int newQuantitySanphamChinh = availableQuantity - quantity;
                            String updateQuerySanphamChinh = "UPDATE sanphamchinh SET quantity = ? WHERE id = ?";
                            PreparedStatement updateStatementSanphamChinh = conn
                                    .prepareStatement(updateQuerySanphamChinh);
                            updateStatementSanphamChinh.setInt(1, newQuantitySanphamChinh);
                            updateStatementSanphamChinh.setInt(2, productId);
                            updateStatementSanphamChinh.executeUpdate();
                        }
                    } else {
                        return "Không tìm thấy sản phẩm có ID " + productId + " trong bảng sanphamchinh.";
                    }
                }

                // Kiểm tra số lượng sản phẩm trong bảng sanphamnhacungcap
                String querySanphamNhaCungCap = "SELECT snc.id AS product_id, snc.quantity AS available_quantity "
                        + "FROM spncc snc "
                        + "WHERE snc.id = ?";
                statementSanphamNhaCungCap = conn.prepareStatement(querySanphamNhaCungCap);
                statementSanphamNhaCungCap.setInt(1, productId);

                try (ResultSet rs = statementSanphamNhaCungCap.executeQuery()) {
                    if (rs.next()) {
                        int availableQuantity = rs.getInt("available_quantity");
                        if (availableQuantity < quantity) {
                            insufficientProducts.add(productId); // Thêm sản phẩm không đủ số lượng vào danh sách
                        } else {
                            // Cập nhật số lượng sản phẩm trong bảng sanphamnhacungcap
                            int newQuantitySanphamNhaCungCap = availableQuantity - quantity;
                            String updateQuerySanphamNhaCungCap = "UPDATE spncc SET quantity = ? WHERE id = ?";
                            PreparedStatement updateStatementSanphamNhaCungCap = conn
                                    .prepareStatement(updateQuerySanphamNhaCungCap);
                            updateStatementSanphamNhaCungCap.setInt(1, newQuantitySanphamNhaCungCap);
                            updateStatementSanphamNhaCungCap.setInt(2, productId);
                            updateStatementSanphamNhaCungCap.executeUpdate();
                        }
                    } else {
                        return "Không tìm thấy sản phẩm có ID " + productId + " trong bảng sanphamnhacungcap.";
                    }
                }
            }

            if (!insufficientProducts.isEmpty()) {
                // Tạo thông báo về sản phẩm không đủ số lượng
                StringBuilder insufficientProductMessage = new StringBuilder("Sản phẩm không đủ số lượng có ID: ");
                for (int productId : insufficientProducts) {
                    insufficientProductMessage.append(productId).append(", ");
                }
                insufficientProductMessage.deleteCharAt(insufficientProductMessage.length() - 2); // Xóa dấu phẩy cuối
                                                                                                  // cùng
                return insufficientProductMessage.toString();
            }

            conn.commit(); // Thực hiện commit để lưu các cập nhật vào cơ sở dữ liệu
            return "Thanh toán thành công";
        } catch (SQLException e) {
            if (conn != null) {
                conn.rollback(); // Rollback nếu có lỗi xảy ra
            }
            e.printStackTrace();
            return "Lỗi khi kiểm tra số lượng sản phẩm.";
        } finally {
            if (conn != null) {
                conn.setAutoCommit(true); // Bật lại chế độ tự động commit
                conn.close();
            }
        }
    }
}
