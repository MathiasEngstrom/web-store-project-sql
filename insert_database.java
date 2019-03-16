package x2insert;

import java.sql.DriverManager;
import java.sql.*;
import java.util.Scanner;

public class X2Insert {

    static final String URL = "jdbc:mysql://back.db1.course.it.uu.se/fall17_project_x2";
    static final String USERNAME = "fall17_x2";
    static final String PASSWORD = "0yTbKE00";
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement stmt = conn.prepareStatement(
                "SELECT Product_ID, Discount " +  //Actual price
                        "FROM Product " +
                        "WHERE Product_ID = ?"
        ); 
        PreparedStatement stmt2 = conn.prepareStatement(
                "UPDATE Product " +
                        "SET Discount = ?" + 
                        "WHERE Product_ID =  ?"
        );
        
        Scanner scanner = new Scanner(System.in);
        
        while (true) 
        { 
            System.out.printf("Enter product id (0 to exit): ");
            int productId = scanner.nextInt();
            if (productId == 0)
            {
                break;
            }
            
            stmt.setInt(1, productId);
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next())
            {
                System.out.printf(
                        "%4d | %15s\n",
                        rs.getInt(1),
                        rs.getString(2)
                );
            }
            
            
            System.out.printf("Enter products new discount, (enter percent of"
                    + " price, i.e 1 is full price and 0,7 is a "
                    + "30 percent discount (0 to exit): ");
            float productDiscount = scanner.nextFloat();
            if(productDiscount == 0)
            {
                break;
            }
            
            stmt2.setFloat(1, productDiscount);
            stmt2.setInt(2, productId);
            
            stmt2.executeUpdate();
            
            ResultSet rs2 = stmt.executeQuery();
            while (rs2.next())
            {
                System.out.printf(
                        "%4d | %15s\n",
                        rs2.getInt(1),
                        rs2.getString(2)
                );
            }
            rs.close();
            rs2.close();
        }
        stmt.close();
        stmt2.close();
        conn.close();
          
    }
}
