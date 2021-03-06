<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<%@ include file="../include/header.jsp"%>

<!-- Main content -->
<div class="bs-docs-header" id="content" tabindex="-1" style="position:relative;padding:30px 0;background-image:-webkit-linear-gradient(top,#563d7c 0,#6f5499 100%);"> 
	<div class="container"> 
		<h1 style="font-size:50px;color:#FFFFFF">새 글 작성하기</h1>
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
	<div class="col-md-12">
	   <div class="box">
	      <div class="box-header with-border">
	         <h4 class="box-title">글 쓰기</h4>
	         <form id='registerForm' role="form" method="post">
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
	                  <label for="exampleInputEmaill1">Writer</label> 
	                  <input type="text" name="writer" class="form-control" value="${login.uid }" readonly>
	               </div>
	    
	               <div class="form-group">
		               <label for="exampleInputEmaill1">File Drop Here</label>
			               <div class="row fileupload-buttonbar">
				            <div class="col-lg-12">
				                <div class="fileUpload btn btn-success">
				                	<i class="glyphicon glyphicon-plus"></i>
								    <span>Upload</span>
								    <input type="file" class="upload" id="uploadFile"/>
								</div>
				                <style>
				                	 .fileUpload {
									    position: relative;
									    overflow: hidden;
									    margin: 10px;
									}
									.fileUpload input.upload {
									    position: absolute;
									    top: 0;
									    right: 0;
									    margin: 0;
									    padding: 0;
									    font-size: 20px;
									    cursor: pointer;
									    opacity: 0;
									    filter: alpha(opacity=0);
									}
								</style>
				            </div>
				        </div>
	               </div>
	            </div>
	
	            <div class="box-footer">
	            	<div>
	            		<hr>
	            	</div>
	            	<table role="presentation" class="table table-striped">
            		 	<tbody class="mailbox-attachments clearfix uploadedList">
            		 	</tbody>
            		 </table>  	
		        </div>
	            	<button type="submit" class="btn btn-primary">Submit</button>
	            	<input type="button" class="btn btn-warning" VALUE="Back" onClick="history.go(-1);return true;">
	            </div>
	         </form>
	      </div>
	   </div>
	</div>
</div>
<script>
	var filesize;
	Handlebars.registerHelper('fileSize', function() {
	  return new Handlebars.SafeString(
	    "<td style='vertical-align: middle;'>" + filesize.toFixed(2) + "KB</td>"
	  );
	});
	$('#uploadFile').on("change", function(){ 
		var file;
		var input = document.getElementById('uploadFile');
		for (var i = 0; i < input.files.length; ++i){
	        alert(input.files[i]);
	        file = input.files[i];
	        filesize=(file.size)/1024;
	    }  		

		
		var formData = new FormData();
		
		formData.append("file", file);	
		waitingDialog.show();
		
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
				  $("#uploadFile").val("");
				  waitingDialog.hide();
			  }
			});	
	});
	$(".uploadedList").on("click", ".delbtn" ,function(event){

		event.preventDefault();
		alert($(this).val());
		var that = $(this);


			$.ajax({
				url:"/deleteFile",
				type:"post",
				data: {fileName:$(this).val()},
				dataType:"text",
				success:function(result){
					console.log("RESULT: " + result);
					if(result == 'deleted'){
						that.closest("tr").remove();
					}
				}
			});
		});

</script>
<script id="template" type="text/x-handlebars-template">
<tr class="template-upload fade in">
  <td style="vertical-align: middle;" align="center"><span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span></td>
  <td style="vertical-align: middle;" align="center">
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
  </div>
  </td>
	{{{fileSize}}}
  <td style="vertical-align: middle;">
	<button type="button" value="{{fullName}}" class="btn btn-danger delete delbtn"><i class="glyphicon glyphicon-trash"></i>
       <span>Delete</span>
    </button>
  </td>
</tr>             
</script>
<script>
	
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$("#registerForm").submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).val() +"'> ";
		});
		
		that.append(str);
	
		that.get(0).submit();
	});

</script>
<script>
var waitingDialog = waitingDialog || (function ($) {
    'use strict';

	// Creating modal dialog's DOM
	var $dialog = $(
		'<div class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top:15%; overflow-y:visible;">' +
		'<div class="modal-dialog modal-m">' +
		'<div class="modal-content">' +
			'<div class="modal-header"><h3 style="margin:0;"></h3></div>' +
			'<div class="modal-body">' +
				'<div class="progress progress-striped active" style="margin-bottom:0;"><div class="progress-bar" style="width: 100%"></div></div>' +
			'</div>' +
		'</div></div></div>');

	return {
		/**
		 * Opens our dialog
		 * @param message Custom message
		 * @param options Custom options:
		 * 				  options.dialogSize - bootstrap postfix for dialog size, e.g. "sm", "m";
		 * 				  options.progressType - bootstrap postfix for progress bar type, e.g. "success", "warning".
		 */
		show: function (message, options) {
			// Assigning defaults
			if (typeof options === 'undefined') {
				options = {};
			}
			if (typeof message === 'undefined') {
				message = 'Loading';
			}
			var settings = $.extend({
				dialogSize: 'm',
				progressType: '',
				onHide: null // This callback runs after the dialog was hidden
			}, options);

			// Configuring dialog
			$dialog.find('.modal-dialog').attr('class', 'modal-dialog').addClass('modal-' + settings.dialogSize);
			$dialog.find('.progress-bar').attr('class', 'progress-bar');
			if (settings.progressType) {
				$dialog.find('.progress-bar').addClass('progress-bar-' + settings.progressType);
			}
			$dialog.find('h3').text(message);
			// Adding callbacks
			if (typeof settings.onHide === 'function') {
				$dialog.off('hidden.bs.modal').on('hidden.bs.modal', function (e) {
					settings.onHide.call($dialog);
				});
			}
			// Opening dialog
			$dialog.modal();
		},
		/**
		 * Closes dialog
		 */
		hide: function () {
			$dialog.modal('hide');
		}
	};

})(jQuery);
</script>
<%@include file="../include/footer.jsp"%>