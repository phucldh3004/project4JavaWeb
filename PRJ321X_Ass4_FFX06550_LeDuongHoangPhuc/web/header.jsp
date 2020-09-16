<%-- 
    Document   : header.jsp
    Created on : Jun 30, 2020, 1:17:50 PM
    Author     : nkokp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/shop-item.css" rel="stylesheet">
        <style>
            .previous {
                border-radius: 50%;
                text-decoration: none;
                display: inline-block;
                padding: 8px 16px;
                background-color: #ddd;
                color: black;
            }

            .next {
                background-color: #ddd;
                color: black;
                border-radius: 50%;
                text-decoration: none;
                display: inline-block;
                padding: 8px 16px;
            }

        </style>
        <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
        <script> tinymce.init({selector: 'textarea'}); </script>
        <title>Header Page</title>
    </head>
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="MainController?btAction=Blog">My Blog</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="postDetail.jsp">Home</a>
                        </li>
                        <%
                            if (session.getAttribute("user") == null) {
                        %><li class="nav-item active">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li> <%
                        } else {
                        %>
                        <li class="nav-item active">
                            <a class="nav-link" href="MainController?btAction=Logout">Logout</a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </nav>

