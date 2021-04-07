<%@page import="org.json.JSONObject"%>
<%@page import="org.reservation.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String tel = request.getParameter("tel");
System.out.println("확인용 입력한전화번호"+tel);

Integer chk = ReservationDao.duplication(tel);
JSONObject jObj = new JSONObject();

if(chk==0){
	jObj.put("success","가능");
	out.print(jObj);
}else if (chk == 1 || chk ==-2){
	jObj.put("success","불가능");
	out.print(jObj);
}else{}
%>