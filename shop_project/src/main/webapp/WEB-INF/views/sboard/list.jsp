<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="bs-docs-header" id="content" tabindex="-1" style="position:relative;padding:30px 0;background-image:-webkit-linear-gradient(top,#563d7c 0,#6f5499 100%);"> 
	<div class="container"> 
		<h1 style="font-size:50px;color:#FFFFFF">커뮤니티</h1>
		<p>An overview of Bootstrap, how to download and use, basic templates and examples, and more.</p>
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
<div class="container">
	<div class="col-md-12 col-xs-12">
		<!-- Main content -->
		<div class="box">
			<div class="nav" role="navigation">
                <a href="/sboard/register" id="newBtn" class="create btn btn-success btn-wide pull-right"><i class="fa fa-pencil"></i> 새 글 쓰기</a>   
                <h4>커뮤니티</h4>
                <div class="category-filter-wrapper">
                    <form action="/articles/life" method="get" name="category-filter-form" id="category-filter-form">
                        <div class="category-filter-query pull-right">
						    <div class="input-group">
						      <span class="input-group-btn" style="width:40%">
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
						        <button class="btn btn-default" id="searchBtn" type="button">
						        	검색
						        </button>
						      </span>
						    </div>
                        </div>
                        <ul class="list-sort pull-left">
                            <li><a href="/articles/life?sort=id&amp;order=desc" data-sort="id" data-order="desc" class="category-sort-link active">최신순</a></li>
                            <li><a href="/articles/life?sort=voteCount&amp;order=desc" data-sort="voteCount" data-order="desc" class="category-sort-link ">추천순</a></li>
                            <li><a href="/articles/life?sort=noteCount&amp;order=desc" data-sort="noteCount" data-order="desc" class="category-sort-link ">댓글순</a></li>
                            <li><a href="/articles/life?sort=scrapCount&amp;order=desc" data-sort="scrapCount" data-order="desc" class="category-sort-link ">스크랩순</a></li>
                            <li><a href="/articles/life?sort=viewCount&amp;order=desc" data-sort="viewCount" data-order="desc" class="category-sort-link ">조회순</a></li>
                        </ul>
                        <input type="hidden" name="sort" id="category-sort-input" value="id">
                        <input type="hidden" name="order" id="category-order-input" value="desc">
                    </form>
                </div>
            </div>
			<div class="box-body">
				<div class="search-form">
					<div class="input-group input-group-sm">
						
					</div>
										
				</div>
				<table class="table table-bordered">
					<tr>
						<th style="width: 80px">번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th style="width: 70px">조회수</th>
					</tr>
					<!-- var은 쓸 변수 이름 -->
					<c:forEach items="${list}" var="boardVO">
						<tr>
							<td>${boardVO.bno }</td>
							<td>
								<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno }'>
									${boardVO.title }
									<strong style="font-size:10px; color:#ff8000;">
										[ ${boardVO.replycnt} ]
									</strong>
								</a>
							</td>
							<td>
								${boardVO.writer }
							</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate }"/>
							</td>
							<td>
								<span class="glyphicon glyphicon-eye-open" style="padding:2px; margin-right:1px;">
								</span> 
								${boardVO.viewcnt }
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage-1) }">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li <c:out value="${pageMaker.cri.page==idx?'class=active':'' }"/>>
								<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
							</li>
						</c:forEach>
	
						<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
					
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("게시글이 작성되었습니다.");
	}
	if (result == "REMOVESUCCESS") {
		alert("삭제가 완료되었습니다.")
	}
	if (result == "MODIFYSUCCESS") {
		alert("수정이 완료되었습니다.")
	}

	$(document).ready(function(){
		$('#searchBtn').on("click", function(event){
			self.location="list"
				+ '${pageMaker.makeQuery(1)}' 
				+ '&searchType='
				+ $("select option:selected").val()
				+ "&keyword=" + encodeURI($('#keywordInput').val());
		});
		$('#newBtn').on("click", function(evt){
			self.location = "register";
		});
	});
</script>