<%-- 
    Document   : index
    Created on : 16/05/2025, 8:10:46 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Form Demo</title>
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <h1>HTML Forms</h1>
        <form action="#" method="post">
            Textbox <input type="text" name="txtTextbox"/> <br/> 
            Password <input type="password" name="txtPassword"/><br/>
            Hidden <input type="hidden" name="txtHidden"/><br/>
            <label><input type="checkbox" name="chkCheck" value="ON" checked="checked"/> Male</label><br/>

            Status <br/>
            <label><input type="radio" name="rdoStatus" value="Single" checked="checked"/> Single</label><br/>
            <label><input type="radio" name="rdoStatus" value="Married" /> Married</label><br/>
            <label><input type="radio" name="rdoStatus" value="Divorsed" /> Divorsed</label><br/>

            ComboBox 
            <select name="txtCombo">
                <option value="Servlet"> JSP and Servlet</option>
                <option value="EJB"> EJB</option>
            </select><br/>

            Multiple 
            <select name="txtList" multiple="multiple">
                <option value="Servlet" selected="selected"> JSP and Servlet</option>
                <option value="EJB" selected="selected"> EJB</option>
                <option value="Java"> Core Java</option>
            </select><br/> 

            TextArea 
            <textarea name="txtArea" rows="4" cols="20">This is form parameters demo!!!!</textarea><br/>

            <input type="submit" value="Submit Query" name="txtB"/>
            <input type="submit" value="Register" name="action"/>
            <input type="reset" value="Reset" name="txtB"/>
            <input type="button" value="JavaScript" name="txtB"/>
        </form>
    </body>
</html>
