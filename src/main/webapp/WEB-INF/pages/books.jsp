<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>List of books</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>


</head>
<body>
<div class="container">

    <c:if test="${!empty listBooks}">
        <h2>Books list</h2>


                <c:forEach items="${numOfPages}" var="page">
                    <div style="width: 30px; height: 20px; float: left">
                        <a href="/books/${page}" >${page}</a>
                    </div>
                </c:forEach>

    </c:if>
    <c:if test="${empty listBooks}">
        <h2>No books found</h2>
    </c:if>
    <c:if test="${!empty listBooks}">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#id</th>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
                <th scope="col">Author</th>
                <th scope="col">ISBN-13</th>
                <th scope="col">Year</th>
                <th scope="col">Has read</th>
                <th scope="col">Mark as read</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listBooks}" var="book">

                <tr>
                    <th scope="row">${book.id}</th>
                    <td>${book.title}</td>
                    <td>${book.description}</td>
                    <td>${book.author}</td>
                    <td>${book.isbn}</td>
                    <td>${book.printYear}</td>
                    <td>${book.readAlready}</td>
                    <td><a href="<c:url value='/read/${book.id}'/>">mark</a></td>
                    <td><a href="<c:url value='/edit/${book.id}'/>">edit</a></td>
                    <td><a href="<c:url value='/remove/${book.id}'/>">delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${!empty book.title}">
        <h2>Edit book</h2>
    </c:if>
    <c:if test="${empty book.title}">
        <h2>Add new book</h2>
    </c:if>

    <c:url var="addAction" value="/books/add"/>

    <form:form action="${addAction}" commandName="book">
        <table class="table">
            <tr>
                <td>
                    <form:label path="title">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <c:if test="${!empty book.title}">
                        <form:hidden path="id"/>
                    </c:if>
                    <form:input path="title"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="description">
                        <spring:message text="Description"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="description"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="author">
                        <spring:message text="Author"/>
                    </form:label>
                </td>
                <td>
                    <c:if test="${!empty book.title}">
                        <form:input path="author" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="author"/>
                    </c:if>
                    <c:if test="${empty book.title}">
                        <form:input path="author"/>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="isbn">
                        <spring:message text="ISBN"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="isbn"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="printYear">
                        <spring:message text="Year when book was published"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="printYear"/>
                    <form:hidden path="readAlready" value="false"/>
                </td>
            </tr>
            <c:if test="${!empty book.title}">
            <tr>
                <td>
                    <form:label path="readAlready">
                        <spring:message text="Is book read?"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="readAlready" disabled="true" readonly="true"/>
                    <form:hidden path="readAlready"/>
                </td>
            </tr>
            </c:if>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty book.title}">
                        <input type="submit"
                               value="<spring:message text="Edit Book"/>"/>
                    </c:if>
                    <c:if test="${empty book.title}">
                        <input type="submit"
                               value="<spring:message text="Add Book"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>




    <a href="${contextPath}/">Back to main menu</a> </br>
    <a href="${contextPath}/search" >Search for book</a> </br>
</div>



</body>
</html>
