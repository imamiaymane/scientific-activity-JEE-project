package DAO;
import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.SQLException;
public class SingletonConnection {
	private static Connection connection;
	//System.out.println("AAA");
	static {
		String url="jdbc:mysql://localhost:3306/gestion_ac?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String user="ouhdidou";
		String password="Mysql@ayoub21";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,password);
			System.out.println("connexion �tablie !!!");
		} 
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		return connection;
	}

}


	

