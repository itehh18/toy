<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Travel Diary</title>
</head>
<body>
<%@include file="/WEB-INF/include/include-header.jspf" %>


<!-- start : page - day list -->

	<!-- start : Container -->
	<div id="daylist" class="container color white pagebox ">
	
		<!-- start : navigation -->
		<%@include file="navBar.html" %>
		<!-- end : navigation -->
	
		<!-- start : Wrapper -->
		<div class="wrapper span12">
	
		<!-- start: Page Title -->
		<div id="page-title">

			<div id="page-title-inner">

				<h2><span>Days</span></h2>

			</div>	

		</div>
		<!-- end: Page Title -->
		
		<center>
		I'm a ${identify}
		<input type="hidden" id="identify" name="identify" value="${identify}"><br>
		</center>
		
		<!-- Start Day table -->
		<div class="table-wrap" id="fixNextTag">
			<table class="table table-striped table-hover " id="day_table">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>TITLE</th>
						<th>WITTER</th>
						<th>DATE</th>
						<th>TIME</th>
						<th>HITS</th>
					</tr>
				</thead>
				<tbody id="addlist">

				</tbody>
			</table>
		</div>



		<div id="pagenav"></div>
		<input type="hidden" id="pagenum" name="pagenum" value="1"/>
		<input type="hidden" id="totalpnum" name="totalpnum" >
		
			</div>
		<!-- end : Wrapper -->
		
	</div>
	<!-- end : Container -->
<center><div id="lastPostsLoader" style="margin-bottom: 6%"></div></center>
<%@include file="/WEB-INF/include/include-bottom.jspf" %>

<script type="text/javascript">
    
$(document).ready(function(){
	
	 
	//스크롤 감지
    $(window).scroll(function(){  
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){  
           lastPostFunc();
        }  
    });
	
	//로딩중 띄우기
    function lastPostFunc()  
    {  
		var totalpnum = $("#totalpnum").val();
		var pnum = $("#pagenum").val();
		
		if(pnum < totalpnum){
	        $("#lastPostsLoader").html("로딩중...");  
	        addList();
		} else {
			 $("#lastPostsLoader").html("없음");
		}
        
    };  

    //목록 추가
    function addList(){
    	var pageno = ($("#pagenum").val());
    	pageno++;
    	_movePage(pageno);

    };

	//로그인된 상태라면
		//해시값이 있으면 페이지 이동
		if(document.location.hash){
			var hash = window.location.hash.replace("#", "");
			var target = $("#"+hash);
			var page = Math.floor(hash/20)+1;
			window.location.hash = page;
		
			$("#pagenum").val(page);
			
			for(var i=1; i<=page; i++){
				selectDayList(i);
			}
		
			location.hash = "#page"+page;
		//아니면 첫 페이지 불러오기
		}else{
			selectDayList(1);
		}
	
});	
</script>

<script type="text/javascript">

function openDayDetail(dnum,num){
	
	window.location.hash="#"+num;
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/td/openDayDetail.do' />");
    comSubmit.addParam("dnum", dnum);
    var pageno = ($("#page_index").val());
    comSubmit.addParam("index", pageno)
    comSubmit.submit();
}

//목록 추가 ajax
function selectDayList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/td/daylist.do' />");
    comAjax.setCallback("Callback");
    comAjax.addParam("pagenum",pageNo);
    comAjax.ajax();
}
 
function Callback(data){
    var total = data.total;
    var totalpnum = Math.ceil(total/20);
    var addpoint = $("table>tbody");
    var last = $("#addlist");
   //	body.empty();
   
   //총 페이지 갯수 저장
   $("#totalpnum").val(totalpnum);
  
    if(total == 0){
        var str = "<td colspan='4'>작성된 일기가 없습니다.</td>";
        body.append(str);
    }
    else{
    	callbackDayList(data);
    }
}
</script>
</body>
</html>