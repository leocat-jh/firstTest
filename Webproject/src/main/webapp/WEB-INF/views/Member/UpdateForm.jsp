<%@page import="member.memberdto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function check(){
		if(document.update.email.value == ""){
			alert("이메일을 입력하십시오!");
		}else if(document.update.tel1.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.update.tel2.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.update.tel3.value == ""){
			alert("전화번호를 입력하십시오!");
		}else{
			document.update.submit();
		}
	}
</script>
<%@ include file = "/WEB-INF/views/Layout/Header.jsp"%>
 	<form action="CheckUpdate.do" method="post" name = "update">
 		<table border="1" width = "450">
		 	<tr>
		 		<td>번호</td>
		 		<td>${dto.no }</td>
		 	</tr>
		 	<tr>
		 		<td>아이디</td>
		 		<td>${dto.id }</td>
		 	</tr>
		 	 	<tr>
		 		<td>이름</td>
		 		<td>${dto.name }</td>
		 	</tr>
		 	 	<tr>
		 		<td>이메일</td>
		 		<td><input type="text" name = "email" value="${dto.email }"></td>
		 	</tr>
		 	 	<tr>
		 		<td>전화번호</td>
		 		<td>
					<select name = "tel1">
						<option value="010" selected="selected">010</option>
						<option value="010">011</option>
						<option value="010">016</option>
						<option value="010">019</option>
					</select>
					-<input type="text" size = "5" maxlength="4" value="${dto.tel2 }" name = "tel2">
					-<input type="text" size = "5" maxlength="4" value="${dto.tel3 }" name = "tel3">
				</td>
		 	</tr>
		 	<tr>
		 		<td colspan="2" align="right">
		 			<input type="button" value = "수정" onclick="javascript:check()">
		 			<input type="button" value = "돌아가기" onclick="history.back()">
		 		</td>
		 	</tr>
		 </table>
 	
 	</form>
<%@ include file = "/WEB-INF/views/Layout/Footer.jsp"%>