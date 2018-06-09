<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Search</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <h2>Search for books</h2>
    </br>

    <form action="/search/do" method="post">
        <table class="table">
        <tr>
            <td>
                <label for="searchText">
                    Search by year:
                </label>
            </td>
            <td>
                <input type="text" name="searchText" id="searchText"/><br/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit"  value="do search"/>
            </td>
        </tr>
        </table>
    </form>

    </br>
    </br>


    <c:if test="${!empty foundBooks}">
    <h2>Searching results</h2>
    </br>

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

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${foundBooks}" var="book">

            <tr>
                <th scope="row">${book.id}</th>
                <td>${book.title}</td>
                <td>${book.description}</td>
                <td>${book.author}</td>
                <td>${book.isbn}</td>
                <td>${book.printYear}</td>
                <td>${book.readAlready}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    </c:if>


    </br>
    <a href="${contextPath}/books/1" >Go to list of books</a> </br>
    <a href="${contextPath}/" >Welcome page</a> </br>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>