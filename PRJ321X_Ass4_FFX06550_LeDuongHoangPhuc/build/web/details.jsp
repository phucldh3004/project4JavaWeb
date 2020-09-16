<%-- 
    Document   : details
    Created on : Jun 30, 2020, 10:54:50 PM
    Author     : nkokp
--%>

<%@page import="phucldh.dtos.PostDetailDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<div class="container">

    <div class="row">

        <div class="col-lg-3 ">
            <h1 class="my-4">
                <%  if (session != null) {
                        if (session.getAttribute("user") != null) {
                            String name = (String) session.getAttribute("user");
                            out.print("Welcome <q>" + name + "</q>  to my website");
                        } else {
                            response.sendRedirect("login.jsp");
                        }

                %>,<br/><font style="color: red"> ${LOGINID} </font> </h1>

            <div class="list-group">
                <a href="add.jsp" class="list-group-item">Write New</a>
         
            </div>

            <%}
            %>

        </div>

        <%
            PostDetailDTO post = (PostDetailDTO) request.getAttribute("Object");
        %>
        
        <div class="col-lg-9 py-5">

            <div class="card card-outline-secondary my-4">
                <div class="card-header">
                    <a class="card-title" style="font-size: xx-large"><%=post.getTitle()%></a>
                </div>
                <div class="card-body">
                    <p><%=post.getContent()%></p>
                    <small class="text-muted">Posted by <%=post.getAuthor()%> on <%=post.getPublishedTime()%></small>

                </div>
            </div>

        </div>

    </div>
</div>
<%@include file="footer.jsp" %>
