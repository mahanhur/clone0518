<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    $(function () {
        item_get.init();
    });
</script>

<div class="col-sm-8 text-center">

    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                <c:forEach var="obj" items="${cpage.getList()}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/uimg/${obj.imgname}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${obj.name}</h5>

                                    <!-- Product price-->
<%--                                    <input type="hidden" class="cust_id" value="${logincust.id}">--%>
<%--                                    <input type="hidden" class="item_id" value="${obj.id}">--%>
                                    <fmt:formatNumber value="${obj.price}" pattern="###,###¿ø"/>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <button type="button" class="btn btn-outline-dark mt-auto cart_btn" data-itemid="${obj.id}" >Add to cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <jsp:include page="page.jsp"/>
        </div>
    </section>
</div>