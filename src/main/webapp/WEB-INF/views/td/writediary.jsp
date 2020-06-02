<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Travel Diary</title>
</head>
<body>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!-- start : page - diary list -->
<div id="writediary" class="container color yellow ppagebox">
	
		<!-- start : navigation -->
		<%@include file="navBar.html" %>
		<!-- end : navigation -->
	
		<!-- start : Wrapper -->
		<div class="wrapper span12">
	
		<!-- start: Page Title -->
		<div id="page-title">

			<div id="page-title-inner">

				<h2><span>New Diary</span></h2>

			</div>	

		</div>

<!-- start : Page - new diary -->

	<div class="container write-wrap">
	<form action="/TravelDiary/td/writeDiary.do" name="writeDiary" method="post"  onsubmit="return checkF();" autocomplete="off">
	
	<input type="hidden" id="mnum" name="member_num" value="${userInfo.member_num }">
	
	<table class="write" style="width: 100%;">
		<tr>
			<th>Title</th>
			<td><input class="d-title" type="text" name="diary_title" ><br></td>
		</tr>	
		<tr>	
			<th>Location</th>
			<td>
	<select class="selloc" name="location" onchange="checksel(this.value)">
		<option value=0>����</option>
		<option value=1>����</option>
		<option value=2>�ؿ�</option>
	</select>
			
	<select class="selloca" id="location_in" name="location_code" style="display:none" onchange="showect(this.value)" >
		<option value=0>����</option>
		<option value=i1>����</option>
		<option value=i2>��õ/���</option>
		<option value=i3>�λ�</option>
		<option value=i4>����</option>
		<option value=i5>����</option>
		<option value=i6>���</option>
		<option value=i7>����/��û</option>
		<option value=iect>��Ÿ</option>
	</select>
	
	
	<select class="selloca" id="location_over" name="location_code" style="display:none;" onchange="showect(this.value)">
		<option value=0>����</option>
		<option value=o1>�Ϻ�</option>
		<option value=o2>�߱�</option>
		<option value=o3>������</option>
		<option value=o4>����</option>
		<option value=o5>�����</option>
		<option value=o6>����</option>
		<option value=oect>��Ÿ</option>
	</select>
	

		
	<input type="text" id="ectloc_in" name="loc_detail" value="in��Ҹ� �Է����ּ���" style="display:none;" onclick="this.value=''">
	<input type="text" id="ectloc_over" name="loc_detail" value="over��Ҹ� �Է����ּ���" style="display:none;" onclick="this.value=''">
	<br>
				</td>
		</tr>
		<tr>
			<th>Duration</th>
			<td>
			<input class="daypick" type="text" id="start_day" readOnly name="start_day" value="����" onclick="javascript:pickdate(this)" >
			<input class="daypick" type="text" id="end_day" readOnly name="end_day" value="��" >
			</td>
		</tr>
		<tr>
			<th>Cover</th>
			<td><input type="file" name="diary_cover"></td>
		</tr>
		<tr>
			<th>PRIVACY</th>
			<td>
				<input type="radio" id="privacy_0" name="p_code" value="0" />
				<label for="privacy_0">Anyone</label>
				<input type="radio" id="privacy_1" name="p_code" value="1"/>
				<label for="privacy_1">Member</label>
				<input type="radio" id="privacy_2" name="p_code" value="2"/>
				<label for="privacy_2">Owner</label>
			</td>
		</tr>
	</table>
	
	<br>
	<center>
	<button class="button btn-warning" onclick="javascript:checkform();">
	<span>New!</span></button>
	</center>
	
	</form>
	</div>
		</div>
		<!-- end : Wrapper -->
		
	</div>
	<!-- end : Container -->
	
<!-- end : page - diary list -->

<script type="text/javascript">
function checksel(val){
	var form = document.writeDiary;
	
	document.getElementById("ectloc_over").style.display="none";
	document.getElementById("ectloc_in").style.display="none";
	
	if(val == 1){
		form.location_over.style.display="none";
		form.location_in.style.display=""; 
	} else if(val == 2){
		form.location_in.style.display="none";
		form.location_over.style.display="";
	}
}

function showect(val){
	var form = document.writeDiary;
	
	if(val=='oect'){
		document.getElementById("ectloc_over").style.display="";
		document.getElementById("ectloc_in").style.display="none";
	} else if(val=='iect'){
		document.getElementById("ectloc_in").style.display="";
		document.getElementById("ectloc_over").style.display="none";
	} else {
		document.getElementById("ectloc_over").style.display="none";
		document.getElementById("ectloc_in").style.display="none";
	}
}

function checkform(){
	var form = document.writeDiary;
	
	if(form.diaryTitle.value == ""){
		window.alert("������ �Է����ּ���");
	} else
		form.submit();
}

$(function() {
	

	    $( "#start_day" ).datepicker({
	    	dateFormat: 'dd/mm/yy',
	    	onClose: function( selectedDate ) {    
               $("#end_day").datepicker( "option", "minDate", selectedDate );
	    	}
	    });
	
	    $( "#end_day" ).datepicker({
	    	dateFormat: 'dd/mm/yy',
	    	onClose: function( selectedDate ) {    
               $("#start_day").datepicker( "option", "maxDate", selectedDate );
	    	}
	    });
	
});

function pickdate(obj){
	$(obj).datepicker().datepicker("show");
}

</script>
</body>
</html>