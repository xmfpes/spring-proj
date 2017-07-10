<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<div class="bs-docs-header" id="content" tabindex="-1"
	style="position: relative; padding: 30px 0; background-image: -webkit-linear-gradient(top, #563d7c 0, #6f5499 100%);">
	<div class="container">
		<h1 style="font-size: 50px; color: #FFFFFF">로그인</h1>
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
<body class="login-page">
	<div class="container">
		<div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info" style="border-color:#bbb;">
				<div class="panel-heading" style="color:black; background-color:white; border-bottom: 1px solid #bbb">
					<div class="panel-title">로그인</div>
					<div style="float: right; font-size: 80%; position: relative; top: -10px;">
						<a href="#">비밀번호 찾기</a>
					</div>
				</div>
				<div style="padding-top: 30px" class="panel-body">
					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>
					<form action="/user/loginPost" method="post" id="loginform" class="form-horizontal" role="form">

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input id="login-username"
								type="text" name="uid" class="form-control" name="username" value=""
								placeholder="username or email">
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="login-password"
								type="password" name="upw" class="form-control" name="password"
								placeholder="password">
						</div>

						<div class="input-group">
							<div class="checkbox">
								<label> <input id="login-remember" type="checkbox"
									name="useCookie" value="1"> Remember me
								</label>
							</div>
						</div>

						<div style="margin-top: 10px" class="form-group">
							<!-- Button -->

							<div class="col-sm-12 controls">
								<a id="btn-login" href="#" class="btn btn-success">로그인 </a> <a
									id="btn-fblogin" href="#" class="btn btn-primary">Facebook 로그인</a>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									계정이 없으신가요?<a href="/user/join" onClick="$('#loginbox').hide(); $('#signupbox').show()">
										회원가입 </a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	var formObj = $("form[role='form']");
	
	$("#btn-login").on("click", function(){
		formObj.submit();
	});
</script>
</body>
</html>
<%@include file="../include/footer.jsp"%>