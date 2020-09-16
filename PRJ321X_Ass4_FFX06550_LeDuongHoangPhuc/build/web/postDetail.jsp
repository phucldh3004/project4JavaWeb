<%-- 
    Document   : PostDetail
    Created on : Jun 30, 2020, 10:20:37 PM
    Author     : nkokp
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="phucldh.dtos.PostDetailDTO"%>
<%@page import="phucldh.daos.PostDAO"%>
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

        <div class="col-lg-9 py-5">

        <%
            PostDAO post = new PostDAO();
            ArrayList<PostDetailDTO> listPost = post.LoadPost();
            for (int i = 0; i < listPost.size(); i++) {
        %>

            <div class="card card-outline-secondary my-4">
                <div class="card-header" height="177" weight="688">

                    <a class="card-title" style="font-size: xx-large" href="PostDetailServlet?btAction=<%=listPost.get(i).getIdPostDetail()%>"><%=listPost.get(i).getTitle()%></a

                </div>

                <div class="card-body">

                    <p><%=listPost.get(i).getContent()%></p>
                    <small class="text-muted">Posted by <%=listPost.get(i).getAuthor()%> on <%=listPost.get(i).getPublishedTime()%></small>

                </div>

            </div>

        <%
            }
        %>
        </div>


    </div>

</div>
<%@include file="footer.jsp" %>
