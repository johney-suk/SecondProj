<%@page import="org.covid19.db.CovidVo"%>
<%@page import="java.io.Console"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="shortcut icon" type="image/x-icon"
	href="https://corona-19.kr/img/favicon.ico">
<style>
h2 {
	text-align: center;
	margin-top: 30px;
}
</style>
</head>


<body>

	<form method="post" action="reserv_login_action.jsp">
<div class="container">
		<div class="row gx-5">
			<div class="col-md-4"></div>

			<div class="col-md-4">
			<br>
			<br>
				<h2>로그인</h2>
				<br> <br>
				<div class="p-3 border bg-light" style="text-align: center;">

					<label for="name" class="form-label"><strong>아이디</strong></label> <br>
					<input type="text" class="form-control" name="ID" placeholder="아이디">
					<br> <label for="name" class="form-label"><strong>비밀번호</strong></label>
					<br> <input type="password" class="form-control" name="PW"
						placeholder="비밀번호"> <br>
					<div class="submit">
						<button type="submit" class="btn btn-primary" id=sumbmitBtn>로그인</button>
					</div>
				</div>
			</div>

			<div class="col-md-4"></div>

		</div>
		</div>
	</form>

</body>
</html>