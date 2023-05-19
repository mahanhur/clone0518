<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .medium_img{
        width:80px;
    }
</style>
<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-6  text-left ">
                <h3>Item All Page</h3>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>IMG</th>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>PRICE</th>
                            <th>REGDATE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="obj" items="${cpage.getList()}">
                            <tr>
                                <td><img class="medium_img" src="/uimg/${obj.imgname}"></td>
                                <td><a href="/item/get?id=${obj.id}">${obj.id}</a></td>
                                <td>${obj.name}</td>
                                <td><fmt:formatNumber value="${obj.price}" pattern="###,###원" /></td>
                                <td><fmt:formatDate  value="${obj.rdate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <jsp:include page="../page.jsp"/>

<%--                <!-- pagination start -->--%>
<%--                <div class="col text-center">--%>
<%--                    <ul class="pagination ">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${cpage.getPrePage() != 0}">--%>
<%--                                <li>--%>
<%--                                    <a href="/item/allpage?pageNo=${cpage.getPrePage()}">Previous</a>--%>
<%--                                </li>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <li class="disabled">--%>
<%--                                    <a href="#">Previous</a>--%>
<%--                                </li>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>

<%--                        <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }" var="page">--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${cpage.getPageNum() == page}">--%>
<%--                                    <li class="active">--%>
<%--                                        <a  href="/item/allpage?pageNo=${page}">${page }</a>--%>
<%--                                    </li>--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <li>--%>
<%--                                        <a href="/item/allpage?pageNo=${page}">${page }</a>--%>
<%--                                    </li>--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>

<%--                        </c:forEach>--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${cpage.getNextPage() != 0}">--%>
<%--                                <li>--%>
<%--                                    <a href="/item/allpage?pageNo=${cpage.getNextPage()}">Next</a>--%>
<%--                                </li>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <li class="disabled">--%>
<%--                                    <a href="#">Next</a>--%>
<%--                                </li>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>

<%--                    </ul>--%>
<%--                </div>--%>
<%--                <!-- pagination end -->--%>
<%--                <jsp: include page="../page.jsp"/>--%>

            </div>
        </div>
    </div>
</div>
