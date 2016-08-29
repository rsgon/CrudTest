<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
  <title>User data</title>
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
      background-color: #EEE8AA;
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
      background-color: #00FA9A;
    }
  </style>
</head>
<body>
<h1>User data</h1>
<table class="tg">
  <tr>
    <th width="40">ID</th>
    <th width="120">Name</th>
    <th width="40">Age</th>
    <th width="60">Admin</th>
    <th width="140">Date</th>
  </tr>
  <tr>
    <td>${user.id}</td>
    <td>${user.name}</td>
    <td>${user.age}</td>
    <td>${user.admin}</td>
    <td>${user.createdDate}</td>
  </tr>
</table>
</body>
</html>
