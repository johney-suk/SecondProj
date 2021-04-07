<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.covid19.db.CovidVo"%>
<%@page import="org.covid19.db.CovidDao"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
    
</head>
<body>
<div id="map" style="width:100%;height:100%;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=30a29ea7804c67c48615f24d77121766
&libraries=services">
</script>

<script>
var markers = [];
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.57046299160746, 126.98533403351219), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

//키워드 검색을 요청하는 함수입니다
function searchPlaces() {
    var keyword = document.getElementById('keyword').value + '선별진료소';
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB); 
}

//키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
	if(markers != null) {
   	 removeMarker();
   }
    if (status === kakao.maps.services.Status.OK) {
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });	
    
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseover', function() {
    	var placename = place.place_name.split(" ")[1];
    	var phone = place.phone;
    	var noplace = place.place_name.split(" ")[2];
    	var address1 = place.road_address_name.split(" ")[0];
    	var address2 = place.road_address_name.split(" ")[1];
    	var address3 = place.road_address_name;
    	
    	console.log(place.place_name);
    	console.log(phone);
    	console.log(place.road_address_name);
    		$.ajax({
    			type: "POST",
    			url: "mapAction.jsp", 
    			data: {"name" : placename, "number" : phone, "sido" : address1 ,"sigungu" : address2, "juso": address3},
    			dataType: "JSON",
    			success: function(data) {
    				var name = "";
    				if (noplace === "선별진료소") {
    					var a = data[0];
        				var name = a.name;
        				var sido = a.sido;
        				var sigungu = a.sigungu;
        				var week = a.weekday;
        				var sat = a.saturday;   				
        				var num = a.number;
    				var st = '<div style="margin:5px;font-size:12px;width:157px;">';
    				st += "<span>" + placename + '</span><br/>';
    				st += "<span>" + sido + " ";
    				st += sigungu + '</span><br/>';
    				st += "<span>평일 : " + week + '</span><br/>';
    				st += "<span>토요일 : " + sat + '</span><br/>';
    				st += "<span>번호 : " + num + '</span><br/>';
    				console.log(name);
    				infowindow.setContent(st + "<span><a href='reserv_join.jsp?name="+name+"' style='color:#106eea'>예약하기</a></span></div>");
    		        infowindow.open(map, marker);
    				} else {
    					infowindow.setContent('<div style="width:189px;height:18px;margin:5px;font-size:12px;text-align:center;"> 임시진료소는 확인되지 않습니다. </div>');
    					infowindow.open(map, marker);
    				}
    			},
    			error: function(data){
    				console.log("ajax 안들어옴");
    			}
    	}); 	
    });
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}
</script>
<script src="http://code.jquery.com/jquery.min.js"></script>
</body>
</html>