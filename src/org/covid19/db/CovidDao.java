package org.covid19.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.json.JSONArray;
import org.json.JSONObject;
import org.reservation.util.JdbcUtil;

public class CovidDao {
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	

	public JSONArray search(String placename, String phone, String address1, String address2, String address3) {
		conn = JdbcUtil.getConnection();
		JSONArray voList = new JSONArray();
		String sql = "SELECT SIDO, SIGUNGU, NAME, JUSO, WEEKDAY, SATURDAY, NUMBER FROM COVIDDB where sido ='" + address1 + "' and sigungu ='"
		+ address2 + "' and name like '%"+ placename +"' or number = '" + phone +"' or juso = '" + address3 + "'";
		System.out.println(placename);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JSONObject vo = new JSONObject();
				vo.put("sido", rs.getString("sido"));
				vo.put("sigungu", rs.getString("sigungu"));
				vo.put("name", rs.getString("name"));
				vo.put("juso", rs.getString("juso"));	
				vo.put("weekday", rs.getString("weekday"));
				vo.put("saturday", rs.getString("saturday"));
				vo.put("number", rs.getString("number"));
				voList.put(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return voList;
	}
}
