<%@page import="member.memberdto.MemberDTO"%>
<%@page import="member.memberdao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/Layout/Header.jsp"%>
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
 		<td>${dto.email }</td>
 	</tr>
 	<tr>
 		<td>학번</td>
 		<td>${dto.code }</td>
 	</tr>
 	<tr>
 		<td>전화번호</td>
 		<td>${dto.tel1 }-${dto.tel2 }-${dto.tel3 }</td>
 	</tr>
 	<tr>
 		<td colspan="2" align="right">
 			<input type="button" value = "수정" onclick="location.href = 'UpdateForm.do'">
 			<input type="button" value = "회원탈퇴" onclick="location.href = 'DeleteForm.do'">
 		</td>
 	</tr>
 </table>
<%@ include file = "/WEB-INF/views/Layout/Footer.jsp"%>