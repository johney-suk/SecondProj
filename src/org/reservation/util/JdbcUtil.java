package org.reservation.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {
	static String url = "jdbc:mariadb://localhost:3306/2nd_project";
	static String user = "admin";
	static String password = "1234";
	static Connection conn = null;

	public static Connection getConnection() {
		try {
			//Server server = Server.createTcpServer(null).start();
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("드라이버 검색 성공");
			conn = DriverManager.getConnection(url, user, password);
			 System.out.println(conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("접속 실패");
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(Connection conn) {
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		close(rs);
		close(stmt);
		close(conn);
	}


}