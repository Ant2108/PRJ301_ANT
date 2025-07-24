<%-- 
    Document   : login
    Created on : 20/06/2025, 10:29:09 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.UserDTO" %>
<%@ page import="utils.AuthUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        if (AuthUtils.isLoggedIn(request)) {
            response.sendRedirect("welcome.jsp");
        } else {
    %>
        <h1>Login</h1>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login" />
            Username: <input type="text" name="strName" /> <br/>
            Password: <input type="password" name="strPassword" /> <br/> 
            <input type="Submit" value="Login" />
        </form>
    <%
        Object objMessage = request.getAttribute("message");
        String message = (objMessage == null) ? "" : (objMessage + "");
    %>
        <span style="color: red"><%=message%></span>
    <%
        }
    %>
    </body>
</html>
