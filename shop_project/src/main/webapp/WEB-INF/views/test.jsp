<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="include/header.jsp"%>
<title>Ajax Test Page</title>
</head>
<body>
	<h2>Ajax Test Page</h2>
	<div>
		<div>
			REPLYER <input type='text' name='replyer' id='newReplyWriter'>
		</div>
		<div>
			REPLY TEXT <input type='text' name='replytext' id='newReplyText'>
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	<ul id="replies"></ul>
	<ul class="pagination" style="width:100%">
	</ul>
	<script type="text/javascript">
   	var bno=3;
   	
   	$.getJSON("/replies/all/"+bno, function(data){
   		console.log(data.length);
   		
   	});
   	function getAllList(){
   		$.getJSON("/replies/all/" + bno, function(data){
   	   		var str="";
   	   		console.log(data.length);
   	   		
   	   		$(data).each(function(){
   	   			str+="<li data-rno='"+this.rno+"' class='replyLi'>"+this.rno+":"+this.replytext+"</li>";
   	   			
   	   		});
   	   		$("#replies").html(str);
   	   	});
   	}
    getPageList(1);
    $("#replyAddBtn").on("click", function(){
       
       var replyer=$("#newReplyWriter").val();
       var replytext=$("#newReplyText").val();
       
       $.ajax({
          type:'post',
          url:'/replies',
          headers:{
             "Content-Type":"application/json",
             "X-HTTP-Method-Override":"POST"
          },
          dataType:'text',
          data:JSON.stringify({
             bno:bno,
             replyer:replyer,
             replytext:replytext
          }),
          success:function(result){	
             if(result=='SUCCESS'){
                alert("등록 되었습니다.");
             }
             getPageList(1);
          }
       });
    });
    $("#replies").on("click", ".replyLi button", function(){
        var reply=$(this).parent();
        
        var rno=reply.attr("data-rno");
        var replytext=reply.text();
        
        $(".modal-title").html(rno);
        $("#replytext").val(replytext);
        $("#modDiv").show("slow");
     });
     
     //delete처리
     $("#replyDelBtn").on("click", function(){
        var rno=$(".modal-title").html();
        var replytext=$("#replytext").val();
        
        $.ajax({
           type:'delete',
           url:'/replies/'+rno,
           //key:value
           headers:{
              "Content-Type":"application/json",
              "X-HTTP-Method-Override":"DELETE"
           },
           //{}범위를 묶어주는 용도
           dataType:'text',
           success:function(result){
              console.log("result:"+result);
              if(result=='SUCCESS'){
                 alert("삭제 되었습니다.");
                 $("#modDiv").hide("slow");
                 getAllList();
              }
           }
        });
     });
     
     //modify처리
     $("#replyModBtn").on("click", function(){
        var rno=$(".modal-title").html();
        var replytext=$("#replytext").val();
        
        $.ajax({
           type:'put',
           url:'/replies/'+rno,
           headers:{
              "Content-Type":"application/json",
              "X-HTTP-Method-Override":"PUT"
           },
           data:JSON.stringify({replytext:replytext}),
           dataType:'text',
           success:function(result){
              console.log("result:"+result);
              if(result=='SUCCESS'){
                 alert("수정 되었습니다.");
                 $("#modDiv").hide("slow");
                 //getAllList();
                 getPageList(replyPage);
              }
           }
        });
     });

     function getPageList(page){
        $.getJSON("/replies/"+bno+"/"+page, function(data){
           console.log(data.list.length);
           
           var str="";
           
           $(data.list).each(function(){
              str+="<li data-rno='"+this.rno+"' class='replyLi'>"
              +this.rno+":"+this.replytext+
              "<button>MOD</button></li>";
           });
           $("#replies").html(str);
           printPaging(data.pageMaker);
        });
     }
     
     function printPaging(pageMaker){
        var str="";
        if(pageMaker.prev){
           str+="<li><a href='"+(pageMaker.startPage-1)+"'></a></li>";
        }
        for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
           var strClass=pageMaker.cri.page==i?'class=active':'';
           str += "<li>"+strClass+"><a href='"+i+"'>"+i+"</a></li>";
        }
        
        if(pageMaker.next){
           str+="<li><a href='"+(pageMaker.endPage+1)+"'></a></li>";
        }
        $('.pagination').html(str);
     }
     


     var replyPage=1;
        $(".pagination").on("click", "li a", function(event){
           event.preventDefault();
           replyPage=$(this).attr("href");
           getPageList(replyPage);
        });
  </script>
</body>

</html>