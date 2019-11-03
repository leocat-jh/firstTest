<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	function check(a){		
		if(document.form.name.value == ""){
			alert("이름을 입력하십시오!!!");
		}else if (a == 0  && document.form.id.value == ""){
			alert("아이디를 입력하십시오!!!");
		}else if(document.form.tel2.value == "" || document.form.tel3.value == ""){
			alert("전화번호를 하십시오!!!");
		}else{
			document.form.submit();
		}
	}
</script>

<%@ include file = "/WEB-INF/views/Layout/Header.jsp"%>
<div align="center">
	<form action = "CheckIdPass.do" name = "form" method="post">
		<table border="1">
			<tr>
				<th colspan="2">
					<c:if test="${mode eq null}">
						아이디 찾기
					</c:if>
					<c:if test="${mode ne null}">
						 패스워드 찾기
					</c:if>
				</th>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" name = "name"></td>
			</tr>
			<c:if test="${mode ne null}">
				<tr>
					<th>ID</th>
					<td><input type="text" name = "id" value="${id }"></td>
				</tr>
			</c:if>
			<tr>
				<th>Phone</th>
				<td>
					<select name = "tel1">
						<option value="010" selected="selected">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="019">019</option>
					</select>
					-<input type="text" size = "5" maxlength = "4" name = "tel2">
					-<input type="text" size = "5" maxlength = "4" name = "tel3">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="Find" onclick = "javascript:check(${mode!=null ? 0 : 1 })">
					<input type="button" value="Back" onclick = "history.back()">
				</td>
			</tr>
		</table>	
	</form>
</div>
<%@ include file = "/WEB-INF/views/Layout/Footer.jsp"%>