<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="false" %>
<html>
<head>
  <title>Users</title>
  <style type="text/css">
    .tg {
      border-collapse: collapse;
      border-spacing: 0;
      border-color: #ccc;
    }

    .tg td {
      font-family: "Arial Green", sans-serif;
      font-size: 14px;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #EEE8AA;
    }

    .tg th {
      font-family: "Arial Green", sans-serif;
      font-size: 14px;
      font-weight: normal;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #00FA9A;
    }

    A {
      text-decoration: none;
    }

    table {
      margin: auto;
    }
  </style>
</head>
<body>
<a href="../../index.jsp">Return to main menu</a>

<br/>
<br/>

<h2 align="center">User list</h2>
<c:if test="${pageCount == 0}">
  <h1 align="center">is empty</h1>
</c:if>
<c:if test="${pageCount > 0}">
  <c:if test="${!empty page}">
    <table class="tg">
      <tr>
        <th width="40">ID</th>
        <th width="120">Name</th>
        <th width="40">Age</th>
        <th width="80">Admin</th>
        <th width="140">Date</th>
        <th width="60">Edit</th>
        <th width="60">Delete</th>
      </tr>
      <c:forEach items="${page}" var="user">
        <tr>
          <td>${user.id}</td>
          <td>${user.name}</td>
          <td>${user.age}</td>
          <td>${user.admin}</td>
          <td align="center"><fmt:formatDate type="both" value="${user.createdDate}"/></td>
          <td align="center"><a href="<c:url value="/addoredit/${user.id}"/>">Edit</a></td>
          <td align="center"><a href="<c:url value="/remove/${user.id}"/>">Delete</a></td>
        </tr>
      </c:forEach>
    </table>
  </c:if>
</c:if>

<br/>

<c:if test="${!empty page}">
  <table>
    <tr>
      <td><a href="<c:url value="/users/${0}"/>"><<</a></td>
      <td></td>
      <c:forEach items="${refs}" var="count">
        <td><a href="<c:url value="/users/${count.intValue()}"/>">${count.intValue() + 1}</a>
        </td>
      </c:forEach>
      <td></td>
      <td><a href="<c:url value="/users/${pageCount - 1}"/>">>></a></td>
    </tr>
  </table>
</c:if>
<br/>
<br/>

<table>
  <tr>
    <td></td>
    <td>
      <form action="/addoredit">
        <button type="submit">Add User</button>
      </form>
    </td>
    <td></td>
    <c:if test="${pageCount != 0}">
      <td>
        <form action="/search">
          <button type="submit">Search User</button>
        </form>
      </td>
    </c:if>
  </tr>
</table>
</body>
</html>

