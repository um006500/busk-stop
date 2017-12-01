<%@page import="com.buskstop.vo.Performance"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	listComment();
	$("#btnComment").on("click",function(){
        
		$.ajax({                
            "url": "${initParam.rootPath }/performanceCommentInsert.do",
            "type": "get",
            "data" : {
            	"performanceNo":"${requestScope.performance.performanceNo}",
            	"performanceComment":$("#performanceComment").val(),
            	'${_csrf.parameterName}':'${_csrf.token}'
            },
            "dataType":"text",
            success: function(){
                alert("댓글이 등록되었습니다.");
                listComment();
            },
           	"error":function(){
           		alert("오류 발생");
           		
           	}
        });
     });
});	

function listComment(){
    $.ajax({
        //"dataType":"json",
        "url" : "/buskstop/performanceCommentList.do",
        "type": "get",
        "data" : {"performanceNo":"${requestScope.performance.performanceNo}"},
        "dataType" : "json",
        "success" : function(result){
            var output = "";
            $.each(result, function(){ 
            	output += '<div class="performanceComment" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                output += '<div class="listComment'+this.performanceCommentNo+'">'+'댓글번호 : '+this.performanceCommentNo+' / 작성자 : '+this.performanceCommentUserId+' / 등록 일자 : '+this.performanceCommentRegTime;
                output += '<a onclick="updateCommentText('+this.performanceCommentNo+',\''+this.performanceComment+'\');"> 수정 </a>';
                output += '<a onclick="deleteComment('+this.performanceCommentNo+');"> 삭제 </a> </div>';
                output += '<div class="pComment'+this.performanceCommentNo+'"> <p> 내용 : '+this.performanceComment +'</p>';
                output += '</div></div>';
            });
            $("#performanceCommentList").html(output);
        },
        "error":function(){
       		alert("오류 발생");
       	}
    });
}
   
function deleteComment(performanceCommentNo){
    
	$.ajax({                
        "url": "${initParam.rootPath }/performanceCommentDelete.do",
        "type": "post",
        "data" : {
        	"performanceCommentNo":performanceCommentNo,
        	'${_csrf.parameterName}':'${_csrf.token}'
        },
        "dataType":"text",
        "success": function(){
            alert("댓글이 삭제되었습니다.");
            listComment();
        },
        "error":function(){
        	alert("에러 뜸 ㅠㅠ");
        }
    });
 }
 
 
function updateCommentText(performanceCommentNo,performanceComment){
	
    var output ="";
    	output += '<div class="input-group">';
    	output += '<input type="text" class="form-control" name="pComment'+performanceCommentNo+'" value="'+performanceComment+'"/>';
    	output += '<span class="input-group-btn">'
    	output += '<button class="btn btn-default" type="button" onclick="updateComment('+performanceCommentNo+');">수정</button>';
    	output += '<button class="btn btn-default" type="button" onclick="listComment();">수정 취소</button>';
    	output += ' </span></div>';
       
       $(".pComment"+performanceCommentNo).html(output);
}

function updateComment(performanceCommentNo){
		var UpdatePerformanceComment = $("[name=pComment"+performanceCommentNo+"]").val();
	$.ajax({
		"url": "${initParam.rootPath }/performanceCommentUpdate.do",
	    "type": "get",
	    "data" : {
	    	"performanceCommentNo":performanceCommentNo,
	    	"UpdatePerformanceComment":UpdatePerformanceComment,
	    	'${_csrf.parameterName}':'${_csrf.token}'
	    },
	    "dataType":"text",
	    "success" : function(){
	    	alert("댓글이 수정되었습니다.");
	    	listComment();
	    },
	    "error":function(){
	    	alert("댓글을 입력해주세요.");
	    }
		
	});
	
}
   


</script>

<style type="text/css">
	table, td{
		border: 1px solid black;
	}
	table{
		width:100%;
		border-collapse: collapse;
	}
	td{
		padding: 5px;
		text-align: center;
		
	}
	select{
		width:150px;height: 30px;
	}
	#container{
		width:960px;
		margin : 0 auto;
	}

</style>
</head>
<body>
<div id="container">
<% Performance performance = (Performance)request.getAttribute("performance"); %>

<h1>DETAIL VIEW - 공연 상세 정보 </h1>
	
<hr>

<h2>공연정보 게시판</h2>
<hr>

	<!-- Board Content -->
	<div style="border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; overflow : hidden; position: relative">
		<div>
			<h3>${requestScope.performance.performanceNo}. ${requestScope.performance.performanceTitle}</h3>
		</div>
		<div style="float:right; position: absolute; bottom: 10px; right: 0;">
			<div style="float:right; margin-left:5px;">${requestScope.performance.performanceHits}</div>
			<div style="float:right; margin-left:20px;">조회</div>
			<div style="float:right; margin-left:20px;"><%-- ${requestScope.performance.WRITE DATE} --%> [글쓴 날짜 들어갈 곳 2017-11-01 22:00] </div>
			<div style="float:right;">${requestScope.performance.performanceUserId}<strong>님</strong></div>
		</div>
	</div>

	<div style="border-bottom: 1px solid #e5e5e5; overflow : hidden; padding : 5px; background: #f9f9f9; ">
		<div style="float:left;">
			<div style="float:left; margin-right:5px;">공연장소</div> 
			<div style="float:left; margin-right:20px;"><%=performance.getPerformanceLocation() %></div>
		</div>
		<div>
			<div style="float:left; margin-right:5px;">공연 시간</div>
			<div style="float:left;"><%=performance.getPerformanceDate() %></div>
		</div>
	</div>

	<div>
		<p style="color:#515151; font-size: 16px; padding:20px;">
		${requestScope.performance.performanceContent}
		</p>
	</div>
	<!-- Board Content End-->
	
 
	<div id="performanceCommentList"> 
	<!-- 
	<c:forEach var="performanceComment" items="${requestScope.list }">
		${performanceComment.performanceCommentNo},
		${performanceComment.performanceRegTime},	
		${performanceComment.performanceCommentUserId},
		${performanceComment.performanceComment},
	</c:forEach>
	<button type="button" id="BtnUpdate">수정</button>
	<button type="button" id="BtnDelete">삭제</button>
	 -->
	</div>
	
	<textarea name="content" id="performanceComment" 
	cols="20" rows="5" placeholder="댓글을 쓰세요"></textarea>
	<button type="button" id="btnComment">댓글 등록</button>
	
	
</div>
</body>
