<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="utils.AuthUtils" %>
<%@ page import="model.ProductDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Form</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f6d365, #fda085, #a18cd1, #fbc2eb);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            margin: 0;
            padding: 50px 20px;
            min-height: 100vh;
            overflow-y: auto; /* ✅ Cho phép cuộn khi cần */
            display: flex;
            justify-content: center;
            align-items: flex-start; /* ✅ Đẩy form lên trên */
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px 50px;
            border-radius: 20px;
            box-shadow: 0 15px 25px rgba(0,0,0,0.2);
            max-width: 600px;
            width: 100%;
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        h1 {
            text-align: center;
            color: #444;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: 600;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 10px;
            border: 1px solid #ddd;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        input:focus, textarea:focus {
            border-color: #a18cd1;
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 12px 25px;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            font-size: 14px;
            cursor: pointer;
            margin-right: 10px;
            transition: transform 0.2s ease;
        }

        input[type="submit"] {
            background: linear-gradient(45deg, #f6d365, #fda085);
            color: #fff;
        }

        input[type="reset"] {
            background: linear-gradient(45deg, #a18cd1, #fbc2eb);
            color: #fff;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            transform: scale(1.05);
        }

        .message {
            text-align: center;
            color: #e74c3c;
            font-weight: bold;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<%
    ProductDTO product = null;
    String checkError = null;
    String message = null;

    if (AuthUtils.isAdmin(request)) {
        product = (ProductDTO) request.getAttribute("product");
        checkError = (String) request.getAttribute("checkError");
        message = (String) request.getAttribute("message");
        String keyword = (String)request.getAttribute("keyword");
        boolean isEdit = request.getAttribute("isEdit")!=null;
%>
    <div class="container">
        <h1><%=isEdit?"Edit Product":"Add New Product"%></h1>
        
        <form action="MainController" method="post">
            <% if(keyword != null) { %>
            <input type="hidden" name="strKeyword" value="<%=keyword%>"/>
            <% } %>
            <input type="hidden" name="action" value="<%=isEdit?"updateProduct":"addProduct"%>"/>

            <label for="id">Product ID*</label>
            <input type="text" name="id" id="id" required value="<%=product != null ? product.getId() : ""%>" <%=isEdit ? "readonly" : ""%>/>

            <label for="name">Name*</label>
            <input type="text" name="name" id="name" required value="<%=product != null ? product.getName() : ""%>"/>

            <label for="image">Image</label>
            <input type="text" name="image" id="image" value="<%=product != null ? product.getImage() : ""%>"/>

            <label for="description">Description</label>
            <textarea name="description" id="description"><%=product != null ? product.getDescription() : ""%></textarea>

            <label for="price">Price*</label>
            <input type="number" name="price" id="price" min="0" step="0.01" required value="<%=product != null ? product.getPrice() : ""%>"/>

            <label for="size">Size</label>
            <input type="text" name="size" id="size" value="<%=product != null ? product.getSize() : ""%>"/>

            <label for="status">Status (Active)</label>
            <input type="checkbox" name="status" id="status" value="true" 
                   <%=product != null && product.isStatus() ? "checked" : ""%> />

            <div style="text-align:center; margin-top: 25px;">
                <input type="submit" value="<%=isEdit? "UpdateProduct":"Add Product"%>" />
                <input type="reset" value="Reset"/>
            </div>

            <div class="message">
                <%=checkError != null ? checkError : ""%><br/>
                <%=message != null ? message : ""%>
            </div>
        </form>
    </div>
<%
    } else {
%>
    <div class="container">
        <%= AuthUtils.getAccessDeniedMessage("product form page") %>
    </div>
<%
    }
%>
</body>
</html>
