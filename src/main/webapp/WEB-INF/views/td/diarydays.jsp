<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Travel Diary</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

<!-- start : page - day list -->

	<!-- start : Container -->
	<div id="diarydays" class="container color yellow pagebox">
	
		<!-- start : navigation -->
		<%@include file="navBar.html" %>
		<!-- end : navigation -->
	
		<!-- start : Wrapper -->
		<div class="wrapper span12">
		
		<!-- start : Page Title -->
		<div id="page-title">
			<div id="page-title-inner">
			<h2><span>My Days</span></h2>
			</div>
		</div>
		<!-- end : Page Title -->
		
		<center>
		I'm a ${identify}<br>
		<b>${diaryInfo.diary_title }</b><br>
		${diaryInfo.start_day } - ${diaryInfo.end_day }<br>
		Travel in ${location }
		
		
		<input type="hidden" id="identify" name="identify" value="${identify}">
		<input type="hidden" id="mnum" name="mnum" value="${mnum }">
		<input type="hidden" id="dvol" name="dvol" value="${dvol }">
		<input type="hidden" id="prog" name="prog" >
		</center>
		
		<!-- start: Row -->
		<div class="row-fluid">
				
			<!-- Ȯ���ϰ� ����� -->
			<div class="span12">
				
				<!-- start: Skills -->
		       	<h3>Achievement</h3>
		       	<ul class="progress-bar-stripes">
		        	<li>
		            	<div class="meter"><p></p><span style="width: %"></span></div>
		          	</li>
		      	</ul>
		      	<!-- end: Skills -->
	      	</div>
	      	
   	  	</div>
   		<!-- end : Row -->
      		
      		
		<!-- start: Row -->
		<div class="row-fluid">		
			<!-- Ȯ���ϰ� ����� -->
			<div class="span12">

	
		<div class="table-wrap" id="fixNextTag">
		
		<table class="table table-striped table-hover " id="days">
			<thead>
				<tr>
					<th>NO</th>
					<th>TITLE</th>
					<th>DATE</th>
					<th>TIME</th>
					<th>HITS</th>
				</tr>
			</thead>
			<tbody id="addlist">
				
			</tbody>
		</table>
		
		<div id="pagenav"></div>
		<input type="hidden" id="pagenum" name="pagenum" value="1"/>
		<input type="hidden" id="totalpnum" name="totalpnum" >

		</div>
		<center>
		<div class="btn-wrap" style="margin: 0 0 20px 0; display:none;">
			
			<button class="button btn-warning" onclick="openWriteDay(${dvol})">
			<span>�ϱ⾲��</span></button>
			<button class="button btn-warning" onclick="openModifyDiary(${dvol})">
			<span>�ϱ��� ����</span></button>
			<button class="button btn-warning" onclick="javascript:deleteDiary(${dvol}, ${mnum})">
			<span>�ϱ��� ����</span></button>
	
			<!-- �α��ε� ���¶�� ���ǿ��� ������ �����ͼ� �̵��� �� ������ �Ǵ� ���̴� ���� userNum�� �Ѱ��� �ʿ�� ����� -->
			<button class="button btn-warning" onclick="javascript:window.location='/TravelDiary/td/mydiary.do'">
			<span>�� �ϱ��� ���</span></button>
			

		</div>
			<button class="button btn-warning" onclick="javascript:window.location='/td/diaryList.do'">
			<span>�ϱ��� ���</span></button>
			</center>
			</div></div>
		</div>
		<!-- end : Wrapper -->
		
	</div>
	<!-- end : Container -->
<center><div id="lastPostsLoader" style="margin-bottom: 6%"></div></center>
<%@include file="/WEB-INF/include/include-bottom.jspf" %>

<script type="text/javascript">
    
$(document).ready(function(){

	 
	//��ũ�� ����
    $(window).scroll(function(){  
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){  
           lastPostFunc();
        }  
    });
	
	//�ε��� ����
    function lastPostFunc()  
    {  
		var totalpnum = $("#totalpnum").val();
		var pnum = $("#pagenum").val();
		
		if(pnum < totalpnum){
	        $("#lastPostsLoader").html("�ε���...");  
	        addList();
		} else {
			 $("#lastPostsLoader").html("����");
		}
        
    };  

    //��� �߰�
    function addList(){
    	var pageno = ($("#pagenum").val());
    	pageno++;
    	_movePage(pageno);

    };

	/*
	//�ؽ����� �����ϸ� �׸�Ŭ �ҷ����� ��Ŀ�� �ֱ�, ������ ù ������ �ҷ�����
	if(document.location.hash){
		
		var hash = window.location.hash.replace("#", "");
		var target = $("#"+hash);
		var page = Math.floor(hash/20)+1;
		window.location.hash = page;
		
		$("#pagenum").val(page);
		
		for(var i=1; i<=page; i++){
			fn_selectBoardList(i);
		}
		
		location.hash = "#page"+page;
	}else{
		if($("#status").val() == "memebr"){
			fn_selectBoardList(1);
		}else{
			$("html, body").css("height", "100%");
			$("#filters").hide();
		}
	}
	*/
	$("html, body").css("height", "100%");
	
	//�ش��ϴ� �ϱ����� �α��ε�  user�� �ϱ����̸� ǥ���� ��ư
	//if($("#identify").val() == "login"){
		
		

		//�ؽð��� ������ ������ �̵�
		if(document.location.hash){
			var hash = window.location.hash.replace("#", "");
			var target = $("#"+hash);
			var page = Math.floor(hash/20)+1;
			window.location.hash = page;
		
			$("#pagenum").val(page);
			
			for(var i=1; i<=page; i++){
				fn_selectBoardList(i);
			}
		
			location.hash = "#page"+page;
		//�ƴϸ� ù ������ �ҷ�����
		}else{
			selectdaylist(1);
		}
//	}else{
//		$("html, body").css("height", "100%");
//		$("#wellcome").css("display", "block");
//	}
	
});	

function openDayDetail(dnum,num){
	
	window.location.hash="#"+num;
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/td/openDayDetail.do' />");
    comSubmit.addParam("dnum", dnum);
    var pageno = ($("#page_index").val());
    comSubmit.addParam("index", pageno)
    comSubmit.submit();
}

function openWriteDay(dvol){
	var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/td/openWriteDay.do' />");
    comSubmit.addParam("dvol", dvol);
    comSubmit.submit();
}

function openModifyDiary(dvol){
	var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/td/openModifyDiary.do' />");
    comSubmit.addParam("dvol", dvol);
    comSubmit.submit();
}

</script>

<script type="text/javascript">


//��� �߰� ajax
function selectdaylist(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/td/diarydaylist.do?mnum=${mnum}&dvol=${dvol}' />");
    comAjax.setCallback("Callback");
    comAjax.addParam("pagenum",pageNo);
    comAjax.addParam("page_row",20);
    comAjax.ajax();
}
 
function Callback(data){
//	var id = data.userInfo.member_id;
    var total = data.total;
    var totalpnum = Math.ceil(total/20);
    var addpoint = $("table>tbody");
    var last = $("#addlist");
   
	//�� ������ ���� ����
	$("#totalpnum").val(totalpnum);
	  
	//�ش� �ϱ���� ȸ�� ������ ��ġ�ϸ� ����, ����, �ϱ⾲�� �� ��ư ǥ��
	$(".btn-wrap").css("display", "block");
	  
	//���α׷����ٷ� �� �Ѱ��ֱ�
	$('.meter > p ').html("�����ϱ�"+data.progress+"%");
	$('.meter > span').css("width", data.progress+"%");

    if(total == 0){
        var str = "<td colspan='5' style='text-align:center;'>�ۼ��� �ϱⰡ �����ϴ�.</td>";
        addpoint.append(str);
    }
    else{
    	var path = "${pageContext.request.contextPath}/upload/";
    	callbackDiarydays(data, path);
    }
}

/*
function getDateString(jsonDate){
	var year, month, day, hour, minute, second , returnValue  , date ,replaceStr
	 
    date = new Date(jsonDate);

    year = date.getFullYear();
    month = Pad(date.getMonth());
    day = Pad(date.getDate());
    hour = Pad(date.getHours());
    minute = Pad(date.getMinutes());
    second = Pad(date.getSeconds());

    returnValue = year + "/" + month + "/" + day;
    return returnValue;
}

function Pad(num) {
    num = "0" + num;
    //slice(start, end) start<0�̸� length+start
    return num.slice(-2);
}
*/
</script>
</body>
</html>