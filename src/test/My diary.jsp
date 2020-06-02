<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0047)http://localhost:8080/TravelDiary/td/mydiary.do -->
<html class="csstransforms csstransforms3d csstransitions js no-touch csstransforms3d csstransitions"><head><meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"><script async="" src="./My diary_files/lukaszholeczek.json"></script>

<title>My diary</title>
</head>
<body>

 

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>first</title>
 

 


	<link rel="stylesheet" href="./My diary_files/bootstrap.min.css">
	<link href="./My diary_files/bootstrap.min(1).css" rel="stylesheet">
    <link href="./My diary_files/bootstrap-responsive.min.css" rel="stylesheet">
	<link href="./My diary_files/style.css" rel="stylesheet">
	<link href="./My diary_files/slider1.css" rel="stylesheet">
	<link href="./My diary_files/slider2.css" rel="stylesheet">
	<link href="./My diary_files/slider3.css" rel="stylesheet">
	<link href="./My diary_files/tab.css" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="./My diary_files/css">
	<link rel="stylesheet" type="text/css" href="./My diary_files/css(1)">
	<link rel="stylesheet" type="text/css" href="./My diary_files/css(2)">
	<link rel="stylesheet" type="text/css" href="./My diary_files/css(3)">
	
	<!-- jQuery -->
	<script src="./My diary_files/jquery.min.js.다운로드"></script> 




<!-- start : page - my diary list -->

	<!-- start : Container -->
<div id="diarylist" class="container color yellow pagebox ">
	
		<!-- start : navigation -->
		



<title>Insert title here</title>
    
<!-- start: CSS -->
<style type="text/css">
*{margin:0px; padding:0px;}

html, body{
margin:0;
padding:0;
background-color:#fff;}


.pagebox{
	min-height: 100%; 
	width: 100%; 
	padding-top:50px;
	overflow: visible;
}

#diary-wrapper{
overflow: visible;
}

#day_table th, #day_table td{
	text-align: center;
}
</style>
	<!-- end: CSS -->
	
<script type="text/javascript">
$(document).ready(function(){
	
	if($('#userId').val() == "guest")
	  $('.navbar-right li:eq(0)').hide();
	else{
		$('.navbar-right li:eq(1)').hide();
		$('.navbar-right li:eq(2)').hide();
	}
	});
	
</script>



		
	<!-- start : menu -->
	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container navbox" style="z-index:999; width:100%; background-color: #fff; position:fixed; 
        top:0px; left:0px; padding-left:20px;">
	            <div class="navbar-header ">
	                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span>
						<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
	                </button>
	                <a class="navbar-brand page-scroll" href="http://localhost:8080/TravelDiary">
						TRAVEL DIARY
						<span class="glyphicon glyphicon-plane" aria-hidden="true"></span>
					</a>
	            </div>
	            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="float:left; margin-top:10px">
	                <ul class="nav navbar-nav navbar-left">
	                    <li>
	                        <a class="page-scroll" href="http://localhost:8080/TravelDiary/td/mydiary.do">MY DIARY</a>
	                    </li>
	                    <li>
	                        <a class="page-scroll" href="http://localhost:8080/TravelDiary/td/days.do">DAYS</a>
	                    </li>
	                    <li>
	                        <a class="page-scroll" href="http://localhost:8080/TravelDiary/td/mypage.do">MY PAGE</a>
	                    </li>
	                </ul>
	            </div>
	            
	            <div class="collapse navbar-collapse sUser" style="float:right; margin-top:10px">
	                <ul class="nav navbar-nav navbar-right">
	               		<li>
	                    	<a href="http://localhost:8080/TravelDiary/td/logout.do">LOG OUT</a>
	                    </li>
	                    <li style="display: none;">
	                    	<a href="http://localhost:8080/TravelDiary/td/login.do">LOG IN</a>
	                    </li>
	                    <li style="display: none;">
	                    	<a onclick="/TravelDiary/td/join.do">JOIN</a>
	                    </li>
	                </ul>
	            </div>
	            
        </div>
    </nav>
    <!-- end : menu -->
    
<script type="text/javascript">

function logout(){
	var result = window.confirm('°¡´??');
	
	if(result){
		window.location='Logout.jsp';
	}else{}
}
</script>








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
		
		<center>I'm a member
		<b id="status_id"></b>
		</center>
				<div id="lastPostsLoader">로딩중...</div>
		<!-- start : filter-->
		<center>
		<div id="filters">
			<ul class="option-set" data-option-key="filter">
				<li><a href="http://localhost:8080/TravelDiary/td/mydiary.do#filter" class="selected" data-option-value="*">All</a></li>
				<li>/</li>
				<li><a href="http://localhost:8080/TravelDiary/td/mydiary.do#filter" data-option-value=".internal">국내</a></li>
				<li>/</li>
				<li><a href="http://localhost:8080/TravelDiary/td/mydiary.do#filter" data-option-value=".foreign">해외</a></li>
				<li>/</li>
				<li><a href="http://localhost:8080/TravelDiary/td/mydiary.do#filter" data-option-value=".full">완성</a></li>
			</ul>
		</div>
		</center>
		<!-- end : filter -->
		
		<!-- start : diary list -->
		<div id="diary-wrapper" class="row-fluid isotope" style="position: relative; height: 4410px;">
				<div id="addlist" class="isotope-item" style="position: absolute; left: 0px; top: 0px; transform: translate3d(0px, 0px, 0px);"><div id="page1"><div id="page1"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d1"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=2&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=2">test diary 12</a></h5><p>2017/04/02-2017/04/17<br>vol.2</p></div></div></div></div></div><div id="page1"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d2"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=3&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=3">test diary 13 cover</a></h5><p>2017/04/02-2017/04/16<br>vol.3</p></div></div></div></div><div id="page1"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d3"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=4&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=4">test diary 14 cover</a></h5><p>2017/04/01-2017/04/16<br>vol.4</p></div></div></div></div><div id="page1"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d4"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=5&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=5">test cover</a></h5><p>2017/04/02-2017/04/08<br>vol.5</p></div></div></div></div><div id="page1"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d5"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=6&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=6">test cover</a></h5><p>2017/04/02-2017/04/08<br>vol.6</p></div></div></div></div><div id="page1"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d6"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7">test cover 2</a></h5><p>2017/04/02-2017/04/14<br>vol.7</p></div></div></div></div><div id="page1"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d7"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8">test cover 3</a></h5><p>2017/04/09-2017/04/16<br>vol.8</p></div></div></div></div><div id="page1"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d8"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link" style="opacity: 0; display: block;"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9">test cover 4</a></h5><p>2017/04/02-2017/04/08<br>vol.9</p></div></div></div></div><div id="page1"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d9"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link" style="opacity: 0; display: block;"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10">test cover 5</a></h5><p>2017/04/02-2017/04/08<br>vol.10</p></div></div></div></div><div id="page2"><div id="page2"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d21"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=3&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=3">test diary 13 cover</a></h5><p>2017/04/02-2017/04/16<br>vol.3</p></div></div></div></div></div><div id="page2"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d22"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=4&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=4">test diary 14 cover</a></h5><p>2017/04/01-2017/04/16<br>vol.4</p></div></div></div></div><div id="page2"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d23"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=5&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=5">test cover</a></h5><p>2017/04/02-2017/04/08<br>vol.5</p></div></div></div></div><div id="page2"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d24"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=6&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=6">test cover</a></h5><p>2017/04/02-2017/04/08<br>vol.6</p></div></div></div></div><div id="page2"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d25"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7">test cover 2</a></h5><p>2017/04/02-2017/04/14<br>vol.7</p></div></div></div></div><div id="page2"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d26"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8">test cover 3</a></h5><p>2017/04/09-2017/04/16<br>vol.8</p></div></div></div></div><div id="page2"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d27"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9">test cover 4</a></h5><p>2017/04/02-2017/04/08<br>vol.9</p></div></div></div></div><div id="page2"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d28"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10">test cover 5</a></h5><p>2017/04/02-2017/04/08<br>vol.10</p></div></div></div></div><div id="page2"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d29"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=11&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=11">cover test 6</a></h5><p>2017/04/02-2017/04/16<br>vol.11</p></div></div></div></div><div id="page3"><div id="page3"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d41"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=4&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=4">test diary 14 cover</a></h5><p>2017/04/01-2017/04/16<br>vol.4</p></div></div></div></div></div><div id="page3"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d42"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=5&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=5">test cover</a></h5><p>2017/04/02-2017/04/08<br>vol.5</p></div></div></div></div><div id="page3"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d43"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=6&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=6">test cover</a></h5><p>2017/04/02-2017/04/08<br>vol.6</p></div></div></div></div><div id="page3"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d44"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7">test cover 2</a></h5><p>2017/04/02-2017/04/14<br>vol.7</p></div></div></div></div><div id="page3"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d45"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8">test cover 3</a></h5><p>2017/04/09-2017/04/16<br>vol.8</p></div></div></div></div><div id="page3"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d46"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9">test cover 4</a></h5><p>2017/04/02-2017/04/08<br>vol.9</p></div></div></div></div><div id="page3"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d47"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10">test cover 5</a></h5><p>2017/04/02-2017/04/08<br>vol.10</p></div></div></div></div><div id="page3"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d48"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=11&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=11">cover test 6</a></h5><p>2017/04/02-2017/04/16<br>vol.11</p></div></div></div></div><div id="page3"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d49"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=12&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=12">test cover 7</a></h5><p>2017/04/18-2017/04/24<br>vol.12</p></div></div></div></div><div id="page4"><div id="page4"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d61"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=5&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=5">test cover</a></h5><p>2017/04/02-2017/04/08<br>vol.5</p></div></div></div></div></div><div id="page4"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d62"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=6&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=6">test cover</a></h5><p>2017/04/02-2017/04/08<br>vol.6</p></div></div></div></div><div id="page4"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d63"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7">test cover 2</a></h5><p>2017/04/02-2017/04/14<br>vol.7</p></div></div></div></div><div id="page4"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d64"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8">test cover 3</a></h5><p>2017/04/09-2017/04/16<br>vol.8</p></div></div></div></div><div id="page4"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d65"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9">test cover 4</a></h5><p>2017/04/02-2017/04/08<br>vol.9</p></div></div></div></div><div id="page4"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d66"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10">test cover 5</a></h5><p>2017/04/02-2017/04/08<br>vol.10</p></div></div></div></div><div id="page4"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d67"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=11&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=11">cover test 6</a></h5><p>2017/04/02-2017/04/16<br>vol.11</p></div></div></div></div><div id="page4"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d68"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=12&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=12">test cover 7</a></h5><p>2017/04/18-2017/04/24<br>vol.12</p></div></div></div></div><div id="page4"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d69"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=13&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=13">test cover 7</a></h5><p>2017/04/02-2017/04/10<br>vol.13</p></div></div></div></div><div id="page5"><div id="page5"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d81"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=6&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=6">test cover</a></h5><p>2017/04/02-2017/04/08<br>vol.6</p></div></div></div></div></div><div id="page5"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d82"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7">test cover 2</a></h5><p>2017/04/02-2017/04/14<br>vol.7</p></div></div></div></div><div id="page5"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d83"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8">test cover 3</a></h5><p>2017/04/09-2017/04/16<br>vol.8</p></div></div></div></div><div id="page5"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d84"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9">test cover 4</a></h5><p>2017/04/02-2017/04/08<br>vol.9</p></div></div></div></div><div id="page5"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d85"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10">test cover 5</a></h5><p>2017/04/02-2017/04/08<br>vol.10</p></div></div></div></div><div id="page5"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d86"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=11&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=11">cover test 6</a></h5><p>2017/04/02-2017/04/16<br>vol.11</p></div></div></div></div><div id="page5"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d87"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=12&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=12">test cover 7</a></h5><p>2017/04/18-2017/04/24<br>vol.12</p></div></div></div></div><div id="page5"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d88"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=13&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=13">test cover 7</a></h5><p>2017/04/02-2017/04/10<br>vol.13</p></div></div></div></div><div id="page5"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d89"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=14&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=14">test cover 8</a></h5><p>2017/04/02-2017/04/10<br>vol.14</p></div></div></div></div><div id="page6"><div id="page6"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d101"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=7">test cover 2</a></h5><p>2017/04/02-2017/04/14<br>vol.7</p></div></div></div></div></div><div id="page6"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d102"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=8">test cover 3</a></h5><p>2017/04/09-2017/04/16<br>vol.8</p></div></div></div></div><div id="page6"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d103"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=9">test cover 4</a></h5><p>2017/04/02-2017/04/08<br>vol.9</p></div></div></div></div><div id="page6"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d104"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=10">test cover 5</a></h5><p>2017/04/02-2017/04/08<br>vol.10</p></div></div></div></div><div id="page6"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d105"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=11&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=11">cover test 6</a></h5><p>2017/04/02-2017/04/16<br>vol.11</p></div></div></div></div><div id="page6"><div id="diary" class="span4 diary-item html5 css3 responsive internal"><div class="picture" id="d106"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=12&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=12">test cover 7</a></h5><p>2017/04/18-2017/04/24<br>vol.12</p></div></div></div></div><div id="page6"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d107"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=13&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=13">test cover 7</a></h5><p>2017/04/02-2017/04/10<br>vol.13</p></div></div></div></div><div id="page6"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d108"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=14&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=14">test cover 8</a></h5><p>2017/04/02-2017/04/10<br>vol.14</p></div></div></div></div><div id="page6"><div id="diary" class="span4 diary-item html5 css3 responsive foreign"><div class="picture" id="d109"><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=15&amp;mnum=5" title="Title"><img src="./My diary_files/default.jpg" alt="" class="dcover"><div class="image-overlay-link"></div></a><div class="item-description alt"><h5><a href="http://localhost:8080/TravelDiary/td/diarydays.jsp?dvol=15">test cover 11</a></h5><p>2017/04/02-2017/04/15<br>vol.15</p></div></div></div></div></div>
		</div>
		<!-- end : diary list -->
		
		

		<div id="pagenav"></div>
		<input type="hidden" id="pagenum" name="pagenum" value="6">
		
			</div>
		<!-- end : Wrapper -->
		
			</div>
	<!-- end : Container -->


 

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>first</title>
 
<script type="text/javascript" src="./My diary_files/isotope.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/jquery.imagesloaded.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/bootstrap.min.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/flexslider.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/carousel.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/fancybox.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/modernizr.custom.79639.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/jquery.ba-cond.min.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/jquery.slitslider.js.다운로드"></script>

<script type="text/javascript" src="./My diary_files/excanvas.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/jquery.flot.min.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/jquery.flot.pie.min.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/jquery.flot.stack.js.다운로드"></script>
<script type="text/javascript" src="./My diary_files/jquery.flot.resize.min.js.다운로드"></script>
<script defer="defer" src="./My diary_files/custom.js.다운로드"></script>
<script defer="defer" src="./My diary_files/common2.js.다운로드"></script>


<script type="text/javascript">
    
$(document).ready(function(){
	
	
	 $('.row-fluid').css("overflow", "visible");
	 $('.isotope').css("overflow", "visible");
	 
	//스크롤 감지
    $(window).scroll(function(){  
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){  
           lastPostFunc();
        }  
    });
	
	//로딩중 띄우기
    function lastPostFunc()  
    {  
        $("#lastPostsLoader").html("로딩중...");  
        addList();
        
    };  

    //목록 추가
    function addList(){
    	var pageno = ($("#pagenum").val());
    	pageno++;
    	_movePage(pageno);

    };


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
		fn_selectBoardList(1);
	}
	
});	
</script>

<script type="text/javascript">


//목록 추가 ajax
function fn_selectBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("/TravelDiary/td/mydiaryList.do");
    comAjax.setCallback("Callback");
    comAjax.addParam("pagenum",pageNo);
    comAjax.addParam("page_row",9);
    comAjax.ajax();
	window.alert("추가");
}
 
function Callback(data){
	var id = data.userInfo.member_id;
    var total = data.total;
    var addpoint = $("#addlist");
    var last = $("#addlist");
   //	body.empty();
    if(total == 0){
        var str = "<center>작성된 다이어리가 없습니다.</center>";
        body.append(str);
    }
    else{
        var params = {
            divId : "pagenav",
            pageIndex : "pagenum",
            totalCount : total,
            eventName : "fn_selectBoardList"
        };
        gfn_renderPaging(params);
         
        //값을 가져와서 뿌려주는 부분
        var str = "";
        var pageNo = $("#pagenum").val();
        var i=1;
        var num = pageNo*20-20 ;
        var pro = 0;
    	var basicClass = "span4 diary-item html5 css3 responsive ";
    	var className = null;
        
        
        $.each(data.diaryList, function(key, value){
        	if(num < 0)
        		num = 0;
        	var start = getDateString(value.start_day);
        	var end = getDateString(value.end_day);
        	
        	$.each(data.progress, function(key, prog){
        		if(prog.diary_volum == value.diary_volum)
        			pro = prog.percent;
        		
        	});
        	
        	
        	if(pro == 100)
        		basicClass = basicClass+"full ";
        	
        	//지역에 따라 클래스 이름 추가
    		if((value.location_code).indexOf('i')>-1){
    			className = basicClass+"internal";
    		} else if((value.location_code).indexOf("o")>-1){
    			className = basicClass+"foreign";
    		}
        	
        //	var dtm = GetDateString(value.CREA_DTM);
            str += "<div id='page"+pageNo+"'>"+
            		"<div id='diary' class='"+className+"'>"+
            		"<div class='picture' id='d"+ (num + i)+"'>"+
            			"<a href='diarydays.jsp?dvol="+value.diary_volum+"&mnum="+value.member_num+"' title='Title'>"+
                        "<img src='/TravelDiary/upload/"+ value.diary_cover +"' alt='' class='dcover'/>" + 
                        "<div class='image-overlay-link'></div></a>"+
                        	"<div class='item-description alt'>" +
	                        	"<h5><a href='diarydays.jsp?dvol="+value.diary_volum+"'>"+value.diary_title +"</a></h5>"+
	                        	"<p>"+start+"-"+end+"<br>"+
	                        	"vol."+value.diary_volum+"</p>"+
                        	"</div>" +
                        "</div>"+
                    "</div>"+
                    "</div>"+
                    "</div>";
                    i++;
        });
        var anchor = "<div id='page"+pageNo+"'>";
        addpoint.append(anchor+str+"</div>");
      //  addpoint.append(str);
      //  addpoint.append("</div>");
        
        //db limit걸기, 날짜표시 수정, num > id 변경 출력
    }
}

//날짜 형식 변환
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
    //slice(start, end) start<0이면 length+start
    return num.slice(-2);
}

</script>


<form id="commonForm" name="commonForm"></form><form id="commonForm" name="commonForm"></form><form id="commonForm" name="commonForm"></form><form id="commonForm" name="commonForm"></form><form id="commonForm" name="commonForm"></form><form id="commonForm" name="commonForm"></form></body></html>