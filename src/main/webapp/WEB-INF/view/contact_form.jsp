<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Form - Contact Application</title>
        <s:url var="url_css" value="/static/css/contact_form.css"/>
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
            <div class="content-area">
                <h3>Contact Form</h3>
                <c:if test="${err != null}">
                    <p class="error">${err}</p>
                </c:if>
                <s:url var="url_csave" value="/user/save_contact"/>
                <f:form action="${url_csave}" modelAttribute="command">
                    <div>
                        <label for="name">Name</label>
                        <f:input path="name" id="name" />
                    </div>
                    <div>
                        <label for="phone">Phone</label>
                        <f:input path="phone" id="phone" />
                    </div>
                    <div>
                        <label for="email">Email</label>
                        <f:input path="email" id="email" />
                    </div>
                    <div>
                        <label for="address">Address</label>
                        <f:textarea path="address" id="address" />
                    </div>
                    <div>
                        <label for="remark">Remark</label>
                        <f:textarea path="remark" id="remark" />
                    </div>
                    <button type="submit">Save</button>
                </f:form>
            </div>
        </main>

        <footer>
            <jsp:include page="include/footer.jsp"/>
        </footer>
    </body>
</html>