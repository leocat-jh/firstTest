<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	if(${check == 1}){
		alert("회원 가입에 성공하셨습니다..로그인 페이지로..");
		location.href = "Login.do?id=${id }";
	}else{
		alert("회원 가입에 실패하였습니다..이전 페이지로..");
		history.back();
	}
</script>













