<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="false" %>
<html>
<head>
    <title>Find user</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: "Arial Black", sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: "Arial Black", sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }
        table {
            margin: auto;
        }
        A {
            text-decoration: none;
        }
    </style>
</head>
<body>

<a href="<c:url value="/users"/>">Return to user list</a>
<br/>
<br/>

<h1 align="center">Search User</h1>
<c:url var="search" value="search"/>
<form:form action="${search}" commandName="searchName">
    <table>
        <tr>
            <td>
                <form:input path="searchName"/>
            </td>
            <td>
                <input type="submit" value="<spring:message text="Search User"/>"/>
            </td>
        </tr>
    </table>
</form:form>
<c:if test="${!empty foundUsers}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Name</th>
            <th width="80">Age</th>
            <th width="100">Admin</th>
            <th width="120">Date</th>
            <th width="80">Edit</th>
            <th width="80">Delete</th>
        </tr>
        <c:forEach items="${foundUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.age}</td>
                <td>${user.admin}</td>
                <td align="center"><fmt:formatDate type="both" value="${user.createdDate}"/></td>
                <td align="center"><a href="<c:url value="/addoredit/${user.id}"/>">Edit</a></td>
                <td algin="center"><a href="<c:url value="/remove/${user.id}"/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>