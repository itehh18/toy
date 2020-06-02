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
		type="submit" value="���">
		 -->
		
		<button class="btn-success" onclick="writeReply(${day.day_num },${userInfo.member_num } )">���</button>
	</div>
	
		<div id="repagenav"></div>
		<input type="hidden" id="repagenum" name="repagenum" value="1"/>
		<input type="hidden" id="totalrepnum" name="totalrepnum" >
	
	</div>
	<!-- end : 2st section - reply -->

	
	<!-- start : 3st section - button -->



<center>
	<a onclick="modifyDay()" class="button btn-success"><span>����</span></a>
	<a onclick="deleteDay()" class="button btn-success"><span>����</span></a>
</center>

<center>
	<button type="button" class="button btn-success" onclick="javascript:window.list();return false;">
	<span>���</span></button>
	<input type="hidden" id="dpcode" value="">
	<button id="listBtn" onclick="javascript:window.location='diarydays.do?dvol=${day.diary_volum}&mnum=${day.member_num }';return false" 
	class="button btn-success"><span>�ϱ��� ����</span></button>
	<button id="scrapBtn" class="button btn-success" onclick="javascript:window.scrap()">
	<span>��ũ��</span></button>
</center>



	<!-- end : 3st section - button -->

		</div>
		<!-- end : Wrapper -->
	
	</div>
	<!-- end : Container -->
	
	
<%@include file="/WEB-INF/include/include-bottom.jspf" %>
<script type="text/javascript">
    
$(document).ready(function(){
	
	 //�α��� �Ǵ��ؼ� ��� �Է� â ����
	 if($("#identify").val() == "member"){
		 
	 }
		 
	 
	//��ũ�� ����
	
	//�ε��� ����

    //��� �߰�
    function addList(){
    	var pageno = ($("#repagenum").val());
    	pageno++;
    	_movePage(pageno);

    };

	//�α��ε� ���¶��
		//�ؽð��� ������ ������ �̵�
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
		//�ƴϸ� ù ������ �ҷ�����
		}else{
			selectReplyList(1);
		}
	
});	
</script>

<script type="text/javascript">

//��� �߰� ajax
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
   
   //�� ������ ���� ����
   $("#totalrepnum").val(totalpnum);
  
    if(total == 0){
        var str = "<td colspan='4'>�ۼ���  ����� �����ϴ�.</td>";
        body.append(str);
    }
    else{
    	callbackReplyList(data);
    }
}

function insertCallback(data){
	
    var total = data.total;
    var totalpnum = Math.ceil(total/20);
   
   //�� ������ ���� ����
   $("#totalrepnum").val(totalpnum);
  
    if(total == 0){
        var str = "<td colspan='4'>�ۼ���  ����� �����ϴ�.</td>";
        body.append(str);
    }
    else{
    	callbackReplyInsert(data);
    }
}
</script>
</body>
</html>