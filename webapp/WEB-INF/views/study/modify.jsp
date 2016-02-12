<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/assets/css/study.css" rel="stylesheet"
	type="text/css">
		<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
	
	<c:if test="${param.result == 'fail'}">
	<script>
		$(function() {
			alert("빈칸을 채워주세요.");
		});
	</script>
</c:if>


</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/include/header.jsp" />
		<div id="content">
			<div id="study">
				<form class="study-form" method="post" action="${pageContext.request.contextPath}/study/update">
					<input type= "hidden" name="memberNo" value="${authUser.no}"> <input
						type="hidden" name="no" value="${study.no }">
					<table class="tbl-ex">
						<tr>
							<th colspan="2">글수정</th>
						</tr>
						<tr>
							<td class="label">제목</td>
							<td><input type="text" name="title" value=${study.title }></td>
						</tr>
						<tr>
						<tr>
							
						</tr>
						<tr>
							<td class="label">내용</td>
							<td><textarea id="study-content" name="content">${study.content }</textarea>
							</td>
						</tr>
						
						<td align="right" td class="label">파일첨부</td>
							<td align="left" style="padding-left: 20; padding-right: 30">
								<input type="file" name="attachFile"
								style="color: slategray; border: 1 solid silver; width: 300; height: 20">
								(최대 4M)
							</td>
							
							
					</table>
					<div class="bottom">
						<a href="${pageContext.request.contextPath}/study">취소</a> <input type="submit"
							value="수정">
					</div>
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp" />
		<c:import url="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
</html>