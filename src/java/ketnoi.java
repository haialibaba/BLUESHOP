
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author DELL
 */
public class ketnoi {
    private static String DB_URL = "jdbc:mysql://localhost:3306/qlbddt";
    private static String USER_NAME = "root";
    private static String PASSWORD = "";
  
    public static void main(String args[]) {
       String query = "SELECT * FROM category"; // Thay your_table_name bằng tên bảng của bạn
        ResultSet resultSet = queryData(query);
        if (resultSet != null) {
            try {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id"); // Thay "id" bằng tên cột trong bảng của bạn
                    String name = resultSet.getString("name"); // Thay "name" bằng tên cột trong bảng của bạn
                    System.out.println("ID: " + id + ", Name: " + name);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Query failed or no data found.");
        }
    }
    public static ResultSet queryData(String query) {
        try {
            java.sql.Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            ResultSet rs = stmt.executeQuery(query);
            return rs;
        } catch (Exception e) {

        }
        return null;
    }
    public static java.sql.Connection getConnection(String dbURL, String userName, 
            String password) {
        java.sql.Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, userName, password);
//            System.out.println("connect successfully!");
        } catch (Exception ex) {
            System.out.println("connect failure!");
            ex.printStackTrace();
        }
        return conn;
    }
}
