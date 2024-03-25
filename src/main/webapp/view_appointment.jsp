<%@page import="com.abc.entity.Technician"%>
<%@page import="com.abc.dao.TechDAO"%>
<%@page import="com.abc.entity.User"%>
<%@page import="com.abc.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.abc.db.DBConnection"%>
<%@page import="com.abc.dao.AppointmentDAO"%>
<%@ page import="com.abc.dao.TechDAO" %>
<%@ page import="com.abc.dao.TestDAO" %>
<%@ page import="com.abc.entity.Test" %>
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
<!-- for responsive -->
<!-- <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- for responsive -->
<title>View Appointment Page</title>

<!-- all css include -->
<%@include file="component/allcss.jsp"%>

<!-- customs css for this page -->
<style type="text/css">

.my-bg-img {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital1.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

/* backgournd image css */
</style>
<!-- end of customs css for this page -->


</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<!-- if not login then log in first -->
	<c:if test="${empty userObj }">

		<c:redirect url="/user_login.jsp"></c:redirect>

	</c:if>

	<!-- start 1st Div -->

	<div class="container-fluid my-bg-img p-5">
		<!-- css background image -->
		<p class="text-center fs-2 text-white"></p>

	</div>

	<!-- end of 1st Div -->

	<!-- 2nd Div -->

	<div class="container-fluid p-3">
		<p class="fs-2"></p>

		<div class="row">



			<!-- col-2 -->
			<div class="col-md-9">
				<div class="card my-card">
					<div class="card-body">
						<p class="fw-bold text-center myP-color fs-4">Appointment
							List</p>

						<%-- <!-- message print -->
						<!-- for success msg -->
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-5">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- for error msg -->
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message print --> --%>

						<table class="table table-striped">
							<thead>
								<tr class="my-bg-color text-white">
									<!-- <th scope="col">Id</th> -->
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Appointment Date</th>
									<!-- <th scope="col">Email</th> -->
									<th scope="col">Phone</th>
									<th scope="col">Test Name</th>
									<th scope="col">Technician Name</th>
									<!-- <th scope="col">Address</th> -->
									<!-- <th scope="col">User Id</th> -->
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								TechDAO dDAO = new TechDAO(DBConnection.getConn());

								AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());

								TestDAO testDAO = new TestDAO(DBConnection.getConn());

								List<Appointment> list = appDAO.getAllAppointmentByLoginUser(user.getId());
								for (Appointment apptList : list) {
									Technician technician = dDAO.getTechById(apptList.getTechnicianId());
									Test test = testDAO.getTestById(apptList.getTestId());
								%>


								<tr>
									<%-- <th scope="row"><%= apptList.getId() %></th> --%>
									<td><%=apptList.getFullName()%></td>
									<td><%=apptList.getGender()%></td>
									<td><%=apptList.getDoctorName()%></td>
									<td><%=apptList.getAppointmentDate()%></td>
									<%-- <td><%= apptList.getEmail()%></td> --%>
									<td><%=apptList.getPhone()%></td>
										<td><%= test.getTestName()%></td>
									<td><%=technician.getFullName()%></td>
									<%-- <td><%= apptList.getAddress()%></td> --%>
									<%-- <td><%= apptList.getUserId()%></td> --%>
									<td>
										<%
										if ("Pending".equals(apptList.getStatus())) {
										%> <a href="" class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %> <a class="btn btn-sm btn-primary"
	   href="view_result.jsp?id=<%=apptList.getId()%>">View Result</a> <%
 }
 %>
									</td>


								</tr>


								<%
								}
								%>


							</tbody>
						</table>




					</div>
				</div>

			</div>

			<!-- col-1 -->
			<div class="col-md-3 p-3">
				<!-- for Background image -->
				<!-- <img alt="" src="img/picDoc.jpg" width="500px" height="400px"> -->
				<img alt="" src="img/wdoc.jpg" width="250" height="">
			</div>



		</div>


	</div>

	<!-- 2nd Div -->




</body>
</html>