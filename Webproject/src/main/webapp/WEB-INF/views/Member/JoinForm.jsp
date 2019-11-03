<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function checkJoin(){
		if(document.join.id.value == ""){
			alert("아이디를 입력하십시오!");
		}else if(document.join.password.value == ""){
			alert("비밀번호를 입력하십시오!");
		}else if(document.join.repw.value == ""){
			alert("비밀번호확인을 입력하십시오!");
		}else if(document.join.name.value == ""){
			alert("이름을 입력하십시오!");
		}else if(document.join.email.value == ""){
			alert("이메일을 입력하십시오!");
		}else if(document.join.code.value == ""){
			alert("학번을 입력하십시오!");
		}else if(document.join.tel1.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.join.tel2.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.join.tel3.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.join.password.value != document.join.repw.value){
			alert("비밀번호가 일치하지 않습니다.");
		}else{
			document.join.submit();
		}
	}
</script>
<%@ include file = "/WEB-INF/views/Layout/Header.jsp"%>
<form action="CheckJoin.do" method="post" name = "join">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name = "id"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password" name = "password"></td>
		</tr>
		<tr>
			<td>rePW</td>
			<td><input type="password" name = "repw"></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" name = "name"></td>
		</tr>
		<tr>
			<td>E-Mail</td>
			<td><input type="text" name = "email"></td>
		</tr>
		<tr>
			<td>Code</td>
			<td><input type="code" name = "code"></td>
		</tr>
		<tr>
			<td>TEL</td>
			<td>
				<select name = "tel1">
					<option value="010">010</option>
					<option value="010">011</option>
					<option value="010">016</option>
					<option value="010">019</option>
				</select>
				-<input type="text" size = "5" maxlength="4" name = "tel2">
				-<input type="text" size = "5" maxlength="4" name = "tel3">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="Join" onclick="javascript:checkJoin()">
				<input type="button" value="Reset" onclick="document.join.reset()">
			</td>
		</tr>
	</table>
</form>
<%@ include file = "/WEB-INF/views/Layout/Footer.jsp"%>