<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<spring:url value="/" var="home" />
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="${home}" class="navbar-brand">FOAMTEC</a>
        </div>
        <div class="navbar-collapse collapse navbar-inverse-collapse">
            <ul class="nav navbar-nav">
                <c:if test="${not empty userLogin and userLogin.roleName eq 'admin'}">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Manage <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${home}appuser?create">Create User</a></li>
                            <li><a href="${home}appuser?list">List All User</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <c:if test="${not empty userLogin}" >
                            ${userLogin.name}
                        </c:if>
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <c:if test="${not empty login}">
                            <li><a href="${home}login">Login</a></li>
                        </c:if>
                        <c:if test="${not empty userLogin}">
                            <li><a href="${home}appuser/${userLogin.id}?profile">Update Profile</a></li>
                            <li><a href="${home}resources/j_spring_security_logout">Logout</a></li>
                        </c:if>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>