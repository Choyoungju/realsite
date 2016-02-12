<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List"%>
<%@ page import="com.hanains.mysite.dao.DiaryDao"%>
<%@ page import="com.hanains.mysite.vo.DiaryVo"%>
<%@ page import="com.hanains.mysite.vo.UserVo"%>

<%
	UserVo authUser = (UserVo) session.getAttribute("authUser");
	//jsp는 이렇게 쓰지만 서블릿에서는 request.getSession();
%>
<%
	//object to down casting
	List<DiaryVo> list = (List<DiaryVo>) request.getAttribute("list");
	pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="${pageContext.request.contextPath}/assets/css/diary.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>




<c:if test="${param.result == 'fail'}">
	<script>
		$(function() {
			alert("빈칸을 채워주세요.");
		});
	</script>
</c:if>

<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/layout.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/prettyPhoto.css"
	type="text/css">
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/cufon-yui.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/cufon-replace.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/Josefin_Sans_600.font.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/Lobster_400.font.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/sprites.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/gSlider.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery.prettyPhoto.js"></script>
<!--[if lt IE 7]> <div style=' clear: both; height: 59px; padding:0 0 0 15px; position: relative;'> <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="${pageContext.request.contextPath}/assets/http://www.theie6countdown.com/images/upgrade.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div> <![endif]-->
<!--[if lt IE 9]><script src="${pageContext.request.contextPath}/assets/js/html5.js" type="text/javascript"></script><![endif]-->
<!--[if IE]><link href="css/ie_style.css" rel="stylesheet" type="text/css" /><![endif]-->
</head>


<body id="page5">

	<div id="main">
		<header>
		<nav>
			<ul>
		<li><a href="${pageContext.request.contextPath}/">Cho</a></li>
		<li><a href="${pageContext.request.contextPath}/guestbook">guestbook</a></li>
		<li><a href="${pageContext.request.contextPath}/board">Board</a></li>
		<li><a href="${pageContext.request.contextPath}/study">Study</a></li>
		<li><a href="${pageContext.request.contextPath}/diary">diary</a></li>
		</ul>
	</nav>
			<h1>
				<a href="index.html">Web Wants</a>
			</h1>
			<div class="header-slider">
				<ul>
					<li>This is one of created by Web application. This website is
						optimized for 1024X768 screen resolution.</li>
					<li>This website template has several pages: About, Video,
						Gallery, Tour Dates, Map</li>
					<li>Hello yo</li>
				</ul>
			</div>
			<a href="#" class="hs-prev"><img
				src="${pageContext.request.contextPath}/assets/images/prev.png"
				alt=""></a> <a href="#" class="hs-next"><img
				src="${pageContext.request.contextPath}/assets/images/next.png"
				alt=""></a> <a href="#" class="header-more">home</a>
		</header>
		<article id="content">
			<div class="col-1">
				<div class="p2">
					<h2>New Album</h2>
					<img
						src="${pageContext.request.contextPath}/assets/images/thumb.jpg"
						class="p1" alt=""> <a href="#" class="more">home</a>
				</div>
				<div class="p2">
					<h2>New Video</h2>
					<a
						href="video/video_AS3.swf?width=512&amp;height=288&amp;fileVideo=drum.mp4"
						rel="prettyPhoto"><img class="p1"
						src="${pageContext.request.contextPath}/assets/images/avi.png"
						alt=""></a>
					<div class="alc">
						<a href="">More Videos</a>
					</div>
				</div>
				<div class="p2">
					<h2>Latest Photos</h2>
					<a href="index-4.html"><img class="p1"
						src="${pageContext.request.contextPath}/assets/images/happy.jpg"
						alt=""></a>
					<div class="alc">
						<a href="index-4.html">View Gallery</a>
					</div>
				</div>
			</div>
			<div class="col-2">
				<h2 class="pl">Diary</h2>
				<div id="contents">
			<div id="guestbook" class="delete-form">
				<form method="post" action="${pageContext.request.contextPath}/diary/delete">
					<input type='hidden' name="no" value="${param.id}">
					<label>비밀번호</label>
					<input type="password" name="password">
					<input type="submit" value="확인">
				</form>
				<a href="${pageContext.request.contextPath}/diary/">방명록 리스트</a>
			</div>
		</div>


			</div>
			<div class="col-3">
		<h2>Web application</h2>
		<div class="und">
		
			
			
			<ul>

		<c:choose>
			<c:when test="${empty authUser}">
				<li><a href="${pageContext.request.contextPath}/user/loginform">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/user/joinform">회원가입</a></li>
			</c:when>

			<c:otherwise>
			
							  <li ><a><%=authUser.getName()%>님 안녕하세요 ^^; </a></li>
				<li><${authUser.name}님 안녕하심?jstlel</li>
				<li><a href="${pageContext.request.contextPath}/user/modifyform">회원정보수정</a></li>
				<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>

			</c:otherwise>
		</c:choose>
		
	</ul>

		</div>
				<h2>Newsletter</h2>
				<form action="" id="subscribe">
					<fieldset>
						<label> <input type="text">
						</label> <input type="submit" value="">
					</fieldset>
				</form>
				<h2>Find Me</h2>
				<ul class="soc-ico">
					<li><a href="#"><img
							src="${pageContext.request.contextPath}/assets/images/facebook.png"
							alt=""></a></li>
					<li><a href="#"><img
							src="${pageContext.request.contextPath}/assets/images/twitter.png"
							alt=""></a></li>
					<li><a href="#"><img
							src="${pageContext.request.contextPath}/assets/images/myspace.png"
							alt=""></a></li>
					<li><a href="#"><img
							src="${pageContext.request.contextPath}/assets/images/linkedin.png"
							alt=""></a></li>
				</ul>
			</div>
		</article>
		<div class="af clear"></div>
	</div>
	<footer>
		<span> designed by Cho Young ju<br> provided by
			Ajou Univ. Media . Web application
		</span>
	</footer>
	<script type="text/javascript">
		Cufon.now()
		$(function() {
			$('nav,.more,.header-more').sprites()

			$('.header-slider').gSlider({
				prevBu : '.hs-prev',
				nextBu : '.hs-next'
			})

			$('a[rel=prettyPhoto]').each(function() {
				var th = $(this), pb
				th.append(pb = $('<span class="playbutt"></span>').css({
					opacity : .7
				}))
				pb.bind('mouseenter', function() {
					$(this).stop().animate({
						opacity : .9
					})
				}).bind('mouseleave', function() {
					$(this).stop().animate({
						opacity : .7
					})
				})
			}).prettyPhoto({
				theme : 'dark_square'
			})
		})
	</script>


</body>
</html>