<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String result = request.getParameter("result");
%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/assets/css/user.css" rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>

</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<div id="content">
			<div id="user">
				<form id="login-form" name="loginform" method="post" action="${pageContext.request.contextPath }/user/login">
					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="">
					<label class="block-label" >패스워드</label>
					<input name="password" type="password" value="">
					
					
					<c:if test="${param.result == ('fail' || 'error')}">
	<script>
		$(function() {
			alert("에러요.");
		});
	</script>
</c:if>
					<c:if test='${"error" == param.result }'>
						<p>
							로그인이 실패 했습니다.
						</p>
					</c:if>
					<input type="submit" value="로그인">
										<%
						if("fail".equals(result)){
					%>
					<p> 로그인에 실패했습니다 </p>
					<%
						}
					%>
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp"></c:import>
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
</body>
</html>