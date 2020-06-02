<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>My diary</title>
</head>
<body>
<%@include file="/WEB-INF/include/include-header.jspf" %>


<!-- start : page - my diary list -->

	<!-- start : Container -->
	<div id="diarylist" class="container color white pagebox ">
	
		<!-- start : navigation -->
		<%@include file="navBar.html" %>
		<!-- end : navigation -->
	
		<!-- start : Wrapper -->
		<div class="wrapper span12">
	
		<!-- start: Page Title -->
		<div id="page-title">

			<div id="page-title-inner">

				<h2><span>My Diary</span></h2>

			</div>	

		</div>
		<!-- end: Page Title -->
		
		<center>
		I'm a ${identify}
		<input type="hidden" id="identify" name="identify" value="${identify}"><br>
		<button class="button btn-warning" onclick="window.location='/TravelDiary/td/writeDiary.do'">
		<span>새 일기장 만들기:)</span></button>
		
		<div id="wellcome" style="display:none;">
		Travel Diary에서 새로운 여행 일기를 남겨봐 :D<br><br>
		<button class="button btn-warning" onclick="window.location='/TravelDiary/td/diarylist.do'">
		<span>여행일기 맛보기:)</span></button>
		<button class="button btn-warning" onclick="window.location=''">
		<span>Join</span></button>
		<button class="button btn-warning" onclick="window.location='/TravelDiary/td/login.do'">
		<span>Login</span></button>
		</div>
		</center>
				
		<!-- start : filter-->
		
		<div id="filters" class="filter-button" style="display:none;">
		<center>
			<button class="btncol button is-checked " data-filter="*">all</button>
			/<button class="button btncol" data-filter=".full">완성</button>
			/<button class="button btncol" data-filter=".foreign">해외</button>
			/<button class="button btncol" data-filter=".internal">국내</button>
		</center>
		</div>
		<!-- end : filter -->
		
		<!-- start : diary list -->
		<div id="diary-wrapper" class="row-fluid" style="height: 4410px;">
		</div>
		<!-- end : diary list -->
		
		

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

	/*
	//해쉬값이 존재하면 그만클 불러오고 포커스 주기, 없으면 첫 페이지 불러오기
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
	
	//로그인된 상태라면
	if($("#identify").val() == "member"){
		$("#filters").css("display", "block");		
		//해시값이 있으면 페이지 이동
		if(document.location.hash){
			var hash = window.location.hash.replace("#", "");
			var target = $("#"+hash);
			var page = Math.floor(hash/20)+1;
			window.location.hash = page;
		
			$("#pagenum").val(page);
			
			for(var i=1; i<=page; i++){
				selectMydiaryList(i);
			}
		
			location.hash = "#page"+page;
		//아니면 첫 페이지 불러오기
		}else{
			selectMydiaryList(1);
		}
	}else{
		$("html, body").css("height", "100%");
		$("#wellcome").css("display", "block");
	}
	
});	
</script>

<script type="text/javascript">


//목록 추가 ajax
function selectMydiaryList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/td/mydiaryList.do' />");
    comAjax.setCallback("Callback");
    comAjax.addParam("pagenum",pageNo);
    comAjax.ajax();
}
 
function Callback(data){
	var id = data.userInfo.member_id;
    var total = data.total;
    var totalpnum = Math.ceil(total/9);
    var addpoint = $("#diary-wrapper");
    var last = $("#addlist");
   //	body.empty();
   
   //총 페이지 갯수 저장
   $("#totalpnum").val(totalpnum);
  
    if(total == 0){
        var str = "<center>작성된 다이어리가 없습니다.</center>";
        body.append(str);
    }
    else{
    	var path = "${pageContext.request.contextPath}/upload/";
    	callbackMydiary(data, path);
    }
    	
}
</script>

</body>
</html>