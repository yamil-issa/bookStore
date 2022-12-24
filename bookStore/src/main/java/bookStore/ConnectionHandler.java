package bookStore;
import java.sql.*;

public class ConnectionHandler {
	public static Connection getCon() {
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookStore?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC", "root", "");
			return con;
			
		}catch(Exception e)
		{
			System.out.print(e);
			return null;
		}
	}

}
