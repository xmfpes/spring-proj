<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<%@ include file="../include/header.jsp"%>

<!-- Main content -->

<div class="container">
	<div class="col-md-12">
	   <div class="box">
	      <div class="box-header with-border">
	         <h4 class="box-title">글 쓰기</h4>
	         <form role="form" method="post">
	            <div class="box-body">
	               <div class="form-group">
	                  <label for="exampleInputEmaill1">Title</label> <input type="text"
	                     name="title" class="form-control" placeholder="Enter Title">
	               </div>
	
	               <div class="form-group">
	                  <label for="exampleInputPassword1">Content</label>
	                  <textarea class="form-control" name="content" rows="3"
	                     placeholder="Enter..."></textarea>
	               </div>
	
	               <div class="form-group">
	                  <label for="exampleInputEmaill1">Writer</label> <input type="text"
	                     name="writer" class="form-control" placeholder="Enter Writer">
	               </div>
	               
	               <div class="form-group">
             		<label for="exampleInputEmail1">File DROP Here</label>
             		<div class="fileDrop"></div>
	               </div>
	            </div>
	
	            <div class="box-footer">
	            	<div>
	            		<hr>
	            	</div>
	            	<ul class="mailbox-attachments clearfix uploadedList">
	            	</ul>
		        </div>
	            	<button type="submit" class="btn btn-primary">Submit</button>
	            	<input type="button" class="btn btn-warning" VALUE="Back" onClick="history.go(-1);return true;">
	            </div>
	            <style>
	            	.fileDrop
	            	{
	            		width:80%;
	            		height:100px;
	            		border:1px dotted gray;
	            		background-color:lightslategrey;
	            		margin:auto;
	            	}
	            </style>
	         </form>
	      </div>
	   </div>
	</div>
</div>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script> 
<script>
	
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		alert(files);
		var file = files[0];
	
		var formData = new FormData();
		
		formData.append("file", file);	
		
		
		$.ajax({
			  url: '/uploadAjax',
			  data: formData,
			  dataType:'text',
			  processData: false,
			  contentType: false,
			  type: 'POST',
			  success: function(data){
				  
				  var fileInfo = getFileInfo(data);
				  
				  var html = template(fileInfo);
				  
				  $(".uploadedList").append(html);
			  }
			});	
	});
	
	
	$("#registerForm").submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);
	
		that.get(0).submit();
	});

</script>
<%@include file="../include/footer.jsp"%>