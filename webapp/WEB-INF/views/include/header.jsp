<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="com.hanains.mysite.vo.UserVo"%>
<%
UserVo authUser = (UserVo) session.getAttribute("authUser");
	//jsp는 이렇게 쓰지만 서블릿에서는 request.getSession();
%>


<div id="header">
<h1>My first Spring MVC2 Board</h1>
<ul>
		<li><a href="${pageContext.request.contextPath}/">조영주</a></li>
		<li><a href="${pageContext.request.contextPath}/guestbook">방명록</a></li>
		<li><a href="${pageContext.request.contextPath}/board">게시판</a></li>
		<li><a href="${pageContext.request.contextPath}/study">스터디</a></li>
		<li><a href="${pageContext.request.contextPath}/diary">일기장</a></li>
		
		
	
	</ul>
</div>