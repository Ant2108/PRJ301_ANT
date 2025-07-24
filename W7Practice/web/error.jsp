<%-- 
    Document   : error
    Created on : 24/06/2025, 12:11:44 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>404 ERROR</title>
    </head>
    <body>
        <% String msg = request.getAttribute("message");
        %>
        <h1><%=msg%></h1>
    </body>
</html>
