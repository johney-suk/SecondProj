<%@page import="org.reservation.login.LoginDto"%>
<%@page import="org.reservation.login.LoginDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 페이지</title>
</head>
<body>
	<%
	
	String userID = null;
	if (session.getAttribute("ID") != null) {
		userID = (String) session.getAttribute("ID");
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인되어있습니다.')");
		script.println("location.href = 'reserv_list.jsp'");
		script.println("</script>");
	}
	


	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");
	
//	System.out.println(ID+PW);
	
	LoginDao dao = new LoginDao();
	LoginDto dto = new LoginDto(ID,PW);
	int result = dao.login(dto);

	
	if (result == 1) { 
		session.setAttribute("ID", ID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 성공')");
		script.println("location.href = 'reserv_list.jsp'");
		script.println("</script>");
		
	} else if (result == 0) { // 해당 아이디에 맞지 않은 pw
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
		
	} else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디를 확인해주세요.')");
		script.println("location.href = 'reserv_login.jsp'");
		script.println("</script>");
		
		
	} else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 비밀번호 둘다 입력하지 않으셨습니다.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>