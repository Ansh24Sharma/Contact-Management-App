<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration - Contact Application</title>
        <s:url var="url_css" value="/static/css/reg.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>
        <s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js" />
        <script src="${url_jqlib}"></script>
        <script>
            $(document).ready(function (){
                $("#id_check_avail").click(function(){
                    $.ajax({
                        url : 'check_avail',
                        data : { username: $("#id_username").val()} ,
                        success : function(data){
                            $("#id_res_div").html(data);
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <header>
            <h1>Contact Application</h1>
        </header>

        <nav>
            <jsp:include page="include/menu.jsp"/>
        </nav>

        <main>
            <div class="login-box">
                <h3>User Registration</h3>
                <c:if test="${err != null}">
                    <p class="error">${err}</p>
                </c:if>
                <s:url var="url_reg" value="/register"/>
                <f:form action="${url_reg}" modelAttribute="command">
                    <label for="user.name">Name</label>
                    <f:input path="user.name" id="user.name" />

                    <label for="user.phone">Phone</label>
                    <f:input path="user.phone" id="user.phone" />

                    <label for="user.email">Email</label>
                    <f:input path="user.email" id="user.email" />

                    <label for="user.address">Address</label>
                    <f:textarea path="user.address" id="user.address" />

                    <label for="user.loginName">Username</label>
                    <f:input id="id_username" path="user.loginName" />
                    <button type="button" id="id_check_avail">Check Availability</button>
                    <div id="id_res_div" class="error"></div>

                    <label for="user.password">Password</label>
                    <f:password path="user.password" id="user.password" />

                    <button type="submit">Submit</button>
                </f:form>
            </div>
        </main>

        <footer>
            <jsp:include page="include/footer.jsp"/>
        </footer>
    </body>
</html>