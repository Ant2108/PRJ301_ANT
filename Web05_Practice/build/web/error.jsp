<%-- 
    Document   : error
    Created on : 04/06/2025, 10:12:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.String"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String msg = request.getAttribute("message")+""; %>
        <h1><%=msg%></h1>
    </body>
</html>
