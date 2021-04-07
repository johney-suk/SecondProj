package org.reservation.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.reservation.util.JdbcUtil;

public class LoginDao {
	
	
	private static Connection conn = null;
	private static ResultSet rs = null;
	private static PreparedStatement pstmt = null;

	public int login(LoginDto dto) {

		String SQL = "SELECT PW FROM LOGIN WHERE ID = ?";
		conn = JdbcUtil.getConnection();

		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dto.getID());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(dto.getPW())) {
					return 1;
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음 오류
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류를 의미
	}
	
//	public int login(String ID, String PW) {
//		try {
//
//			PreparedStatement pstmt = conn.prepareStatement("SELECT PW FROM LOGIN WHERE ID = ?");
//			pstmt.setString(1, ID);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				return rs.getString(1).equals(PW) ? 1 : 0;
//			} else {
//				return -2;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			return -1;
//		}
//	} 
}