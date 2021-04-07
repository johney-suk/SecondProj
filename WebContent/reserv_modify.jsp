<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.reservation.ReservationDto"%>
<%@page import="org.reservation.ReservationDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="assets/js/bootstrap.js"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="https://corona-19.kr/img/favicon.ico">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
$(function() {
	$('form').submit(function() {
		this.action = "reserv_modify_action.jsp";
		this.method = "GET";
		this.submit();
		alert("수정되었습니다.");
	});
});

$(function() {
	$("#datepicker").datepicker(
			{
				dateFormat : 'yy년 mm월 dd일', // 년 월일 추가
				showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜 표시
				,
				showMonthAfterYear : true // 년도 먼저 
				,
				changeMonth : true // 월 선택 가능    셀렉박스             
				,
				showOn : "both" // 픽스
				,
				yearSuffix : "년",
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
						'토요일' ],
				minDate : "+1D" // 현재일 기준최소
				,
				maxDate : "+21D" // 최대  
				,
				onSelect : function() {
					var myDate = $('#datepicker').val();
					alert("선택하신 예약날짜는 "+myDate+" 입니다.");
					$("#dat").val(myDate);
				},
				 beforeShowDay: function(date) {
				        var day = date.getDay();
				        return [(day != 0), ''];
				    }

			});
});
</script>
<%
int no = Integer.parseInt(request.getParameter("no"));
ReservationDto reserv = ReservationDao.selectOne(new ReservationDto(no));

%>

<style>
.box {
	width: 146px;
}

.container-lg {
	margin-top: 30px;
}

h2 {
	text-align: center;
}

.submit {
	margin-top: 20px;
	text-align: center;
}
#stitle{
align=center;
style=width:50%; 
height: 70px;
border-radius: 4em;
background-color: #04B486;
padding:20px;
}
h4 {
font-weight: bold;
color: white;
text-align: center;
}
</style>
<title>정보 수정</title>

</head>

<body>
<br>
<br>
<br>
	<div class="container">
		<div class="row gx-5">
			<div class="col-md-4"></div>
			<div class="col-md-4">
			
							<div id="stitle" ><h4><%=reserv.getName()%>님의 예약 정보 수정</h4></div>
<br>
<br>
							
				<div class="p-3 border bg-light">
					<form method="post" action="join_action.jsp">
						<div class="mb-3">
						<input type="hidden" name="no"
							value="<%=no%>">
						<input type="hidden" name="location"
							value="<%=reserv.getLocation()%>">
							<label for="name" class="form-label"><strong>예약자명</strong></label>
							<input type="text" class="form-control" name="name"
								placeholder="성함" readonly value="<%=reserv.getName()%>" >
						</div>

						<label for="rrn" class="form-label"><strong>생년월일</strong></label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" name="jumin"
								aria-label="Username" placeholder="(-없이 13자리)"
								value="<%=reserv.getJumin()%>" readonly> 
						</div>

						<div class="mb-3">
							<label for="phone" class="form-label"><strong>전화번호</strong></label>
							<input type="text" class="form-control" name="tel"
								aria-describedby="namebox" readonly value="<%=reserv.getTel()%>">
						</div>
						<label for="name" class="form-label"><strong>*
								코로나19 의심증상</strong></label> <br>

						<%
						String[] sarr = reserv.getSymptoms().split(", ");

						List<String> slist = new ArrayList<String>();

						for (String st : sarr) {
							System.out.println(st);
							slist.add(st);
						}

						if (slist.contains("37.5°C 이상 발열")) {
						%>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox1" value="37.5°C 이상 발열" checked> <label
								class="form-check-label" for="inlineCheckbox1">37.5°C 이상
								발열</label>
						</div>
						<%
						} else {
						%>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox1" value="37.5°C 이상 발열"> <label
								class="form-check-label" for="inlineCheckbox1">37.5°C 이상
								발열</label>
						</div>
						<%
						}
						%>
						<%
						for (String st : sarr) {
							System.out.println(st);
							slist.add(st);
						}

						if (slist.contains("기침")) {
						%>
						<div class="form-check form-check-inline box">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox2" value="기침" checked> <label
								class="form-check-label" for="inlineCheckbox2">기침</label>
						</div>
						<%
						} else {
						%>
						<div class="form-check form-check-inline box">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox2" value="기침"> <label
								class="form-check-label" for="inlineCheckbox2">기침</label>
						</div>
						<%
						}
						%>

						<%
						for (String st : sarr) {
							System.out.println(st);
							slist.add(st);
						}

						if (slist.contains("인후통")) {
						%>
						<div class="form-check form-check-inline box">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox3" value="인후통" checked> <label
								class="form-check-label" for="inlineCheckbox3">인후통</label>
						</div>
						<%
						} else {
						%>
						<div class="form-check form-check-inline box">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox3" value="인후통"> <label
								class="form-check-label" for="inlineCheckbox3">인후통</label>
						</div>
						<%
						}
						%>

						<%
						for (String st : sarr) {
							System.out.println(st);
							slist.add(st);
						}

						if (slist.contains("호흡곤란")) {
						%>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox4" value="호흡곤란"> <label
								class="form-check-label" for="inlineCheckbox4">호흡곤란</label>
						</div>

						<br>
						<%
						} else {
						%>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox4" value="호흡곤란"> <label
								class="form-check-label" for="inlineCheckbox4">호흡곤란</label>
						</div>
						<br>
						<%
						}
						%>
						<%
						for (String st : sarr) {
							System.out.println(st);
							slist.add(st);
						}

						if (slist.contains("오한")) {
						%>
						<div class="form-check form-check-inline box">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox5" value="오한" checked> <label
								class="form-check-label" for="inlineCheckbox1">오한</label>
						</div>
						<%
						} else {
						%>
						<div class="form-check form-check-inline box">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox5" value="오한"> <label
								class="form-check-label" for="inlineCheckbox1">오한</label>
						</div>
						<%
						}
						%>
						<%
						for (String st : sarr) {
							System.out.println(st);
							slist.add(st);
						}

						if (slist.contains("근육통")) {
						%>
						<div class="form-check form-check-inline box">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox6" value="근육통" checked> <label
								class="form-check-label" for="inlineCheckbox2">근육통</label>
						</div>
						<%
						} else {
						%>
						<div class="form-check form-check-inline box">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox6" value="근육통"> <label
								class="form-check-label" for="inlineCheckbox2">근육통</label>
						</div>
						<%
						}
						%>
						
						<%
						for (String st : sarr) {
							System.out.println(st);
							slist.add(st);
						}

						if (slist.contains("두통")) {
						%>
						<div class="form-check form-check-inline box">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox7" value="두통" checked> <label
								class="form-check-label" for="inlineCheckbox3">두통</label>
						</div>
						<%
						} else {
						%>
						<div class="form-check form-check-inline box">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox7" value="두통"> <label
								class="form-check-label" for="inlineCheckbox3">두통</label>
						</div>
						<%
						}
						%>
						
						<%
						for (String st : sarr) {
							System.out.println(st);
							slist.add(st);
						}

						if (slist.contains("미각 또는 후각소실")) {
						%>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox8" value="미각 또는 후각소실" checked> <label
								class="form-check-label" for="inlineCheckbox4">미각 또는
								후각소실</label>
						</div>
						<%
						} else {
						%>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="symptoms"
								id="inlineCheckbox8" value="미각 또는 후각소실"> <label
								class="form-check-label" for="inlineCheckbox4">미각 또는
								후각소실</label>
						</div>
						<%
						}
						%>
						
						<%
						for (String st : sarr) {
							System.out.println(st);
							slist.add(st);
						}

						if (slist.contains("본인 또는 동거가족의 최근 14일 이내 해외 여행력")) {
						%>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								value="본인 또는 동거가족의 최근 14일 이내 해외 여행력" id="flexCheckDefault"
								name="symptoms" checked> <label class="form-check-label"
								for="flexCheckDefault"> 본인 또는 동거가족의 최근 14일 이내 해외<br>
								여행력
							</label>
						</div>
						<%
						} else {
						%>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								value="본인 또는 동거가족의 최근 14일 이내 해외 여행력" id="flexCheckDefault"
								name="symptoms"> <label class="form-check-label"
								for="flexCheckDefault"> 본인 또는 동거가족의 최근 14일 이내 해외<br>
								여행력
							</label>
						</div>
						<%
						}
						%>
						
						<%
						for (String st : sarr) {
							System.out.println(st);
							slist.add(st);
						}

						if (slist.contains("동거가족 중 현재 자가격리자 있음")) {
						%>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								value="동거가족 중 현재 자가격리자 있음" id="flexCheckChecked" name="symptoms" checked>
							<label class="form-check-label" for="flexCheckChecked">
								동거가족 중 현재 자가격리자 있음 </label>
						</div>
						<%
						} else {
						%>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								value="동거가족 중 현재 자가격리자 있음" id="flexCheckChecked" name="symptoms">
							<label class="form-check-label" for="flexCheckChecked">
								동거가족 중 현재 자가격리자 있음 </label>
						</div>
						<%
						}
						%>
						
					

						<br> <br>
						<div class="mb-3">
							<label for="reservation" class="form-label">예약 날짜</label> <input
								type='text' name="date" id="datepicker" value="<%=reserv.getDate()%>">
						</div>
						<div class="mb-3">
							<label for="reservation" class="form-label">예약 시간</label> <input
								type='time' name="time" value="<%=reserv.getTime()%>" /> <br>
						</div>

						<div class="submit">
							<button type="submit" class="btn btn-primary" id=sumbmitBtn>수정</button>
						</div>

					</form>


				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

</body>
</html>