<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script>
$(document).ready(function(){
	$("#commentBtn").on("click",function(){
		$.ajax({
			"url":"${initParam.rootPath }/admin/performanceCommentList.do",
			"type":"post",
			"data":{
				"performanceNo" : $('#performanceNo').val(),
				"userId": $("#userId").val(),
				"content":$("#content").val(),
				'${_csrf.parameterName}':'${_csrf.token}'
			},
			"dataType":"json",
			"beforeSend" : function(){
				if($("#performanceNo").val()=="not"){
					alert("공연정보번호를 선택해주세요.");
					$("#performanceNo").focus();
					return false;
				}
			},
			"success":function(list){
				var txt = '';
				$.each(list,function(){
					txt += '<tr class="row"><td class="col-sm-2">'+this.performanceCommentNo+'</td>';
					txt += '<td class="col-sm-2">'+this.performanceCommentUserId+'</td>';
					txt += '<td class="col-sm-6">'+this.performanceComment+'</td>';
					txt += '<td class="col-sm-2"><form action="${initParam.rootPath }/admin/deletePerformanceComment.do" method="post"><button class="btn btn-danger">댓글삭제</button>';
					txt += '<sec:csrfInput/><input type="hidden" value="'+this.performanceCommentNo+'" name="performanceCommentNo">';
					txt += '</form></td></tr>';
				});
				
				$("#tbody").html(txt);
			},
			"error":function(a,b,c){
				alert(a);
				alert(b);
				alert(c);
			}
		});
	});
});

</script>
<div class="row">
	<!-- video number select box -->
	<div class="col-sm-6 align-center" style="display:inline;">
		<select id="performanceNo">
			<option value="not">
				공연정보 번호를 선택해주세요.
			</option>
			<c:forEach items="${requestScope.list }" var="performance">
				<option value="${performance.performanceNo }">
					${performance.performanceNo }번					
				</option>
			</c:forEach>
		</select>
		<input type="text" id="userId" placeholder="작성자">
		<input type="text" id="content" placeholder="내용">
		<button type="button" id="commentBtn">조회</button>
	</div>
</div>

<div id="commentList">
	<table class="table">
		<thead>
			<tr class="row">
				<th class="col-sm-2">댓글번호</th>
				<th class="col-sm-2">작성자</th>
				<th class="col-sm-6">내용</th>
				<th class="col-sm-2">삭제</th>
			</tr>
		</thead>
		<tbody id="tbody">
			
			
		</tbody>
	</table>
</div>