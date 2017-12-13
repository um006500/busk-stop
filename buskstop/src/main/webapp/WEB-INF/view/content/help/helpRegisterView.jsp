<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style type="text/css">
	body{ 
		font-family:'돋움';
		}
	.demand{ 
		padding: 0.01em 16px;
		color:#000!important; 
		background-color: #ddffff!important; 
 		border-left: 6px solid #ccc!important; 
 		border-color: #2196F3!important;
 		margin-bottom: 50px; 
		}
	.demand p{ 
		color: #000!important; 
	    background-color: #ddffff!important;
	    border-color: #2196F3!important;
	    font-size: 12px;
	    font-weight: normal;
	    line-height: 1.5; 
	    color: #000!important;
	    box-sizing: inherit;
	    margin: 10px 0;
		}
	.ServiceCenter{ 
		width:960px; 
		margin:auto;
		font-size: 17px;
		font-weight: normal;
		}
	.ServiceCenter form{
		width: 900px;
		margin:auto;
	}
	.ServiceCenterTable { 
		border-collapse: collapse; 
		width: 100%
		}
	.ServiceCenterTable tr { 
		padding: 10px;
		border-bottom: 1px solid #e8e8e8;
		}
	.ServiceCenterTable tr:first-child { 
		border-top: 2px solid #1e1e1e;
		}
	.ServiceCenterTable tr:last-child { 
		border-top: 1px solid #1e1e1e;
		}
		
	.ServiceCenterTable td:first-child {
		/* border: 1px solid #888; */
		padding: 10px;
		width: 10%;
		font-size: 17px;
		}		
	.ServiceCenterTable td:nth-child(2) {
		/* border: 1px solid #888; */
		padding:10px;
		}
	.ServiceCenterTable input {
		width:100%;
		box-sizing: border-box;
		vertical-align:middle;
		margin:auto;
		padding:5px;
		border: 1px solid #000;
	}
	
	.noBorder {
		border-style:none;
	}
	
	.ServiceCenterTable textarea {
		border: 1px solid #000;
	}

	.ServiceCenterTable select {
		width:30%;
		padding:5px;
		border-color: #000;
	}
	
	.ServiceCenterTable textarea {
		width: 100%; 
		height: 300px;
		padding:5px;
		color: rgb(0, 0, 0);
	} 
	#ButtonTd {
		border-left: 0;
		border-right: 0;
		border-bottom: 0;
		}
	.ServiceCenterTable button {
		padding:10px 20px;
		}
	.ButtonDiv {
		margin:30px auto;
		}
	#head1{
		margin: 20px 0 20px;
	}
</style>

<div style="clear:both;"></div>

<div class="ServiceCenter">
	<h1 id="head1">고객센터 문의하기</h1>
	<div class="demand">
		<p><b>고객센터 글 등록(helpRegisterView.do)</b><br><br>
			<b>요구사항 :</b> 한 개의 고객센터 글을 등록한다.<br>
			- 내용 : 사용자 ID, 제목, 내용을 필수로 입력받고<br>첨부 파일을 선택적으로 입력 받는다.<br>
	 		+ 댓글을 통하여 답변 할 수 있도록 댓글 기능을 추가 한다.<br>
	 		++ 시간 가용시 - 문의 내용을 비밀로 하기 위해 비밀글 기능을 추가 한다.
		</p>
	</div>
	<form action="./helpRegister.do" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="helpNum" id="" class="" required value="0">
		<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="helpUserId" id="helpUserId" class="" value='<sec:authentication property="principal.userId"/>'>
		</sec:authorize>
		
		<table class="ServiceCenterTable">
			
			<tr>
				<td>ID</td>
				<td>
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.userId"/>
					</sec:authorize>
				</td>
			</tr>
			
			<tr>
				<td>카테고리</td>
				<td>
					<select name="helpCategory" required>
							<option disabled selected hidden value="">카테고리 선택</option>
							<option>신고합니다</option>
							<option>문의합니다</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="" name="helpTitle" required placeholder="제목을 입력해 주세요.">
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea id="" name="helpContent" class="" rows="200" required placeholder="내용을 입력해 주세요."></textarea>
				</td>
			</tr>
			
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="multiImage" style="border-style:none">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" id="ButtonTd" style="border-top: 1px solid #1e1e1e;">
					<div class="ButtonDiv">
						<button type="submit">등록</button>
						<button type="reset">취소</button>
					</div>
				</td>
			</tr>
		</table> 
		<sec:csrfInput/><%-- csrf 토큰 --%>  
	</form>
</div>