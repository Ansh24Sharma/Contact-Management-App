<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List - Contact Application</title>
        <s:url var="url_css" value="/static/css/users.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>
        <s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js" />
        <script src="${url_jqlib}"></script>
        <script>
            function changeStatus(uid, lstatus) {
                $.ajax({
                    url: 'change_status',
                    data: {userId: uid, loginStatus: lstatus},
                    success: function(data) {
                        alert(data);
                    }
                });
            }
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
            <div class="content-area">
                <h3>User List</h3>

                <table class="user-table">
                    <tr>
                        <th>SR</th>
                        <th>USER ID</th>
                        <th>NAME</th>
                        <th>PHONE</th>
                        <th>EMAIL</th>
                        <th>ADDRESS</th>
                        <th>USERNAME</th>
                        <th>STATUS</th>
                    </tr>

                    <c:forEach var="u" items="${userList}" varStatus="st">
                        <tr>
                            <td>${st.count}</td>
                            <td>${u.userId}</td>
                            <td>${u.name}</td>
                            <td>${u.phone}</td>
                            <td>${u.email}</td>
                            <td>${u.address}</td>
                            <td>${u.loginName}</td>
                            <td>
                                <select id="id_${u.userId}"
                                        onchange="changeStatus(${u.userId}, $(this).val())"
                                        class="status-select">
                                    <option value="1">Active</option>
                                    <option value="2">Block</option>
                                </select>
                                <script>
                                    $('#id_${u.userId}').val(${u.loginStatus});
                                </script>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </main>

        <footer>
            <jsp:include page="include/footer.jsp"/>
        </footer>
    </body>
</html>