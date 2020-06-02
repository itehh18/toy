<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Day</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

<!-- start : page - read day -->

	<!-- start : Container -->
	<div id="days" class="container color white pagebox" >
	
		<!-- start : navigation -->
		<%@include file="navBar.html" %>	
		<!-- end : navigation -->
		
			<!-- start : Wrapper -->
			<div class="wrapper span12">
			
			<!-- start : Page Title -->
			<div id="page-title">
				
				<div id="page-title-inner">
				<h2><span>Day</span></h2>
				</div>
			</div>
			<!-- end : Page Title -->

	<input type="hidden" id="userNum" >
	
	<center>
	I'm a ${identify}<br>
	<input type="hidden" id="identify" name="identify" value="${identify}">
	</center>
	
	<!-- start : 1st section - day view -->
	<div class="readpage-wrap" id="fixNextTag">

	<table class="table table-striped">
		<thead>
			<tr>
				<th> ${day.day_num}</th>
				<th> ${day.day_title } </th>
				<th style="text-align: right"> ${day.member_num } </th>
			</tr>
		<thead>
	<tbody>
		<tr style="height:200px">
			<td colspan="3"> ${day.day }</td>
		</tr>
	</tbody>
	</table>
	</div>

	<!-- end : 1st section - day view -->
	
	
	<!-- start : 2st section - reply -->
	
	<div class="row-fluid">
	
	<table>
		<tbody id="addlist">
			
		</tbody>
	</table>

	<div id="replywriteform" style="">	
		<input type="hidden" id="dnum" name="dnum" value="${day.day_num }" >
		<input type="hidden" name="userNum" value="${userInfo.member_num }" >
		<input type="text" name="reply" >
		<!-- 		<input class="btn-success" style="background-color: transparent; padding:0px;" 
		type="submit" value="등록">
		 -->
		
		<button class="btn-success" onclick="writeReply(${day.day_num },${userInfo.member_num } )">등록</button>
	</div>
	
		<div id="repagenav"></div>
		<input type="hidden" id="repagenum" name="repagenum" value="1"/>
		<input type="hidden" id="totalrepnum" name="totalrepnum" >
	
	</div>
	<!-- end : 2st section - reply -->

	
	<!-- start : 3st section - button -->



<center>
	<a onclick="modifyDay()" class="button btn-success"><span>수정</span></a>
	<a onclick="deleteDay()" class="button btn-success"><span>삭제</span></a>
</center>

<center>
	<button type="button" class="button btn-success" onclick="javascript:window.list();return false;">
	<span>목록</span></button>
	<input type="hidden" id="dpcode" value="">
	<button id="listBtn" onclick="javascript:window.location='diarydays.do?dvol=${day.diary_volum}&mnum=${day.member_num }';return false" 
	class="button btn-success"><span>일기장 보기</span></button>
	<button id="scrapBtn" class="button btn-success" onclick="javascript:window.scrap()">
	<span>스크랩</span></button>
</center>



	<!-- end : 3st section - button -->

		</div>
		<!-- end : Wrapper -->
	
	</div>
	<!-- end : Container -->
	
	
<%@include file="/WEB-INF/include/include-bottom.jspf" %>
<script type="text/javascript">
    
$(document).ready(function(){
	
	 //로그인 판단해서 댓글 입력 창 설정
	 if($("#identify").val() == "member"){
		 
	 }
		 
	 
	//스크롤 감지
	
	//로딩중 띄우기

    //목록 추가
    function addList(){
    	var pageno = ($("#repagenum").val());
    	pageno++;
    	_movePage(pageno);

    };

	//로그인된 상태라면
		//해시값이 있으면 페이지 이동
		if(document.location.hash){
			var hash = window.location.hash.replace("#", "");
			var target = $("#"+hash);
			var repage = Math.floor(hash/20)+1;
			window.location.hash = page;
		
			$("#repagenum").val(page);
			
			for(var i=1; i<=page; i++){
				selectReplyList(i);
			}
		
			location.hash = "#repage"+repage;
		//아니면 첫 페이지 불러오기
		}else{
			selectReplyList(1);
		}
	
});	
</script>

<script type="text/javascript">

//목록 추가 ajax
function selectReplyList(repageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/td/replylist.do' />");
    comAjax.addParam("dnum", $("#dnum").val());
    comAjax.setCallback("selectCallback");
    comAjax.addParam("repagenum",repageNo);
    comAjax.ajax();
}

function writeReply(dnum, userNum){
	 var comAjax = new ComAjax();
	    comAjax.setUrl("<c:url value='/td/writereply.do' />");
	    comAjax.setCallback("insertCallback");
	    comAjax.addParam("dnum",dnum);
	    comAjax.addParam("userNum",unum);
	    comAjax.ajax();
}
 
function selectCallback(data){
	
    var total = data.total;
    var totalpnum = Math.ceil(total/20);
   
   //총 페이지 갯수 저장
   $("#totalrepnum").val(totalpnum);
  
    if(total == 0){
        var str = "<td colspan='4'>작성된  댓글이 없습니다.</td>";
        body.append(str);
    }
    else{
    	callbackReplyList(data);
    }
}

function insertCallback(data){
	
    var total = data.total;
    var totalpnum = Math.ceil(total/20);
   
   //총 페이지 갯수 저장
   $("#totalrepnum").val(totalpnum);
  
    if(total == 0){
        var str = "<td colspan='4'>작성된  댓글이 없습니다.</td>";
        body.append(str);
    }
    else{
    	callbackReplyInsert(data);
    }
}
</script>
</body>
</html>