<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
							<div class="input-group input-group-sm" id="search-box">
                            	<span class="input-group-btn">
                            		 <select class="form-control" name="searchType">
										<option value="n"
											<c:out value="${cri.searchType==null?'selected':'' }"/>>
											---</option>
										<option value="t"
											<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
											Title</option>
										<option value="c"
											<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
											Content</option>
										<option value="w"
											<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
											Writer</option>
										<option value="tc"
											<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
											Title OR Content</option>
										<option value="cw"
											<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
											Content Or Writer</option>
										<option value="tcw"
											<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
											Title OR Content Or Writer</option>
									</select>
                            	</span>
                            		<input type="search" name="keyword" class="form-control" id="keywordInput" placeholder="검색어" value="${cri.keyword }">
		                        <span class="input-group-btn">
		                            <button id="searchBtn" class="btn btn-default">
			                            <span class="glyphicon glyphicon-search" aria-hidden="true">
			                            </span>
		                            </button>
		                        </span>
		                    </div>	
</body>
</html>