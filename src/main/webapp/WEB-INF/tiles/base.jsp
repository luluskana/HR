<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>HR</title>
    <spring:url value="/resources/bootstrap/dist/css/bootstrap.min.css" var="bootstrapCss" />
    <spring:url value="/resources/bootstrap-material-design/dist/css/bootstrap-material-design.min.css" var="bootstrapMaterialCss" />
    <spring:url value="/resources/bootstrap-material-design/dist/css/ripples.min.css" var="bootstrapMaterialRipplesCss" />
    <spring:url value="/resources/font-awesome/css/font-awesome.css" var="fontAwesomeCss" />
    <spring:url value="/resources/dataTables/jquery.dataTables.min.css" var="dataTablesCss" />
    <spring:url value="/resources/custom/styles.css" var="stylesCss" />
    <link href="${bootstrapCss}" rel="stylesheet" />
    <link href="${bootstrapMaterialCss}" rel="stylesheet" />
    <link href="${bootstrapMaterialRipplesCss}" rel="stylesheet" />
    <link href="${fontAwesomeCss}" rel="stylesheet" />
    <link href="${dataTablesCss}" rel="stylesheet" />
    <link href="${stylesCss}" rel="stylesheet" />
    <spring:url value="/resources/jquery/dist/jquery.min.js" var="jqueryJs" />
    <spring:url value="/resources/bootstrap/dist/js/bootstrap.min.js" var="bootstrapJs" />
    <spring:url value="/resources/bootstrap-material-design/dist/js/ripples.min.js" var="ripplesJs" />
    <spring:url value="/resources/bootstrap-material-design/dist/js/material.min.js" var="materialJs" />
    <spring:url value="/resources/dataTables/jquery.dataTables.min.js" var="dataTablesJs" />
    <script src="${jqueryJs}"></script>
    <script src="${bootstrapJs}"></script>
    <script src="${ripplesJs}"></script>
    <script src="${materialJs}"></script>
    <script src="${dataTablesJs}"></script>
</head>
<body>
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>
</body>
</html>