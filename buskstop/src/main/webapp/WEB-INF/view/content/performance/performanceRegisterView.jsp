<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>공연정보 등록</h2>
	<form action="${initParam.rootPath }/performanceRegister.do" method="get">
		<div class="form-group">
			<label for="performanceNo">공연 id</label>
			<input type="number" name="performanceNo" id="performanceNo" class="form-control" required="required">
		</div>
		<div class="form-group">
			<label for="performanceName">공연 이름</label>
			<input type="text" name="performanceName" id="performanceName" class="form-control" required="required">
		</div>
		<div class="form-group">
			<label for="performanceTitle">글제목</label>
			<input type="text" name="performanceTitle" id="performanceTitle" class="form-control" required="required">
		</div>
		<div class="form-group">
			<label for="performanceLocation">공연장소</label>
			<input type="text" name="performanceLocation" id="performanceLocation" class="form-control" required="required">
		</div>
		<div class="form-group">
			<label for="perfromanceDate">공연날짜</label>
			<input type="date" name="perfromanceDate" id="perfromanceDate" class="form-control">
		</div>
		<div class="form-group">
			<label for="performanceHits">조회수</label>
			<input type="number" name="performanceHits" id="performanceHits" class="form-control">
		</div>
		<div class="form-group">
			<label>입력글</label>
			<textarea rows="50" cols="50"></textarea>
		</div>
		<div class="form-group">
			<label for="performanceImage">이미지</label>
			<input type="file" name="performanceImage" id="performanceImage" class="form-control">
		</div>
		<div class="form-group">
			<label for="performanceUserId">사용자 id</label>
			<input type="text" name="performanceUserId" id="performanceUserId" class="form-control">
		</div>
		<div class="form-group">
			<label for="stageNo">공연장 번호</label>
			<input type="text" name="stageNo" id="stageNo" class="form-control">
		</div>
		<button type="submit" class="btn btn-default">가입</button>
	</form>
	
</body>
</html>