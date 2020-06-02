<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>New day</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 

</head>
<body>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!-- start : page - write day -->

	<!-- start : Container -->
	<div id="diarylist" class="container color white ppagebox">

	
		<!-- start : navigation -->
		<%@include file="navBar.html" %>	
		<!-- end : navigation -->
	
		<!-- start : Wrapper -->
		<div class="wrapper span12">
	
		<!-- start: Page Title -->
		<div id="page-title">

			<div id="page-title-inner">

				<h2><span>New Day</span></h2>

			</div>	

		</div>
<div class="container write-wrap" style="border:none;">

<form action="/TravelDiary/td/writeDay.do" id="writeday" name="writeday" method = "post" onsubmit="return checkF();" autocomplete="off">
	
	<input type="hidden" id="mnum" name="member_num" value="${userInfo.member_num }">
	
	<table class="write" style="width:100%;">
	<tr>
		<th>Diary</th>
			<td>
				<input id="dvol" type="hidden" value=${dvol }>
				<input id="ndvol" type="hidden">
					<!-- 일기장 목록 넣기 -->		
					
                		<select id="seldiary" name="diary_volum" onchange="javascript:setday();" style="width:90%;">
						<option value=0>선택</option>
	                    	<c:forEach var="value" items="${diaryList}">
                        <option value="${value.diary_volum }">${value.diary_title }</option>
	                    	</c:forEach>
	                    </select>
			</td>
			<td colspan="2" style="margin-left: 5%">
				<c:forEach var="value" items="${diaryList }">
					<c:if test="${dvol == value.diary_volum }">
						<input id="pcode" type="hidden" value="${value.p_code }">
						<input id="start_day" type="hidden" value="${value.start_day }">
						<input id="end_day" type="hidden" value="${value.end_day }">
					</c:if>
				</c:forEach>
				<input type="text" value="날짜" name="day_time" id="day_time" 
				style="width:30%; height:100%; text-align: center" onClick="pickdate(this)"><br>
				
			</td>
	</tr>
	<tr>
		<th>Title</th>
		<td colspan="3">
			<input type="text" name="day_title" id="title" style="width:100%; size: 20">
		</td>
	</tr>
	<tr>
		<th>Privacy</th>
			<td>
			<label for="privacy_0">
			<input type="radio" id="privacy_0" name="p_code" value="0" checked="checked">
			Anyone</label>
			</td>
			<td>
			<label for="privacy_1">
			<input type="radio" id="privacy_1" name="p_code" value="1">
			Member</label>
			</td>
			<td>
			<label for="privacy_2">
			<input type="radio" id="privacy_2" name="p_code" value="2">
			Owner</label>
			</td>
	</tr>
	<tr>
		<th>Text</th>
		<td colspan="3">
		<textarea rows="" cols="" name="day" id="day" style="width:100%;height:300px;"></textarea></td>
	</tr>
</table>

<center><button class="button btn-warning">NEW</button></center>

</form>
</div>


		</div>
		<!-- end : Wrapper -->
		
	</div>
	<!-- end : Container -->
	
<!-- end : page - write day -->

<script type="text/javascript">


//페이지가 로드되면 dvol 날짜관련
$(document).ready(function(){
	
	//get방식으로 받아온 dvol을 input dvol에 저장했으니 불러와서 select 초기화, setday 
	var dvol = $("#dvol").val();
	
    $("#seldiary").val(dvol).prop("selected", true);
    
    $("#day_time").datepicker({
    	dateFormat: 'yy/mm/dd',
    	//input sday에 저장된 값으로 최소 ,최대 날짜 지정
    	minDate : mindate(),
    	maxDate : maxdate()
    });

	function mindate(){
		var sday = document.getElementById("start_day").value;
		return sday;
	}
	
	function maxdate(){
		var eday = document.getElementById("end_day").value;
		return eday;
	}
	
	//set pcode
    var p_diary = document.getElementById("pcode").value;

	//뭘어쩌라는거지
   // $("input:radio[name='privacy']:radio[value=+p_diary+]").attr("checked", true);
	//초기화
	if(p_diary == 0){
		$("input:radio[name='p_code']:radio[value=0]").attr("checked", true);
	} else if(p_diary == 1){
		$("input:radio[name='p_code']:radio[value=1]").attr("checked", true);
	} else if(p_diary == 2){
		$("input:radio[name='p_code']:radio[value=2]").attr("checked", true);
	}
	
	//radio change
	$("input:radio[name='p_code']").click(function(){
		var rval = $(this).val();
		
		//2: 멤버, 게스트에게 아예표시하지 않음
		//1: 게스트에게 일기장은 제목만 표시(잠금표시), 일기목록은 표시하지않음, 일기는 제목만 표시(잠금표시)
		
		//일기장이 보안단계가 더 낮으면 (개인 - 멤버, 전체 : 허용안함),(멤버 - 전체 : )
		if(p_diary=="2" && (rval=="1"||rval=="0")){
			window.alert("일기장은 숨겨놓고 왜 보여조 앙대");
			$("input:radio[name='p_code']:radio[value=2]").attr("checked", true);
		} else if(p_diary==1 && rval=="0"){
			window.alert("일기장은 멤버공개야");
		}
	});
	
    
});

</script>
<script type="text/javascript">

function pickdate(obj){
	
	$(obj).datepicker().datepicker("show");

}
	
function checkF(){
	var title = document.getElementById("title").value;
	var day = document.getElementById("end_day").value;
	var date = document.getElementById("day_time").value;
	
	if(title == ""){
		window.alert('제목을 입력해주세요');
		return false;
	} else if(day == ""){
		window.alert('내용을 입력해주세요');
		return false;
	} else if(date == "날짜"){
		window.alert('날짜를 선택해주세요');
		return false;
	}else
		return true;
		
}


//바꾸기
function setday() {

	//select된 dvol 찾아와서 day구간 재설정
	var dvol = $("diary_volum").val();
	var ndvol = $("#seldiary option:selected").val();
	
	var re = window.confirm("입력한 내용이 지워질거야 그래도 바꿀꼬야?");
	
	//다이어리 정보 바꾸기
	if(re==true){
		if(dvol != ndvol){
			window.location = "writeDay.jsp?dvol="+ndvol;
		}
	}
}
</script>
</body>
</html>