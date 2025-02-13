<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact List - Contact Application</title>
        <s:url var="url_css" value="/static/css/clist.css"/>
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
                <h3>Contact List</h3>

                <c:if test="${param.act eq 'sv'}">
                    <p class="success">Contact Saved Successfully</p>
                </c:if>
                <c:if test="${param.act eq 'del'}">
                    <p class="success">Contact Deleted Successfully</p>
                </c:if>

                <form action="<s:url value="/user/contact_search"/>" class="search-form">
                    <input type="text" name="freeText" value="${param.freeText}" placeholder="Enter Text To Search">
                    <button type="submit">Find</button>
                </form>

                <form action="<s:url value="/user/bulk_cdelete"/>">
                    <button type="submit">Delete Selected Records</button>

                    <table class="contact-table">
                        <tr>
                            <th>SELECT</th>
                            <th>CID</th>
                            <th>NAME</th>
                            <th>PHONE</th>
                            <th>EMAIL</th>
                            <th>ADDRESS</th>
                            <th>REMARK</th>
                            <th>ACTION</th>
                        </tr>

                        <c:if test="${empty contactList}">
                            <tr>
                                <td colspan="8" class="error">No Records Present</td>
                            </tr>
                        </c:if>

                        <c:forEach var="c" items="${contactList}" varStatus="st">
                            <tr>
                                <td><input type="checkbox" name="cid" value="${c.contactId}"/></td>
                                <td>${c.contactId}</td>
                                <td>${c.name}</td>
                                <td>${c.phone}</td>
                                <td>${c.email}</td>
                                <td>${c.address}</td>
                                <td>${c.remark}</td>
                                <td class="action-links">
                                    <s:url var="url_edit" value="/user/edit_contact">
                                        <s:param name="cid" value="${c.contactId}"/>
                                    </s:url>
                                    <s:url var="url_del" value="/user/del_contact">
                                        <s:param name="cid" value="${c.contactId}"/>
                                    </s:url>
                                    <a href="${url_edit}">Edit</a>
                                    <a href="${url_del}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </form>
            </div>
        </main>

        <footer>
            <jsp:include page="include/footer.jsp"/>
        </footer>
    </body>
</html>