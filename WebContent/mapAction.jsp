<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.covid19.db.CovidVo"%>
<%@page import="org.covid19.db.CovidDao"%>

<%
String placename = (String)request.getParameter("name");
String phone = (String)request.getParameter("number");
String address1 = (String)request.getParameter("sido");
String address2 = (String)request.getParameter("sigungu");
String address3 = (String)request.getParameter("juso");
CovidDao dao = new CovidDao();
JSONArray jList = dao.search(placename, phone, address1, address2, address3);

System.out.println(jList.toString());
%>

<%= jList %>