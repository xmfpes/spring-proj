<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<%@ include file="../include/header.jsp"%>


<style type="text/css">
	.popup {position: absolute;}
	.back { opacity:0.5; width: 50%; height: 100%; overflow:hidden;  z-index:1101;}
	.front { 
	   z-index:1110; opacity:1; boarder:1px; margin: auto; 
	  }
	 .show{
	   position:relative;
	   max-width: 1200px; 
	   max-height: 800px; 
	   overflow: auto;       
	 } 
</style>
<div class="bs-docs-header" id="content" tabindex="-1" style="position:relative;padding:30px 0;background-image:-webkit-linear-gradient(top,#563d7c 0,#6f5499 100%);"> 
	<div class="container"> 
		<h1 style="font-size:50px;color:#FFFFFF">글 상세보기</h1>
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
	<div class='col-md-10 popup back' style="display:none;"></div>
	<div id="popup_front" class='popup front' style="display:none;">
		<img id="popup_img">
	</div>
	<div class="col-md-12">
	   <!-- Main content -->
	   <div class="box">
		   <div class="bs-example" style="padding:15px;border-style: solid; border-width: 1px; border-color:#bbb;"data-example-id="basic-forms"> 
		      <div class="box-header with-border">
		         <a href="/sboard/register" id="newBtn" class="create btn btn-success btn-wide pull-right"><i class="fa fa-pencil"></i> 새 글 쓰기</a>   
	             <h4>커뮤니티</h4>
		      </div>
		      <form role="form" action="modifyPage" method="post">
			      <input type="hidden" name="bno" value="${boardVO.bno }"/>
			      <input type="hidden" name="viewcnt" value="${boardVO.viewcnt }"/>
			      <input type="hidden" name="page" value="${cri.page }"/>
			      <input type="hidden" name="perPageNum" value="${cri.perPageNum }"/>
			      <input type="hidden" name="searchType" value="${cri.searchType }"/>
			      <input type="hidden" name="keyword" value="${cri.keyword }"/>
		      </form>
		      <div class="box-body">
		      	<div class="form-group">
		      		<label for="exampleInputEmail1">Title</label>
		      		<input type="text" name="title" class="form-control" value="${boardVO.title }" readonly="readonly">
		      	</div>
		      	<div class="form-group">
		      		<label for="exampleInputPassword1">Content</label>
		      		<textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO.content }</textarea>
		      	</div>
		      	<div class="form-group">
		      		<label for="exampleInputEmail1">Writer</label>
		      		<input type="text" name="writer" class="form-control" value="${boardVO.writer }" readonly="readonly">
		      	</div>
		      	<div class="form-group">
			        <table role="presentation" class="table table-striped">
           		 		<tbody class="mailbox-attachments clearfix uploadedList">
           		 	</tbody>
           		 </table> 
		      	</div>
		      </div>
		      <div class="box-footer">
		       <c:if test="${login.uid==boardVO.writer }">
		       	<button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
				<button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
		       </c:if>
		       <button type="submit" class="btn btn-primary" id="goListBtn">목록 보기</button>
		      </div>
		   </div>
	   </div>
	
		<div class="row">
			<div class="col-md-12" style="padding-top:20px">
				<!-- The time line -->
				<ul id="reply_ul" class="timeline" style="list-style:none; margin-left:0px; padding-left:0px;">
				  	<li id="note-title_header" style="background-color:#f8f8f8; border-radius:0px; border-bottom:0px;" class="list-group-item">
	                    <h3 class="panel-title">댓글 <small id="replycntSmall">[ ${boardVO.replycnt } ]</small></h3>
              		</li>
				</ul>
				<div class='text-center'>				
					<ul class="pagination">
					</ul>
				</div>
				
				<div class="box box-success">
					<c:if test="${not empty login }">
						<div class="box-body">
							<div class="bs-example" style="padding:15px;border-style: solid; border-width: 1px; border-color:#bbb;"data-example-id="basic-forms"> 
								<div class="form-group"> 
									<label for="exampleInputEmail1">
										아이디
									</label> 
									<input class="form-control" type="text" value="${login.uid }" id="newReplyWriter" readonly="readonly">
									<div class="form-group"> 
									<label for="exampleInputPassword1">
										리플 내용
									</label> 
									<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
								 	</div> 
								</div> 
								<input type="submit" id="replyAddBtn" class="btn btn-success btn-wide" value=" 등록">
							</div>
						</div>
					</c:if>
					<c:if test="${empty login }">
						<div class="box-body">
							<div><a href="javascript:goLogin();">댓글을 작성하시려면 로그인이 필요합니다.</a></div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title"></h4>
		      </div>
		      <div class="modal-body" data-rno>
		        <p><input type="text" id="replytext" class="form-control"></p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-info" id="replyModBtn" data-dismiss="modal">Modify</button>
		        <button type="button" class="btn btn-danger" id="replyDelBtn" data-dismiss="modal">DELETE</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>     
	</div>
</div>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="list-group-item note-title" style="margin:0px; padding:0px;"data-rno={{rno}}>
	<div class="comment-main-level">
		<div class="comment-box">
			<div class="comment-head">
				<h6 class="comment-name by-author"><a href="http://creaticode.com/blog">{{replyer}}</a></h6>
				<span>{{prettifyDate regdate}}</span>
				{{#eqReplyer replyer}}
					<a data-toggle="modal" data-target="#modifyModal">
						<i class="glyphicon glyphicon-edit" aria-hidden="true"></i>
					</a>
				{{/eqReplyer}}
			</div>
			<div class="timeline-body" style="margin:15px;">{{replytext}}</div>
		</div>
	</div>
</li>
{{/each}}
</script>
<script id="templateAttach" type="text/x-handlebars-template">
<tr class="template-upload fade in">
  <td style="vertical-align: middle;" align="center"><span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span></td>
  <td style="vertical-align: middle;" align="center">
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
  </div>
  </td>
</tr>             
</script>
<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	Handlebars.registerHelper("eqReplyer", function(replyer, block) {
		var accum='';
		if(replyer == '${login.uid}'){
			accum+=block.fn();
		}
		return accum;
	});
	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".note-title").remove();
		target.after(html);

	}

	var bno = ${boardVO.bno};
	
	var replyPage = 1;

	function getPage(pageInfo){
		
		$.getJSON(pageInfo,function(data){
			printData(data.list, $("#note-title_header") ,$('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").hide();
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount +" ]");
			
		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};
	
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/replies/"+bno+"/"+replyPage);
		
	});
	
	$("#replyAddBtn").on("click",function(){
		 
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
		
		  
		  $.ajax({
				type:'post',
				url:'/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/"+bno+"/"+replyPage );
						replytextObj.val("");
					}
			}});
		  document.getElementById('note-title_header').scrollIntoView(true);
	});


	$(".timeline").on("click", ".note-title", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		console.log(reply.attr("data-rno"));
		
	});
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	});
	getPage("/replies/" + bno + "/1");
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/sboard/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});

	
	$("#removeBtn").on("click", function(){
		
		var replyCnt =  $("#replycntSmall").html().replace(/[^0-9]/g,"");
		
		if(replyCnt > 0 ){
			alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
			return;
		}	
		
		var arr = [];
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
			});
		}
		
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
	});	
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/sboard/list");
		formObj.submit();
	});
	
	var bno = ${boardVO.bno};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/sboard/getAttach/"+bno,function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
		});
	});
	


	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});
	
	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});	
	
		
	
});
</script>
<%@ include file="../include/footer.jsp"%>
