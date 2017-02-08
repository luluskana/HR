<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<spring:url value="/" var="home" />
<%@page session="true"%>
<div class="container">
    <div class="row">
        <div class="col-sm-12 well" align="center">
            <h4><label>All User</label></h4>
            <div class="table-responsive">
                <table id="appuserList" class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Employee ID</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Telephone</th>
                        <th>Edit</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Employee ID</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Telephone</th>
                        <th>Edit</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="appUser" items="${appUserList}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${appUser.employeeID}</td>
                            <td>${appUser.username}</td>
                            <td>${appUser.password}</td>
                            <td>${appUser.name}</td>
                            <td>${appUser.department}</td>
                            <td>${appUser.phoneNumber}</td>
                            <td><a href="${home}appuser/${appUser.id}?update" class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $.material.init();
        $('#appuserList').DataTable();
    } );
</script>