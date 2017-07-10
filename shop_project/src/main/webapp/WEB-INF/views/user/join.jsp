<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<div class="bs-docs-header" id="content" tabindex="-1"
	style="position: relative; padding: 30px 0; background-image: -webkit-linear-gradient(top, #563d7c 0, #6f5499 100%);">
	<div class="container">
		<h1 style="font-size: 50px; color: #FFFFFF">회원가입</h1>
		<p>An overview of Bootstrap, how to download and use, basic
			templates and examples, and more.</p>
		<div id="carbonads-container">
			<div class="carbonad">
				<div id="azcarbon">
					<!-- 					<span> -->
					<!-- 						<span class="carbonad-image"> -->
					<!-- 	  						<a href="https://www.graphicstock.com/join/browse?utm_campaign=AFFGS-BSACPA-affiliate-site1-joinbrowse&amp;utm_medium=affiliate&amp;utm_source=AFFGS-BSACPA-affiliate-site1-joinbrowse" target="_blank"><img width="130" height="100" border="0" src="https://assets.servedby-buysellads.com/p/manage/asset/id/28536" class="carbonad-image carbonad-img" style="max-width:130px;"></a> -->
					<!-- 	  					</span> -->
					<!-- 	  					<span class="carbonad-text"> -->
					<!-- 	  						<a href="https://www.graphicstock.com/join/browse?utm_campaign=AFFGS-BSACPA-affiliate-site1-joinbrowse&amp;utm_medium=affiliate&amp;utm_source=AFFGS-BSACPA-affiliate-site1-joinbrowse">90% Unlimited Downloads Choose from Over 300,000 Vectors, Graphics &amp; Photos.</a> -->
					<!-- 	  					</span> -->
					<!-- 	  					<span class="carbonad-tag"> -->
					<!-- 	  						ads via <a href="http://carbonads.com">Carbon</a> -->
					<!-- 	  					</span> -->
					<!-- 	  				</span> -->
				</div>
			</div>
		</div>
	</div>
</div>
<html>
<head>
</head>
<body class="login-page">
<div class="container">
	<div class="col-md-12">
	   <div class="box">
	      <div class="box-header with-border">
	         <h4 class="box-title">회원가입</h4>
	         <form id='registerForm' role="form" method="post">
	            <div class="box-body">
	               <div class="form-group">
	                  <label for="exampleInputEmaill1">아이디</label> <input type="text"
	                     name="uid" class="form-control" placeholder="id">
	               </div>
	
	               <div class="form-group">
	                  <label for="exampleInputEmaill1">패스워드</label> <input type="text"
	                     name="upw" class="form-control" placeholder="password">
	               </div>
	
	               <div class="form-group">
	                  <label for="exampleInputEmaill1">이름</label> 
	                  <input type="text" name="uname" class="form-control" placeholder="name">
	               </div>
	            </div>
	
	            <div class="box-footer">
 					<button type="submit" class="btn btn-primary">Submit</button>
	            	<input type="button" class="btn btn-warning" VALUE="Back" onClick="history.go(-1);return true;">
		        </div>
            </div>
         </form>
      </div>
   </div>
</div>
</body>
</html>
<%@include file="../include/footer.jsp"%>