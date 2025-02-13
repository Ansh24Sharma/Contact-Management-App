<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - Contact Application</title>
        <s:url var="url_css" value="/static/css/index.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>
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
                <h3>User Login</h3>
                <c:if test="${err != null}">
                    <p class="error">${err}</p>
                </c:if>
                <c:if test="${param.act eq 'lo'}">
                    <p class="success">Logout Successfully! Thanks for using the contact application.</p>
                </c:if>
                <c:if test="${param.act eq 'reg'}">
                    <p class="success">User  Registered Successfully. Please login.</p>
                </c:if>
                <s:url var="url_login" value="/login"/>
                <f:form action="${url_login}" modelAttribute="command">
                    <label for="loginName">Username</label>
                    <f:input path="loginName" id="loginName" />

                    <label for="password">Password</label>
                    <f:password path="password" id="password" />

                    <button type="submit">Login</button>
                    <a href="<s:url value='/reg_form'/>">New User Registration</a>
                </f:form>
            </div>
        </main>

        <footer>
            <jsp:include page="include/footer.jsp"/>
        </footer>
    </body>
</html>