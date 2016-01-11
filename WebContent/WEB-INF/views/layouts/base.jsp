<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}/" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- fav-icon -->
    <link rel="Shortcut Icon" href="${base}resource/img/maple_leaf.ico" type="image/x-icon"/>
    <title><tiles:getAsString name="title"/></title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
    <script src="${base}resource/js/lib/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="${base}resource/js/lib/jquery-validate/jquery.validate.js" type="text/javascript"></script>
    <script src="${base}resource/js/scripts.js"></script>
<div class="container">
   	<div id="header">
   		<tiles:insertAttribute name="header" />
   	</div>
   	<div id="body">
   		<tiles:insertAttribute name="body" />
   	</div>
   	<div id="footer">
   		<tiles:insertAttribute name="footer" />
   	</div>
</div>
</html>