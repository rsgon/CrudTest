<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page session="false" %>
<html>
<head>
  <title>Edit User list</title>
  <style type="text/css">
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

<c:url var="addAction" value="/users/add"/>
<form:form action="${addAction}" commandName="user">
  <c:if test="${user.id != 0}">
    <h1 align="center">Edit User data</h1>
  </c:if>
  <c:if test="${user.id == 0}">
    <h1 align="center">Add User data</h1>
  </c:if>
  <table>
    <c:if test="${user.id != 0}">
      <tr>
        <td>
          <form:label path="id">
            <spring:message text="ID"/>
          </form:label>
        </td>
        <td>
          <form:input path="id" readonly="true" size="8" disabled="true"/>
          <form:hidden path="id"/>
        </td>
      </tr>
    </c:if>
    <tr>
      <td>
        <form:label path="name">
          <spring:message text="Name"/>
        </form:label>
      </td>
      <td>
        <form:input path="name" type="text" id="name"/>
      </td>
      <td>
        <form:errors path="name"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="age">
          <spring:message text="Age"/>
        </form:label>
      </td>
      <td>
        <form:input path="age"/>
      </td>
      <td>
        <form:errors path="age"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="admin">
          <spring:message text="Administrator"/>
        </form:label>
      </td>
      <td>
        <form:checkbox path="admin"/>
      </td>
    </tr>
    <tr>
      <td  align="center" colspan="2">
        <c:if test="${user.id != 0}">
          <input type="submit" value="<spring:message text="Edit user"/>"/>
        </c:if>
        <c:if test="${user.id == 0}">
          <input type="submit" value="<spring:message text="Add user"/>"/>
        </c:if>
      </td>
    </tr>
  </table>
</form:form>
</body>
</html>
