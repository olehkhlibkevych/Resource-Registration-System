<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title><tiles:getAsString name="title"/></title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

    <!-- Our own css -->
    <link rel="stylesheet" href="resource/css/system.css">

    <!-- DataTables CSS-->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">

    <!-- JQuery lib-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <!-- DataTables lib -->
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>

    <!-- Our JavaScript-->
    <script src="resource/js/scripts.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="header">
            <tiles:insertAttribute name="header"/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" id="menu">
            <tiles:insertAttribute name="menu"/>
        </div>
    </div>
    <div class="row">
        <div id="body">
            <tiles:insertAttribute name="body"/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" id="footer">
            <tiles:insertAttribute name="footer"/>
        </div>
    </div>

</div>
</body>
</html>