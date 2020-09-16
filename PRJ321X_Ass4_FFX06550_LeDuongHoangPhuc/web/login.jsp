<%-- 
    Document   : login
    Created on : Jun 30, 2020, 2:10:51 PM
    Author     : nkokp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<div class="py-5 card-body text-center align-content-sm-center">
    <div class="card-header">
        Login
    </div>
    <div class="card-body">
        <form action="MainController" method="POST">
            <p>Username: <input type="text" name="txtUsername"/></p>
            <p>Password: <input type="password" name="txtPassword"/></p>
            <hr>
            <input type="submit" value="Login" name="btAction" class="btn btn-success"/>
            <font color="red">${message}</font>
        </form>
    </div>
</div>
            <br/><br/><br/><br/><br/><br/>
<%@include file="footer.jsp" %>
