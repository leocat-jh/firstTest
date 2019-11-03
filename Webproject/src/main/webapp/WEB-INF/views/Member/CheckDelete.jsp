<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	if(${chk} ==0){
		alert("비밀번호가 틀렸습니다.!!이전페이지로....");
		history.back();
	}else{
		if(${check} != 0){
			alert("탈퇴성공!!!첫페이지로...");
			location.href = "home.do";
		}else{
			alert("탈퇴실패!!잠시후에 다시 시도하십시오..이전페이지로....");
			history.back();
		}
	}
</script>












