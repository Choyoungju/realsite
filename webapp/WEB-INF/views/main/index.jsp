<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.hanains.mysite.vo.UserVo"%>

<%
UserVo authUser = (UserVo) session.getAttribute("authUser");
	//jsp는 이렇게 쓰지만 서블릿에서는 request.getSession();
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/prettyPhoto.css" type="text/css">
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js//cufon-yui.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js//cufon-replace.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/Josefin_Sans_600.font.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/Lobster_400.font.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/sprites.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.jplayer.settings.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/gSlider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.prettyPhoto.js"></script>

</head>
<body id="page1">
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
	<h1><a href="index.html">Web Wants</a></h1>
	<div class="header-slider">
		<ul>
		<li>This is one of created by Web application. This website is optimized for 1024X768 screen resolution.</li>
		<li>This website has several pages: About, Video, Gallery, Tour Dates, Map</li>
		<li>이런식으로 슬라이딩 애니메이션 됩니당</li>
		</ul>
	</div>
	<a href="#" class="hs-prev"><img src="${pageContext.request.contextPath}/assets/images/prev.png" alt=""></a>
	<a href="#" class="hs-next"><img src="${pageContext.request.contextPath}/assets/images/next.png" alt=""></a>
	<a href="#" class="header-more">home</a>
</header>
  <div class="tumbvr">
	<div class="tumbvr-mask"></div>
	<ul>
		<li><img src="${pageContext.request.contextPath}/assets/images/01.jpg" alt=""></li>
		<li><img src="${pageContext.request.contextPath}/assets/images/02.jpg" alt=""></li>
		<li><img src="${pageContext.request.contextPath}/assets/images/03.jpg" alt=""></li>
		<li><img src="${pageContext.request.contextPath}/assets/images/04.jpg" alt=""></li>
		<li><img src="${pageContext.request.contextPath}/assets/images/05.jpg" alt=""></li>
		<li><img src="${pageContext.request.contextPath}/assets/images/06.jpg" alt=""></li>
		<li><img src="${pageContext.request.contextPath}/assets/images/07.jpg" alt=""></li>
		<li><img src="${pageContext.request.contextPath}/assets/images/08.jpg" alt=""></li>
	
	</ul>
  </div>
  <article id="content">
	<div class="col-1">
		<div class="p2">
		<h2>New Album</h2>
		<img src="${pageContext.request.contextPath}/assets/images/thumb.jpg" class="p1" alt=""> <a href="#" class="more">home</a></div>
		<div class="p2">
		<h2>New Video</h2>
		<a href="${pageContext.request.contextPath}/assets/video/video_AS3.swf?width=512&amp;height=288&amp;fileVideo=drum.mp4" rel="prettyPhoto"><img class="p1" src="${pageContext.request.contextPath}/assets/images/avi.png" alt=""></a>
		<div class="alc"><a href="">More Videos</a></div>
		</div>
	</div>
	<div class="col-2">
		<!-- audio player begin -->
		<div id="jplayer"></div>
		<div class="jp-audio">
		<h2>New Song</h2>
		<div class="jp-type-single">
			<div id="jp_interface_1" class="jp-interface">
			<ul class="jp-controls">
				<li><a href="#" class="jp-play"></a></li>
				<li><a href="#" class="jp-pause"></a></li>
				<li><a href="#" class="jp-prev">Previous Track</a></li>
				<li><a href="#" class="jp-next">Next Track</a></li>
				<li><a href="#" class="jp-more-songs">Listen to More Songs</a></li>
			</ul>
			<div class="jp-progress">
				<div class="jp-seek-bar">
				<div class="jp-play-bar"></div>
				</div>
			</div>
			<div class="jp-title"></div>
			</div>
		</div>
		</div>
		<!-- audio player end -->
		<h2 class="pl">Upcoming Tour Dates</h2>
		<div class="table-border">
		

             <script>
function successFunction(data,status,xhr){

	console.log(data.list.length);

	
	var text = ""
	
	for(var i = 0 ; i< data.list.length; i++){

            	text += "<tr>"
		text += "<td> " 
        text += '<a href="#" class="name">'+  data.list[i].name +  " </td>"
        text+="</a>"
        text += "<td> "  + data.list[i].date + " </td>"
        text += "<td> " + data.list[i].location + " </td>"
		text += "<td> " + data.list[i].running + " </td>"
		text +="</tr>"
	
	}
	$("#myList").html(text);
}

function rd(){
	//$.get("http://webauthoring.ajou.ac.kr/~id/merge/getContactID.php", successFunction,"${pageContext.request.contextPath}/assets/js/on");
    $.get("getContactID.php", successFunction,"${pageContext.request.contextPath}/assets/js/on");
}
$(document).ready(rd);



</script>



<table class="dates" cellpadding="0" cellspacing="0" border="0">
			<tr class="thead">
			<td class="col1">Date</td>
			<td class="col2">  who</td>
			<td class="col3">Information</td>
			</tr>
			<tr class="even">
			<td class="col1">2016/01/12 ~ 2016/01/14<br>
				<a href="#" class="name">올림픽공원 체조경기장</a><br>
				
			<td>박효신</td>
			<td>150분</td>
			</tr>

			<tr>
			<td class="col1">2016/01/19 ~ 2016/01/24<br>
				<a href="#" class="name">올림픽공원 체조경기장</a><br>
			
			<td>PSY</td>
			<td>180분</td>
			</tr>


			<tr class="even">
			<td class="col1">2016/01/27 ~ 2016/01/28<br>
				<a href="#" class="name">이화여대 대강당</a><br>
				
			<td>윤하</td>
			<td>120분</td>
			</tr>

			<tr>
			<td class="col1">2016/01/30 ~ 2016/01/31<br>
				<a href="#" class="name">경기도문화의전당 행복한대극장</a><br>
			
			<td>어반<br> 자카파</td>
			<td>120분</td>
			</tr>

			<tr class="even">
			<td class="col1">2016/01/31 ~ 2016/01/31<br>
				<a href="#" class="name">광주 염주종합체육관</a><br>
				
			<td>성시경</td>
			<td>150분</td>
			</tr>

            		<tr>
			<td class="col1">2016/02/07 ~ 2016/02/07<br>
				<a href="#" class="name">부산 벡스코(BEXCO)</a><br>
			
			<td>서태지</td>
			<td>150분</td>
			</tr>

            			<tr class="even">
			<td class="col1">2016/02/13 ~ 2016/02/14<br>
				<a href="#" class="name">충남대 정심화국제문화회관</a><br>
				
			<td>김동률</td>
			<td>140분</td>
			</tr>


		</table>
        <table id = "myList" class="dates" cellpadding="0" cellspacing="0" border="0"></table>






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
			<label>
			<input type="text">
			</label>
			<input type="submit" value="">
		</fieldset>
		</form>
		<h2>Find Me</h2>
		<ul class="soc-ico">
		<li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/facebook.png" alt=""></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/twitter.png" alt=""></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/myspace.png" alt=""></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/assets/images/linkedin.png" alt=""></a></li>
		</ul>
	</div>
  </article>
  <div class="af clear"></div>
</div>
<footer>
	<span>
    		designed by  Cho Young ju<br>
		provided by Ajou Univ. Media . Web application
	</span>
</footer>
<script type="text/javascript">Cufon.now()
$(function(){
	$('nav,.more,.header-more').sprites()

	$('.header-slider').gSlider({
		prevBu:'.hs-prev',
		nextBu:'.hs-next'
	})
})
$(window).load(function(){
	$('.tumbvr')._fw({tumbvr:{
		duration:2000,
		easing:'easeOutQuart'
	}})
	.bind('click',function(){
		location=""
	})
	
	$('a[rel=prettyPhoto]').each(function(){
		var th=$(this),
			pb
		th
			.append(pb=$('<span class="playbutt"></span>').css({opacity:.7}))
		pb
			.bind('mouseenter',function(){
				$(this)
					.stop()
					.animate({opacity:.9})
			})
			.bind('mouseleave',function(){
				$(this)
					.stop()
					.animate({opacity:.7})
			})
	})
	.prettyPhoto({theme:'dark_square'})
})
</script>
</body>
</html>