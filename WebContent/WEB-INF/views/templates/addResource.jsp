<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base"
    value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}/" />

<div class="container">
    <h2>
        <spring:message code="label.resource.add" />
    </h2>
    <form:form method="POST" action="addresource"
        modelAttribute="newresource" class="form-horizontal">
        
        <!-- select co-owner -->
        <div class="form-group">
            <label class="control-label col-sm-3"><spring:message
                    code="label.resource.co-owner.select" />:</label>
            <div class="col-sm-3">
            <input class="form-control" id="owner_search" type="text" value="">
            </div>
        </div>

        <!-- add resource description -->
        <div class="form-group">
            <label class="control-label col-sm-3"><spring:message
                    code="label.resource.description" />:</label>
            <div class="col-sm-3">
                <input class="form-control" name="description" id="w-input-search"
                    value="${newresource.description}">
            </div>
        </div>
        
        <!-- select resource type -->
        <div class="form-group">
            <label class="control-label col-sm-3"><spring:message
                    code="label.resource.type" />:</label>
            <div class="col-sm-3">
                <select id="resourcesTypeSelect" name="resourceType"
                    class="form-control" required>
                    <option value=""><spring:message
                            code="label.resource.selectType" />:
                    </option>
                    <c:forEach items="${listOfResourceType}" var="restype">
                        <option value="${restype.typeName}">${restype.typeName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        
        <!-- input of selected type parameters  -->
        <div id="typeParameters"></div>
        
        <!-- registration number of resource-->
        <div class="form-group">
            <label class="control-label col-sm-3"><spring:message
                    code="label.resource.identifier" />:</label>
            <div class="col-sm-3">
                <input class="form-control" name="identifier" required
                    value="${newresource.identifier}">
            </div>
            <div class="control-group error">
                <form:errors path="identifier" cssClass="error" style="color:red" />
            </div>
        </div>
        
        <!-- reasonInclusion -->
        <div class="form-group">
            <label class="control-label col-sm-3"><spring:message
                    code="label.resource.reasonInclusion" />:</label>
            <div class="col-sm-3">
                <textarea id="reasonInclusion" class="form-control" rows="5"
                    name="reasonInclusion" required>${newresource.reasonInclusion}</textarea>
            </div>
			<div class="checkbox">
				<label><input id="pass" type="checkbox" disabled>
				<spring:message code="label.resource.pass" /></label><br /> <label><input
					id="will" type="checkbox" disabled>
				<spring:message code="label.resource.willDocumant" /></label><br /> <label><input
					id="otherDocs" type="checkbox" disabled>
				<spring:message code="label.resource.otherDocuments" /></label><br /> <label><input
					id="tytul" type="checkbox" disabled>
				<spring:message code="label.resource.propertyTilel" /></label><br /> <label><input
					id="delivery" type="checkbox">
				<spring:message code="label.resource.assignment" /></label>
			</div>
		</div>
        
         <!-- reasonInclusion -->
        <div class="form-group">
            <label class="control-label col-sm-3"><spring:message
                    code="label.resource.date" />:</label>
            <div class="col-sm-3">
                <input class="form-control" type="text" id="datepicker" name="date" required
                    value="${date}">
            </div>
            <div class="control-group error">
                <form:errors path="date" cssClass="error" style="color:red" />
            </div>
        </div>
        <!-- fill tome identifier -->
<%--         <div class="form-group ">
            <label class="control-label col-sm-3"><spring:message
                    code="label.resource.tome" />:</label>
            <div class="col-sm-3">
                <input class="form-control" name="tomeIdentifier" required readonly
                    value="${tome.identifier}">
            </div>
        </div> --%>
 
        <!-- Coordinates -->
        <legend>
            <spring:message code="label.resource.coordinates" />
        </legend>

        <%--Container for Google map--%>
        <p>
            <i>Щоб виділити на мапі область, оберіть інструмент "Намалювати
                фігуру" в верхній частині мапи.</i>
        </p>

        <div id="map_canvas" class="container"
            style="height: 500px; padding: 20px 0px;"></div>
        <div class="col-sm-12">
            <button id="addPointsFromMap" class="btn btn-primary" type="button" style="margin-top: 10px;">Додати координати з мапи</button>
        </div>

         <div class="form-group">
            <label class="control-label col-sm-1"><spring:message
                    code="label.resource.orderPoint" /></label> <label
                class="control-label col-sm-3"><spring:message
                    code="label.resource.latitude" /></label> <label
                class="control-label col-sm-3"><spring:message
                    code="label.resource.longitude" /></label>
        </div>
        <div id="areaInput1" class="form-group clonedAreaInput">
            <div class="col-sm-1" style="width: 130px; height: 34px">
                <input id="pointNumber" class="form-control"
                    name="resourceArea.poligons[0].points[0].orderNumber" value="${1}"
                    readonly>
            </div>
            <div class="col-sm-1" style="width: 130px; height: 34px">
                <input id="myparam1" class="form-control"
                    name="resourceArea.poligons[0].points[0].latitudeDegrees" value="${0}"required>
            </div>
            <div class="col-sm-1" style="width: 130px; height: 34px">
                <input id="myparam2" class="form-control"
                    name="resourceArea.poligons[0].points[0].latitudeMinutes" value="${0}" required>
            </div>
            <div class="col-sm-1" style="width: 130px; height: 34px">
                <input id="myparam3" class="form-control"
                    name="resourceArea.poligons[0].points[0].latitudeSeconds" value="${0.0}" required>
            </div>
            <div class="col-sm-1" style="width: 130px; height: 34px">
                <input id="myparam4" class="form-control"
                    name="resourceArea.poligons[0].points[0].longitudeDegrees" value="${0}" required>
            </div>
            <div class="col-sm-1" style="width: 130px; height: 34px">
                <input id="myparam5" class="form-control"
                    name="resourceArea.poligons[0].points[0].longitudeMinutes" value="${0}" required>
            </div>
            <div class="col-sm-1" style="width: 130px; height: 34px">
                <input id="myparam6" class="form-control"
                    name="resourceArea.poligons[0].points[0].longitudeSeconds" value="${0.0}" required>
            </div>
        </div>
        <div class="control-group error">
            <form:errors
                path="resourceArea.poligons[0].points[0].latitudeDegrees"
                cssClass="error" style="color:red" />
        </div>
        <div id="mybuttontype">
            <input type="button" id="btnAddAreaPoint" value="+"
                class="btn btn-primary" /> <input type="button"
                id="btnDelAreaPoint" value="-" class="btn btn-primary deleteButton" />
        </div>
        <br />
        <div class="button">
            <input type="submit" class="btn btn-success" value=<spring:message code="label.save"/> >
            <button type="reset" class="btn btn-default" id="hahaha">
                <spring:message code="label.clearall" />
            </button>
        </div>
    </form:form>

<%--Scripts for Google Map--%>
    <p>
        <input id="gmaps-input" class="controls gmap-input"
            style="width: 300px;" type="text"
            placeholder="Пошук на мапі">
    </p>
    <p><a id="gmaps-show-res" class="controls gmap-button">Показати ресурси</a></p>

<%--AJAX Loader on the dark display--%>
    <div id="dark_bg">
        <div class="windows8">
            <div class="wBall" id="wBall_1">
                <div class="wInnerBall"></div>
            </div>
            <div class="wBall" id="wBall_2">
                <div class="wInnerBall"></div>
            </div>
            <div class="wBall" id="wBall_3">
                <div class="wInnerBall"></div>
            </div>
            <div class="wBall" id="wBall_4">
                <div class="wInnerBall"></div>
            </div>
            <div class="wBall" id="wBall_5">
                <div class="wInnerBall"></div>
            </div>
        </div>
    </div>


    <script
        src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=drawing,places"></script>
    <script type="text/javascript"
        src="${base}resource/js/addResourceOnMap.js"></script>
</div>

<spring:url value="/resource/js/lib/jquery.autocomplete.min.js"
    var="autocompleteJs" />
<spring:url value="/resource/js/lib/jquery-ui.datepscker.min.js"
    var="datepickerJs" />
<spring:url value="/resource/js/descriptionAutocomplete.js"
    var="descAutocomplete" />
<spring:url value="/resource/js/ownerControl.js"
    var="ownerControl" />
<spring:url value="/resource/js/addArea.js" var="addAreaJs" />
<spring:url value="/resource/css/suggestion.css" var="suggestionCss" />

<script src="${datepickerJs}"></script>
<script src="${autocompleteJs}"></script>
<script src="${descAutocomplete}"></script>
<script src="${ownerControl}"></script>
<script src="${addAreaJs}"></script>
<link rel="stylesheet" type="text/css" href="${suggestionCss}">
<link rel="stylesheet" type="text/css" href="${base}resource/css/cssload.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
