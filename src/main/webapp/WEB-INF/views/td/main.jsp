<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Travel Diary</title>
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">

</head>
<body>
<%@include file="/WEB-INF/include/include-header.jspf" %>


<!-- start : Home-->

		<!-- start : Container -->
		<div class="container pagebox" >
		
			<!-- start : navigation -->
			<%@include file="navBar.html" %>
			<!-- end : navigation -->
			
			<%@include file="main_cam.html" %>
		</div>
		<!-- end : Container -->
<!-- end : Home -->
			
			
<input type="hidden" id="identify" name="identify" value="${identify }">

<%@include file="/WEB-INF/include/include-bottom.jspf" %>
</body>
</html>