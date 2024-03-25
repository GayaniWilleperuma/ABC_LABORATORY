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
    <title>Test page</title>
    <%@include file="../component/allcss.jsp"%>

</head>
<body>
<%@include file="navbar.jsp"%>


<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-5 offset-4">
            <div class="card my-card">
                <div class="card-body">
                    <p class="fs-3 text-center text-danger">Add Test</p>

                    <!-- message print -->
                    <!-- for success msg -->
                    <c:if test="${not empty successMsg }">
                        <p class="text-center text-success fs-3">${successMsg}</p>
                        <c:remove var="successMsg" scope="session" />
                    </c:if>

                    <!-- for error msg -->
                    <c:if test="${not empty errorMsg }">
                        <p class="text-center text-danger fs-3">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    <!-- End of message print -->

                    <!-- boostrap form -->
                    <form action="../addTest" method="post">
                        <div class="mb-3">
                            <label class="form-label">Test Name</label> <input
                                name="testName" type="text" placeholder="Enter test name"
                                class="form-control">

                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label> <input
                                name="description" type="text"
                                placeholder="Enter description" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Cost</label> <input
                                name="cost" type="text" placeholder="Enter cost"
                                class="form-control">

                        </div>

                        <button type="submit" class="btn btn-danger text-white col-md-12">Add Test</button>
                    </form>
                    <!-- <br>Don't have an account? <a href="#!"
                        class="text-decoration-none">create one</a> -->
                    <!-- end of boostrap form -->

                </div>

            </div>
        </div>

    </div>
</div>
