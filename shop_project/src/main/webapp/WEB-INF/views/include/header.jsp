<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.1/dist/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="screen" />
<title>그냥 사이트</title>
</head>
<body>
  <script type="text/javascript">
    $(function () {
      console.log("jQuery ready");
    });
  </script>
<div href="https://v4-alpha.getbootstrap.com/" class="banner">
	<ul class="nav navbar-nav-top"> 
		<c:if test="${empty login }">
			<li class="active"> 
				<a href="../user/login">로그인</a> 
			</li> 
		</c:if>
		<c:if test="${not empty login }">
			<li class="active"> 
					<a href="../user/logout">로그아웃</a> 
			</li> 			
			<li class="active">
				<a href="../user/login">${login.uid } 마이페이지</a>
			</li>
		</c:if>
	</ul> 
</div>
    <nav class="navbar navbar-default navbar-static-top" id="top">
		<div class="container">
			<div class="navbar-header">
	          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="navbar-brand" href="../">메인</a>
	        </div>
			<nav class="collapse navbar-collapse" id="navbar">
				<ul class="nav navbar-nav"> 
					<li>
						<a href="../shop/introduce">쇼핑몰 소개</a> 
					</li> 
					<li> 
						<a href="../shop/product">판매상품</a> 
					</li> 
					<li> 
						<a href="../sboard/list">커뮤니티</a>
					</li> 
					<li> 
						<a href="../help/list">고객센터</a>
					</li> 
				</ul>
				<ul class="nav navbar-nav navbar-right">
		            <li><a href="http://comic.naver.com/index.nhn">네이버 웹툰</a></li>
	          </ul>
			</nav> 
		</div>
	</nav>
</body>
</html>