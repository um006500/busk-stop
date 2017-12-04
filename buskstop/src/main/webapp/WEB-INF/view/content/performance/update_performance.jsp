<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${initParam.rootPath }/performanceUpdate2.do">
	
 		<div class="form-group">
			<label for="no">공연 번호 </label> <input type="text"
				name="performanceNo" id="no" class="form-control"
				value="${param.performanceNo}" readonly>
				
		</div>
		<div class="form-group">
			<label for="id">수정할 공연 이름 </label> <input type="text"
				name="performanceName" id="name" class="form-control"
				value="${requestScope.Performance.performanceName }">
		</div>
		<div class="form-group">
			<label for="title">수정할 게시글 제목 </label> <input type="text"
				name="performanceTitle" id="title" class="form-control"
				value="${requestScope.Performance.performanceTitle }">
		</div>
		<div class="form-group">
			<label for="location">수정할 공연 위치 </label> <input type="text"
				name="performanceLocation" id="location" class="form-control"
				value="${requestScope.Performance.performanceLocation }">
		</div>
		<div class="form-group">
			<label for="date">수정할 공연 날짜 </label> <input type="date"
				name="performanceDate" id="name" class="form-control"
				value="${requestScope.Performance.performanceDate }">
		</div>
		<div class="form-group">
			<label for="content">수정할 공연 내용 </label>
			<textarea rows="15" cols="150" name="performanceContent" placeholder="수정할 내용을 입력하세요"></textarea>
		</div>
		<%--
	<div class="row">
		<div class="col-sm-12">
			<span id="changeSpan">
				<button id="imgChangeBtn" type="button" class="btn btn-success">사진변경</button>
				<img id="userImage" src="${initParam.rootPath }/memberImage/<sec:authentication property='principal.userImage'/>" class="img-responsive" width="350px">
			</span>
			<span id="cancelSpan" style="display: none;">
				<button id="cancelImgChangeBtn" type="button" class="btn btn-success">사진변경취소</button>
				<input type='file' name='memberImage' id='memberImage' class='form-control'>
			</span>
		</div>
	</div>
	 --%>

		<div class="form-group">
			<label for="performanceImage">이미지</label> <input type="file"
				name="performanceImage" id="performanceImage" class="form-control">
		</div>

		<div class="form-group">
			 <label for="userId">사용자 id </label> 
			<input type="text"
				name="performanceUserId" id="performanceUserId" class="form-control"
				value="<sec:authentication property="principal.userId"/>" readonly>
			<!--			
			 <input type="hidden" name="performanceUserId" id="performanceUserId" class="form-control" value='<sec:authentication property="principal.userId"/>'>
			
			 -->
		</div>


		<button type="submit" class="btn btn-default">정보수정</button>
		<button type="button" onclick="history.back();">취소</button>

		<sec:csrfInput />
		<%-- csrf 토큰 --%>



	</form>

	
	<%--	
	<form action="${initParam.rootPath }/deletePerformance.do"
		method="post">
		<div class="form-group">
			<label for="performanceNo">공연 id</label> <input type="number"
				name="performanceNo" id="performanceNo" class="form-control"
				required="required">
		</div>
		<button type="submit" class="btn btn-default">삭제</button>
	
		<sec:csrfInput />
	</form>

	

<script>
//사진 변경 처리
$(document).ready(function(){
	
	
	$("#imgChangeBtn").on("click", function(){
		$("#changeSpan").hide().next().show();
	});
	$("#cancelImgChangeBtn").on("click", function(){
		$("#memberImage").val("").parent().hide().prev().show();
	});
});
</script>
	
 --%>

</body>
</html>