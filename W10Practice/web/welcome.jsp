<%-- 
    Document   : welcome.jsp
    Created on : 20/06/2025, 10:51:35 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.UserDTO" %>
<%@ page import="utils.AuthUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="model.ProductDTO" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: #f9f9f9;
                color: #333;
                margin: 0;
                padding: 20px;
            }

            h1 {
                color: #2c3e50;
            }

            a {
                color: #e74c3c;
                text-decoration: none;
                font-weight: bold;
                margin-left: 20px;
            }

            a:hover {
                text-decoration: underline;
            }

            form {
                margin-top: 20px;
                margin-bottom: 30px;
            }

            input[type="text"] {
                padding: 8px;
                width: 200px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                padding: 8px 16px;
                background-color: #3498db;
                border: none;
                color: white;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
            }

            input[type="submit"]:hover {
                background-color: #2980b9;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
            }

            table thead {
                background-color: #34495e;
                color: white;
            }

            table th, table td {
                padding: 12px 15px;
                border: 1px solid #ddd;
                text-align: center;
            }

            table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            hr {
                margin: 30px 0;
                border: none;
                border-top: 1px solid #ddd;
            }
        </style>


    </head>
    <body>
        <%
           String keyword = (String) request.getAttribute("keyword");
           UserDTO user = AuthUtils.getCurrentUser(request);
           if(!AuthUtils.isLoggedIn(request)){
               response.sendRedirect("MainController");
           }else{
        %>
        <h1>Welcome <%=user.getFullName()%> !</h1>
        <a href="MainController?action=logout">Logout</a>
        <% if(AuthUtils.isAdmin(request)) { %>
            <a href="productForm.jsp">Add New Product</a>
        <% } %>
        <hr/> 
        Search by name:
        <form action="MainController" method="post">
            <input type="hidden" name ="action" value="searchProduct"/>
            <input type="text" name="strKeyword" value="<%=keyword!=null?keyword:""%>"/>
            <input type="submit" value="Search"/>
        </form>
            
        <br/>
        <%
        List<ProductDTO> list =(List<ProductDTO>)request.getAttribute("list");
        if(list != null && list.isEmpty()){
        %>
        No products have names that match the keyword.
        <%
        }else if(list != null && !list.isEmpty()){
        %>
        <table>
            <thead>
            <th>ID</th>
            <th>Name</th>
            <th>Image</th>
            <th>Decription</th>
            <th>Price</th>
            <th>Size</th>
            <th>Status</th>
            <% if(AuthUtils.isAdmin(request)) { %>
            <th>Action</th>
            <% } %>
        </thead>
        <tbody>
            <%
                for(ProductDTO p:list){
            %>
            <tr>
                <td><%=p.getId()%></td>
                <td><%=p.getName()%></td>
                <td><%=p.getImage()%></td>       
                <td><%=p.getDescription()%></td>
                <td><%=p.getPrice()%></td>
                <td><%=p.getSize()%></td>
                <td><%=p.isStatus() ? "Active" : "Inactive"%></td>
                <% if(AuthUtils.isAdmin(request)) { %>
                <td>
                    <form action="MainController" method="post">
                        <input type="hidden" name="action" value="editProduct"/>
                        <input type="hidden" name="productId" value="<%=p.getId()%>"/>
                        <input type="hidden" name="strKeyword" value="<%=keyword!=null?keyword:""%>"/>
                        <input type="submit" value="Edit"/>
                    </form>
                    <form action="MainController" method="post">
                        <input type="hidden" name="action" value="changeProductStatus"/>
                        <input type="hidden" name="productId" value="<%=p.getId()%>"/>
                        <input type="hidden" name="strKeyword" value="<%=keyword!=null?keyword:""%>"/>
                        <input type="submit" value="Delete"/>
                    </form>
                </td>
                <% } %>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
    }
    %>

    <%
        }
    %>
</body>
</html>
