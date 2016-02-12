<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% pageContext.setAttribute( "newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/assets/css/study.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url ="/WEB-INF/views/include/header.jsp"/>
		<div id="content">
			<div id="study" class="study-form">
				<table class="tbl-ex">
					<tr>
						<th colspan="2">글보기</th>
					</tr>

					<tr>
						<td class="label">제목</td>
						<td>${vo.title }</td>
					</tr>
					<tr>
 
					<tr>
						<td class="label">내용</td>
						<td>
							<div class="view-content">
								${fn:replace( vo.content, newLine, '<br>' ) }	
							</div>
						</td>
					</tr>
					<c:if test = "${not empty vo.filename }">
					<tr>
						<td>첨부파일</td>
						<td>
							<a href="${pageContext.request.contextPath}${vo.filename }">다운받기</a>
						</td>	
					
					</tr>
					</c:if>
				</table>
				<div class="bottom">
					<a href="${pageContext.request.contextPath}/study/">글목록</a>
					<c:if test='${authUser.no == vo.memberNo }'>
					<a href="${pageContext.request.contextPath}/study/modify/${vo.no }">글수정</a>
					</c:if>
					<c:if test='${not empty authUser }'>
						<a href="${pageContext.request.contextPath}/study/reply/${vo.no }">답글</a>
					</c:if>
				</div>
			</div>
		</div>
	<c:import url ="/WEB-INF/views/include/navigation.jsp"/>
	<c:import url ="/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>