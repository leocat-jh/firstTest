<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#header , #footer {
		border: 1px solid black;
		height: 40px;
		width: 600px;
		padding-top: 12px;
	}
	
	#main{
		width: 600px;
		min-height: 400px;
		padding-top: 15px;
	}
	
	#border{
		border: 1px solid black;
	}
	
	#table {
		width: 450px;
		border : 1px solid black;
		border-spacing: 0px
	}
	#button{
		width : 450px;
		text-align: right;
		padding-top: 15px;
	}
	
	#border {
		border : 1px solid black;
	}
	
	#link{
		text-decoration: none;
		font-weight: bold;
	}	
	
</style>

<%
	response.setHeader("pragma", "no-cache");              
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
	response.setHeader("Expires", "0"); 
%>

<script type="text/javascript">
	function logout() {
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="Logout.do"
		}
	}
	function board() {
		alert("게시판 제작중입니다!!");
	}
</script>

</head>
<body>
<div align="center">
	<div id = "header">
		<c:choose>
			<c:when test="${sessionScope.login != null }">
				${sessionScope.login }님
				<a id = "link" href="MyPage.do">MyPage</a> | 
				<a id = "link" href="javascript:logout()">Logout</a> | 
			</c:when>
			<c:otherwise>
				<a href = "Login.do" id = "link">Login</a> | 
				<a href="JoinForm.do" id = "link">Join</a> | 
			</c:otherwise>
		</c:choose>
		<a href = "javascript:board()" id = "link">Board |</a>
		<a href = "home.do" id = "link">Home</a>
	</div>
<div id = "main">
	
	
	
	
	
	
	
	
	
	
	
	
	
	