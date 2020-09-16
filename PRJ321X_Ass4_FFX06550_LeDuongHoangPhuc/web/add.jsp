<%-- 
    Document   : add
    Created on : Jun 30, 2020, 11:00:58 PM
    Author     : nkokp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript">
    var html = CKEDITOR.instances.YOUR_TEXTAREA_ID.getSnapshot();
    var dom = document.createElement("DIV");
    dom.innerHTML = html;
    var plain_text = (dom.textContent || dom.innerText);

    alert(plain_text);
    function createTextSnippet() {
        //example as before, replace YOUR_TEXTAREA_ID
        var html = CKEDITOR.instances.YOUR_TEXTAREA_ID.getSnapshot();
        var dom = document.createElement("DIV");
        dom.innerHTML = html;
        var plain_text = (dom.textContent || dom.innerText);

        //create and set a 128 char snippet to the hidden form field
        var snippet = plain_text.substr(0, 127);
        document.getElementById("content").value = snippet;

        //return true, ok to submit the form
        return true;
    }
</script>

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

            <form id="wr1" action="MainController" method="POST">
                <div class="card card-outline-secondary my-4">
                    <div class="card-header">
                        Title: <input type="text" name="title"required/>
                        Enter id: <input type="text" name="idPostDetail" required> <br><br>                      
                        Enter author <input type="text" name="author" required> <br><br>
                    </div>
                    <div class="card-body">
                        <textarea name="content"></textarea>
                        <br/>
                        <hr>
                        <input type="submit" value="Back" name="btAction" > 
                        <input type="submit" value="Submit" name="btAction"><br>
                        <br/><br/>
                        <font color="red">${message}</font>
                    </div>
                </div>
            </form>

        </div>

    </div>

    <%@include file="footer.jsp" %>
