<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.reservation.ReservationDao"%>
<%@page import="org.reservation.ReservationDto"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ReservationDto dto = new ReservationDto();
PrintWriter script = response.getWriter();

request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String jumin = request.getParameter("jumin");
String tel = request.getParameter("tel");
String date = request.getParameter("date");
String time = request.getParameter("catecodename");
String location = request.getParameter("location");
String[] symptoms = request.getParameterValues("symptoms");
String temp = "";

List<String> symList = new ArrayList<String>();
for (int i = 0; i < symptoms.length; i++) {
	if (i == symptoms.length - 1) {
		temp += symptoms[i];
	} else {
		temp += symptoms[i] + ", ";
	}
	symList.add(symptoms[i]);
}
request.setAttribute("symtomsarray", symList);
dto = new ReservationDto(name, jumin, tel, temp, date, time, location);

System.out.println(dto); 

ReservationDao.insert(dto);

/* ArrayList<ReservationDto> list = ReservationDao.selectAll();

for(int i=0;i<list.size();i++){
	ReservationDto reserve = list.get(i);
	if(name.equals(list.get(i).getName())){
		script = response.getWriter();
		script.println("<script>");
		script.println("alert('중복.')");
		script.println("history.back()");
		script.println("</script>");
		System.out.println(list.get(i).getName());
	}
	
}
 */
if (dto.getName() == "") {
	script = response.getWriter();
	script.println("<script>");
	script.println("alert('이름을 입력하세요.')");
	script.println("history.back()");
	script.println("</script>");
} else if (dto.getJumin() == "") {
	script = response.getWriter();
	script.println("<script>");
	script.println("alert('주민등록번호를 입력하세요.')");
	script.println("history.back()");
	script.println("</script>");
} else if (dto.getTel() == "") {
	script = response.getWriter();
	script.println("<script>");
	script.println("alert('전화번호를 입력하세요.')");
	script.println("history.back()");
	script.println("</script>");
} else if (dto.getDate() == "") {
	script = response.getWriter();
	script.println("<script>");
	script.println("alert('예약 날짜를 입력하세요.')");
	script.println("history.back()");
	script.println("</script>");
} else if (dto.getSymptoms() == "") {
	script = response.getWriter();
	script.println("<script>");
	script.println("alert('코로나 의심증상을 고르세요.')");
	script.println("history.back()");
	script.println("</script>");
} else if (dto.getTime() == "") {
	script = response.getWriter();
	script.println("<script>");
	script.println("alert('예약시간을 확인하세요.')");
	script.println("history.back()");
	script.println("</script>");
} else if (location.equals("null")) {
	script = response.getWriter();
	script.println("<script>");
	script.println("alert('예약할 병원을 선택하세요.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
} else {
	script = response.getWriter();
	script.println("<script>");
	script.println("alert('예약되었습니다.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
}
%>