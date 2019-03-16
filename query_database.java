package javaapplication2;
import java.sql.*;
import java.util.Scanner;

public class JavaApplication2 {

    static final String URL = "jdbc:mysql://back.db1.course.it.uu.se/fall17_project_x2";
    static final String USERNAME = "fall17_x2";
    static final String PASSWORD = "0yTbKE00";
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement pstmt = conn.prepareStatement(
                "SELECT Product_ID, Product_title, Price_without_tax*Tax*Discount " +  //Actual price
                        "FROM Product " +
                        "WHERE Product.Department_ID = ?"
        );
        
        Scanner scanner = new Scanner(System.in);
        
        while (true)
        {
            System.out.printf("Enter department id (0 to exit): ");
            int departmentId = scanner.nextInt();
            if (departmentId == 0)
            {
                break;
            }
            
            pstmt.setInt(1, departmentId);
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next())
            {
                System.out.printf(
                        "%4d | %32s | %32s\n",
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
            }
            rs.close();
            }
        
        pstmt.close();
        conn.close();
        
        }
    }
