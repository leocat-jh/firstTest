<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function check(){
		if(document.login.id.value == ""){
			alert("아이디를 입력하십시오!!");
		}else if(document.login.password.value == ""){
			alert("비밀번호를 입력하십시오!!");
		}else{
			document.login.submit();
		}
	}
</script>   
    
<%@ include file = "/WEB-INF/views/Layout/Header.jsp"%>
	<div align="center">
		<form action="CheckLogin.do" name = "login" method="post">
			<table id = "border" style="border-spacing: 0px;">
				<tr>
					<th id = "border">ID</th>
					<td id = "border"><input type="text" name = "id" value="${id }"></td>
				</tr>
				<tr>
					<th id = "border">PW</th>
					<td id = "border"><input type="password" name = "password"></td>
				</tr>
				<tr>
					<th id = "border" colspan="2" align="right">
						<c:if test="${check }">
							<input type="checkbox" value="true" name = "ckid">
						</c:if>
						<c:if test="${!check }">
							<input type="checkbox" value="true" name = "ckid" checked="checked">
						</c:if>
						<font size="1">아이디 기억하기</font>
						<input type="button" value = "Login" onclick="javascript:check()">
						<input type="button" value = "Cancel" onclick="document.login.reset()">
					</th>
				</tr>
			</table>
		</form>
		<div align="center">
			<a href="IDPASSFindForm.do">ID찾기</a> | 
			<a href="IDPASSFindForm.do?mode=pass">PASSWORD찾기</a>
		</div>
	</div>

<%@ include file = "/WEB-INF/views/Layout/Footer.jsp"%>