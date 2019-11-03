<%@page import="member.memberdto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	function check(){
		if(document.del.password.value == ""){
			alert("비밀번호를 입력하십시오!!!");
		}else{
			document.del.submit();
		}
	}
</script>
<%@ include file = "/WEB-INF/views/Layout/Header.jsp"%>
<div align="center">
	<form action="CheckDelete.do" method="post" name = "del">
		<table border="1">
			<tr>
				<th>${id }님의 비밀번호 확인</th>
			</tr>
			<tr>
				<td>
					<input type="password" name = "password" placeholder="비밀번호 확인">
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="button" value = "탈퇴" onclick="javascript:check()">
					<input type="button" value = "돌아가기" onclick="history.back()">				
				</td>
			</tr>
		</table>
	</form>
</div>


<%@ include file = "/WEB-INF/views/Layout/Footer.jsp"%>