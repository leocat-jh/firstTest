<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	if(${check != 0}){
		alert("수정완료!!MyPage로...");
		location.href = "MyPage.do";
	}else{
		alert("수정실패!!이전페이지로...");
		history.back();
	}

</script>













