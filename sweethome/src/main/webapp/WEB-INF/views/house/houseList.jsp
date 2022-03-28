<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.thegenesis.sweethome.house.model.vo.*, java.util.ArrayList" %>

<% 
	ArrayList<House> list = (ArrayList)request.getAttribute("list");
    ArrayList<House> list1 = (ArrayList)request.getAttribute("list1");

%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
		#map{
			margin: auto;
		}
		#keyword{
			margin-left: 120px;
			width:300px;
			float:left;
			height:30px;
		}
		#search{
			margin-left:10px;
			height:30px;
			background-color: rgb(247, 202, 201) !important;
			width:60px;
			color:white;
			outline:none;
     		border:none;
		}
		.img-box{
			width: 150px;
			height: 150px;
		}
		.house, .title, .txt {
			display: inline-block;
		}
		.house-wrap{
            width:1500px;
			margin-left: 75px;
        }
        .w1500 {
            width: 1500px;
            margin: auto;
        }
        ul { 
            list-style: none;
        }
        .mtb3{
            margin: 3px 0;
        }
        .house-item {
            width: 250px;
            display: inline-block;
            margin-right: 198px;
            margin-left: 29px;
            margin-top:30px;
            
        }
        .house-item:hover{
        	cursor: pointer;
        }
        
        .thumbnail {
            width: 100%;
            height: 150px;
            border-radius: 15px;
        }
        .thumb-title {
            font-size: 18px;
            font-weight: bold;
        }
        .thumb-desc li:first-child {
            font-weight: bold;
            border-right: 1px solid #aaa;
            padding-right: 8px;
        }
        .thumb-desc li {
            display: inline-block;
        }
        .status1 {
            display: inline-block;
            width: 80%;
            height: 30px;
            background-color: rgb(247, 202, 201);
            border-radius: 15px;
            color: white;
            text-align: center;
            line-height: 30px;
            margin-left:25px;
        }
        .status2 {
            display: inline-block;
            width: 80%;
            height: 30px;
            background: none;
            border-radius: 15px;
            border: 1px solid rgba(0,211,170,1);
            color: rgba(0,211,170,1);
            text-align: center;
            line-height: 30px;
            margin-left:25px;
        }
        #text-box{
        	width:1500px;
        	margin:auto;
        }
        
        #pagingArea {width:fit-content; margin:auto;}
        
        
</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
	
	
	<body>
	<jsp:include page="../common/header.jsp" />
		<hr>
	<div id="text-box">
					<form onsubmit="searchPlaces(); return false;">
	   				<input type="text" id="keyword" value=""class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="역 ,학교이름을 입력 해주세요"> 
                   <button type="submit" id="search" class="btn btn">검색</button>
                   </form>
		</div>
	  <br>
		<div id="map" style="width:1300px;height:450px;"></div>
	  <br><br>
		<div class="w1500">
        <ul class="house-wrap">
        	<c:forEach var="h" items="${ list }">
            <li class="house-item">
                <div class="item-list" style="display:block">
                <img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_ZC6fgFLl_20211028123745.jpg" alt="썸네일 이미지">
                <div style="display:none" class="hno">${h.houseNo}</div>
                <span class="thumb-title mtb3">${h.houseName}</span>
                <ul class="thumb-desc mtb3">
                    <li> ${h.houseNo }</li>
                </ul>
                	<c:choose>
                	<c:when test="${ h.condition eq 'Y'}">
                <span class="status1">입주가능</span>
                </c:when>
                <c:otherwise>
                <span class="status2">입주불가</span>
                </c:otherwise>
                	</c:choose>
                </div>
            </li>
            </c:forEach>
        </ul>
        <br>

    </div>
    
    <div id="pagingArea">
        <ul class="pagination pagination-lg">
        <c:choose>
            <c:when test="${ pi.currentPage eq 1 }">
            <li class="disabled" style="display:none"><span aria-hidden="true">&laquo;</span></a></li><!-- 1번 페이지일경우 -->
            </c:when>
            <c:otherwise>
            <li class="page-item"><a class="page-link" href="house.se?cpage=${ pi.currentPage - 1 }">&laquo;</a></li>
            </c:otherwise>
        </c:choose>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            <c:choose >
            <c:when test="${ p ne pi.currentPage }">
            	<li class="page-item "><a class="page-link" href="house.se?cpage=${ p }">${ p }</a></li>
            </c:when>
            <c:otherwise>
            	<li class="page-item disabled" class="page-link" ><a class="page-link" href="house.se?cpage=${ p }">${ p }</a></li>
            </c:otherwise>
            </c:choose>
            </c:forEach>
            
            
        <c:choose>
            <c:when test="${ pi.currentPage eq pi.maxPage }">
            <li class="disabled" style="display:none"><span aria-hidden="true">&raquo;</span></a></li>
            </c:when>
            <c:otherwise>
            <li class="page-item"><a class="page-link" href="house.se?cpage=${ pi.currentPage + 1 }">&raquo;</a></li>
            </c:otherwise>
        </c:choose>
        </ul>
    </div>
    
	
    
	<hr>
	<jsp:include page="../common/footer.jsp" />


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc26f4f2ac186a2ad635ddbe87b694c6&libraries=services"></script>
	<script>
	
	
	var x = [];
	var y = [];
	var houseName = [];
	var houseNo = [];
	
	<% for(House h: list1) { %>
    	x.push(<%= h.getLatitude() %>);
    	y.push(<%= h.getLongitude() %>);
    	houseName.push("<%= h.getHouseName() %>");
    	houseNo.push("<%=h.getHouseNo() %>");
 	<% } %>
 	
	
    
    
    
    
 	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	

	map.setMinLevel(3);
	map.setMaxLevel(9);	

	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    
	    ps.keywordSearch( keyword, placesSearchCB); 
	    
	    
	    
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	        
		
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
		var bounds = new kakao.maps.LatLngBounds();
		
	    
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x)
		
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	
	    }
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	    console.log(bounds);
	    
	    
	    var bounds1 = map.getBounds();
	    console.log(bounds1);
	    for(var i = 0; i < x.length; i++){
			//if(bounds1.pa < y[i] > bounds1.qa  &&  bounds1.ha < x[i] > bounds1.oa){
			//	console.log(1);
			//}
	    }
	}
	 
	 
	 
	
	for(var i = 0; i < x.length; i++){
		
		// 마커 이미지의 이미지 크기 입니다
		var hno = houseNo[i];
		
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
		var marker = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(y[i], x[i]),
			map: map,
			image : markerImage // 마커 이미지 
		});
		
		var iwContent = '<div class="item-list"><img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_ZC6fgFLl_20211028123745.jpg" alt="썸네일 이미지"><span class="thumb-title mtb3">' + houseName[i] + '</span><ul class="thumb-desc mtb3"><li> 월</li></ul></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(y[i], x[i]); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
	    
		kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	    kakao.maps.event.addListener(marker, 'click', makeClickListener( hno));
	}
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	function makeClickListener(hno){
		return function(){
			location.href = "house.de?hno=" + hno; 
		}
	}
	
	$(".item-list").click(function(){
		var hno = $(this).children('.hno').text();
	
		location.href = "house.de?hno=" + hno; 
	})		


	</script>
	
		
</body>
</html>