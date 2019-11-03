<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/Layout/Header.jsp"%>
	<div align="center">
		<table id = "table">
			<caption style="font-weight: bold; font-size: x-large;">
				<c:if test="${mode eq null }">
					아이디 찾기 
				</c:if>
				<c:if test="${mode ne null }">
					패스워드 찾기
				</c:if>
			</caption>
			<tr>
				<th>Name</th>
				<td>${name }</td>
			</tr>
			<tr>
				<th>Id</th>
				<td>${id eq null ? "아이디를 찾을 수 없습니다." : id}</td>
			</tr>
			<c:if test="${mode ne null }">
				<tr>
					<th>PW</th>
					<td>${password eq null ? "비밀번호를 찾을 수 없습니다." : password }</td>
				</tr>
			</c:if>
		</table>
		<c:if test="${check }">
			<c:if test="${password eq null }">
				<a href="IDPASSFindForm.do?mode=pass&id=${id }">PASSWORD찾기</a> | 
				<a href="Login.do?id=${id }">Login</a>
			</c:if>
			<c:if test="${password ne null }">
				<a href="Login.do?id=${id }">Login</a>
			</c:if>
		</c:if>
		<c:if test="${!check }">
			<c:if test="${password eq null }">
				<a href="IDPASSFindForm.do">ID찾기</a> |
				<a href="Login.do">Login</a>
			</c:if>
			<c:if test="${password ne null}">
				<a href="IDPASSFindForm.do?mode=pass">PASSWORD찾기</a> | 
				<a href="Login.do">Login</a>
			</c:if>
		</c:if>
		
	</div>

<%@ include file = "/WEB-INF/views/Layout/Footer.jsp"%>










