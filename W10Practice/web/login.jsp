<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.UserDTO" %>
<%@ page import="utils.AuthUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                padding: 0;
                height: 100vh;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #e0eafc, #cfdef3);
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .login-container {
                background-color: white;
                padding: 40px 30px;
                border-radius: 15px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                width: 350px;
                text-align: center;
            }

            h2 {
                margin-bottom: 25px;
                color: #333;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 15px;
                transition: border 0.3s ease;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                border-color: #4A90E2;
                outline: none;
            }

            input[type="submit"] {
                width: 100%;
                padding: 12px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                margin-top: 15px;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .error {
                color: red;
                margin-top: 10px;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <%
            if (AuthUtils.isLoggedIn(request)) {
                response.sendRedirect("welcome.jsp");
            } else {
        %>
        <div class="login-container">
            <h2>Login</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login" />
                <input type="text" name="strName" placeholder="Username" required />
                <input type="password" name="strPassword" placeholder="Password" required />
                <input type="submit" value="Login" />
            </form>
            <%
                Object objMessage = request.getAttribute("message");
                String message = (objMessage == null) ? "" : objMessage.toString();
                if (!message.isEmpty()) {
            %>
            <div class="error"><%= message %></div>
            <%
                }
            %>
        </div>
        <%
            }
        %>
    </body>
</html>
