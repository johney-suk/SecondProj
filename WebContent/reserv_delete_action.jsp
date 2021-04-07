<%@page import="org.reservation.ReservationDto"%>
<%@page import="org.reservation.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int no = Integer.parseInt(request.getParameter("no"));
ReservationDao.delete(new ReservationDto(no));

response.sendRedirect("reserv_list.jsp");
%>