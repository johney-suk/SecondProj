package org.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.reservation.util.*;

public class ReservationDao {

	static String SELECT_ALL = "SELECT * FROM RESERV ORDER BY NO DESC";
	static String SELECT_ONE = "SELECT * FROM RESERV WHERE NO=?";
	static String UPDATE = "UPDATE RESERV SET NAME=?, JUMIN=?, TEL=?, SYMPTOMS=?, DATE=?, TIME=?, LOCATION=? WHERE NO=?";
	static String DELETE = "DELETE FROM RESERV WHERE NO=?";
	static String INSERT = "INSERT INTO RESERV(NAME, JUMIN, TEL, SYMPTOMS, DATE, TIME, Location) VALUES(?,?,?,?,?,?,?)";
	static String INSERT1 = "INSERT INTO RESERV(NAME, JUMIN, TEL, SYMPTOMS, LOCATION) VALUES(?,?,?,?,?)";
	static String INSERT2 = "INSERT INTO RESERV(DATE, TIME) VALUES(?,?)";
	static String INSERT3 = "INSERT INTO RESERV(TIME) VALUES(?)";

	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;

	public static ArrayList<ReservationDto> selectAll() {
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(SELECT_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt(1);
				String name = rs.getString(2);
				String jumin = rs.getString(3);
				String tel = rs.getString(4);
				String symptoms = rs.getString(5);
				String date = rs.getString(6);
				String time = rs.getString(7);
				String location = rs.getString(8);
				list.add(new ReservationDto(no, name, jumin, tel, symptoms, date, time, location));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return list;
	}

	public static ReservationDto selectOne(ReservationDto dto) {
		ReservationDto reserv = null;
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(SELECT_ONE);
			pstmt.setInt(1, dto.getNo());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				reserv = new ReservationDto();
				reserv.setNo(rs.getInt(1));
				reserv.setName(rs.getString(2));
				reserv.setJumin(rs.getString(3));
				reserv.setTel(rs.getString(4));
				reserv.setSymptoms(rs.getString(5));
				reserv.setDate(rs.getString(6));
				reserv.setTime(rs.getString(7));
				reserv.setLocation(rs.getString(8));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return reserv;
	}

	public static void insert(ReservationDto dto) {
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getJumin());
			pstmt.setString(3, dto.getTel());
			pstmt.setString(4, dto.getSymptoms());
			pstmt.setString(5, dto.getDate());
			pstmt.setString(6, dto.getTime());
			pstmt.setString(7, dto.getLocation());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				conn.commit();
				System.out.println("insert 완료");
			} else {
				System.out.println("insert 실패!");
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}

// no, name, jumin, symptoms, date, time
	public static void update(ReservationDto dto) {
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(UPDATE);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getJumin());
			pstmt.setString(3, dto.getTel());
			pstmt.setString(4, dto.getSymptoms());
			pstmt.setString(5, dto.getDate());
			pstmt.setString(6, dto.getTime());
			pstmt.setString(7, dto.getLocation());
			pstmt.setInt(8, dto.getNo());
			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}

	public static void delete(ReservationDto dto) {
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, dto.getNo());
			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}

	public static void insert3(ReservationDto dto) {
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, dto.getTime());
			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				conn.commit();
				System.out.println("insert 완료");
			} else {
				System.out.println("insert 실패!");
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}

//	public static boolean duplication(String tel) {
//		conn = JdbcUtil.getConnection();
//		String dup = "select tel from reserv where tel=?";
//		try {
//			pstmt = conn.prepareStatement(dup);
//			pstmt.setString(1, tel);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				return false;
//			} else {
//				return true;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			JdbcUtil.close(conn, pstmt, rs);
//		}
//		return false;
//	}
//	
	public static int duplication(String tel) {
		conn = JdbcUtil.getConnection();
		String dup = "select tel from reserv where tel=?";
		try {
			pstmt = conn.prepareStatement(dup);
			pstmt.setString(1, tel);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1; // 중복
			} else {
				return 0; // 중복 x
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return -2;  // 디비오류
	}

}
