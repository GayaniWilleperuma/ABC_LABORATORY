<%@page import="com.abc.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0 ">

<title>Home Page | ABC LAB</title>
<%@include file="component/allcss.jsp"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

<div class="hero-image">
<img src="img/doctor_2.jpg" class="d-block w-100" alt="..."
					height="580px">
  <div class="hero-text">
    
  </div>
</div>
<p class="text-center mt-2 mb-5 fs-2 myP-color">Welcome to
			ABC Laboratory</p>

	<!-- footer -->
	<%@include file="component/footer.jsp"%>
	<!-- end footer -->
</body>
</html>