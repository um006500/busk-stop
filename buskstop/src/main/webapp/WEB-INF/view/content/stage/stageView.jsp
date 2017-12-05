<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>

<script>

	$(document).ready(function(){
		
		$(".submit").click(function(){
			if($("#searchName").val()=="" && $("#searchLocation").val()=="" && $("#searchInstrument").val()==""){
				alert("검색할 키워드를 입력해주세요.");
			} else if ( $("#reservationStart").val()==""){
				alert("대관 날짜를 선택해주세요.")	
			} else if ( $("restervationEnd").val()==""){
				alert("날짜를 선택하세유.")	
			}
		})
		
		
	});
	
	$(function() {

		$(".calendar").datepicker({
			buttonImageOnly : true,
			numberOfMonths : 2,
			dateFormat : "yymmdd"
		});
	});
	
	function goDetail(root, no){
		document.location.href= root+'/stageDetailView.do?stageNo='+no
	}
	
	function goRegister(){
		document.location.href= "${initParam.rootPath}/stage/stageRegisterView.do";
	}

</script>
<style type="text/css">

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	padding: 5px;
	text-align: center;
}

select {
	width: 150px;
	height: 30px;
}

#container {
	width: 960px;
	margin: 0 auto;
}

#product_tb{
	border: none;
}
#product_tb tr td{
	font-weight: bold;
	color: #888;
}
#product_tb tbody tr:nth-child(2n){
	background-color: #47a3d2;
}
#product_tb tbody tr:nth-child(2n) td{
	color: #fff;
}
#product_tb tbody tr:nth-child(2n) td a{
	color: #fff;
}
#product_tb tbody tr{
	line-height: 30px;
}
#product_tb thead{
	border-bottom: solid #ccc 1px;
}
#thead tr td{
	color : #000;
}
.likeBtn{
	color: red;
}
#product_tb tbody tr:nth-child(2n) .likeBtn{
	color: red;
}
.likeBtn:hover{
	color: #47a3d2;
	text-decoration: none;
}
#product_tb tbody tr:nth-child(2n) .likeBtn:hover{
	color: #fff;
}
#product_tb img{
	height : 100px;
}

#product_tb tbody tr td:nth-child(1) {
	border-right: 2px #ccc solid;
}

#product_tb tbody tr:hover{
	background-color: #ddd;
}

#product_tb tbody tr:nth-child(2n):hover{
	background-color: #337ab7;
}

</style>
<div id="container">
	<hr>
	<form class="stageReservation" action="${initParam.rootPath}/stageReservation.do">
		<input type="text" name="searchName" id="searchName" placeholder="팀명으로 검색">
		<input type="date" name="stageReservationStart" class="calendar" id="stageReservationStart" >
		<input type="date" name="stageReservationEnd" class="calendar" id="stageReservationEnd" >
		<input type="text" name="searchLocation" id="searchLocation" placeholder="장소로 검색">
		<input type="text" name="searchInstrument" id="searchInstrument" placeholder="악기로 검색">
		<br>
		<input type="checkbox" name="box" value="주차장">주차장 유무 
		<input type="checkbox" name="box" value="음주">음주 가능
		<input type="checkbox" name="box" value="식사">식사 가능
		<input type="checkbox" name="box" value="외부음식">외부음식 반입 가능
		
		<input type="button" name="search" class="submit" value="검색">
	</form>
	<hr>
	<h1>대관 목록</h1>
	<hr>
	<table id="stageReservation" style="display: table;">
		<thead id="thead">
		<tr>
			<td>번호 </td>
			<td>제목</td>
			<td>공연장소</td>
			<td>공연날짜</td>
			<td>공급자</td>
			<td>예약 여부</td>
		</tr>
		</thead>
		<tbody id="tbody">
		<c:forEach items="${requestScope.map.list}" var="item">
					<tr style="cursor: pointer;">
					<td onclick="goDetail('${initParam.rootPath }', ${item.stageNo})">${item.stageNo }</td>
					<td onclick="goDetail('${initParam.rootPath }', ${item.stageNo})">${item.stageName }</td>
					<td onclick="goDetail('${initParam.rootPath }', ${item.stageNo})">${item.stageLocation }</td>
					<td onclick="goDetail('${initParam.rootPath }', ${item.stageNo})">${item.stageRegTime }</td>
					<td onclick="goDetail('${initParam.rootPath }', ${item.stageNo})">${item.stageSellerId }</td>
					<td onclick="goDetail('${initParam.rootPath }', ${item.stageNo})"><c:if test="${item.stageReservation==0}">예약불가</c:if>
					<c:if test="${item.stageReservation==1}">예약가능</c:if></td>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	<div style="width: 100%;">
		<button class="btn btn-default" style="float: right;" onclick="goRegister()">작성</button>
	</div>

	<div style="text-align: center; width: 100%;">
			<ul class="pagination">
				<%-- 첫페이지로 이동 --%>
				<li>
					<a href="${initParam.rootPath }/selectAllStage.do?page=1&category=${requestScope.map.category}&search=${requestScope.map.search}&stageDate=${requestScope.map.sDate}">&lt;&lt;</a>
				</li>
				<%--
					이전 페이지 그룹 처리
					만약에 이전 페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리
				 --%>
				<c:choose>
					<c:when test="${requestScope.map.pageBean.previousPageGroup }">
						<li>
							<a href="${initParam.rootPath }/selectAllStage.do?page=${requestScope.map.pageBean.beginPage - 1}&category=${requestScope.map.category}&search=${requestScope.map.search}&stageDate=${requestScope.map.sDate}">◀</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
				 			<a href="#">◀</a>
				 		</li>
				 	</c:otherwise>
				</c:choose>
				<%--
				 	현재 page가 속한 page 그룹내의 페이지들 링크
				 	현재 pageGroup의 시작 page ~ 끝 page
				 	- 만약에 p가 현재페이지면 링크처리를 하지 않고 p가 현재 페이지가 아니라면 링크 처리.
				  --%>
				<c:forEach begin="${requestScope.map.pageBean.beginPage }"
					end="${requestScope.map.pageBean.endPage }" var="num">
					<c:choose>
						<c:when test="${num == requestScope.map.pageBean.page }">
							<li class="active">
				  				<a href="#">${num }</a>
				  			</li>
				  		</c:when>
						<c:otherwise>
							<li>
								<a href="${initParam.rootPath }/selectAllStage.do?page=${num}&category=${requestScope.map.category}&search=${requestScope.map.search}&stageDate=${requestScope.map.sDate}">${num }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<%--
				  	다음페이지 그룹으로 이동
				  	만약에 다음페이지 그룹이 있으면 링크 처리 없으면 화살표만 나오도록 처리
				  --%>
				<c:choose>
					<c:when test="${requestScope.map.pageBean.nextPageGroup }">
						<li>
							<a href="${initParam.rootPath }/selectAllStage.do?page=${requestScope.map.pageBean.endPage + 1}&category=${requestScope.map.category}&search=${requestScope.map.search}&stageDate=${requestScope.map.sDate}">▶</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
				  			<a href="#">▶</a>
				  		</li>
				  	</c:otherwise>
				</c:choose>
				<%-- 마지막 페이지로 이동 --%>
				<li>
					<a href="${initParam.rootPath }/selectAllStage.do?page=${requestScope.map.pageBean.totalPage}&category=${requestScope.map.category}&search=${requestScope.map.search}&stageDate=${requestScope.map.sDate}">&gt;&gt;</a>
				</li>
			</ul>
		</div>
	</div>
