<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/Layout/Header.jsp"%>
	<div align="center">
		${msg }<br>
		<c:if test="${check }">
			<a id = "link" href="MyPage.do">MyPage</a> | <a id = "link" href="DeleteForm.do">회원탈퇴</a> |
		</c:if>
		<c:if test="${!check }">
			<a href="IDPASSFindForm.do">ID찾기</a> | 
			<a href="IDPASSFindForm.do?mode=pass">PASSWORD찾기</a> | 
			<a href="Login.do">Login</a> |
		</c:if>
		<a href = "home.do">Home</a>
	</div>

<%@ include file = "/WEB-INF/views/Layout/Footer.jsp"%>