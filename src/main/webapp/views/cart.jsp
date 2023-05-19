<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let cartupdate_form = {
        init: function () {
                $('.cartupdate_btn').click(function () {
                    let cnt = $(this).prev().val();
                    let cust_id = "${logincust.id}";
                    let item_id = $(this).parent().prev().prev().prev().text();

                $.ajax({
                    url: '/updatecart',
                    type: 'post',
                    data: {cnt:cnt, cust_id: cust_id, item_id: item_id},
                    success:function() {
                        if(cust_id != '') {
                            location.href="/item/cart?cid="+cust_id;
                        } else {
                            location.href="/login"
                        }
                    }
                })
            });
    }}
        $(function () {
            cartupdate_form.init();
        });

</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-9 text-left">
                <h3>장바구니</h3>
                <c:set var="total" value="0"/>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>PRICE</th>
                        <th>COUNT</th>
                        <th>TOTAL</th>
                        <th>REGDATE</th>
                        <th>DELETE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${allcart}">
                        <tr>
                            <td><img class="medium_img" src="/uimg/${obj.item_imgname}"></td>
                            <td>${obj.item_id}</td>
                            <td>${obj.item_name}</td>
                            <td><fmt:formatNumber value="${obj.item_price}" pattern="###,###원"/></td>
                            <td><input class="cnt" type="number" value="${obj.cnt}"/>
                                <button class="cartupdate_btn btn btn-basic" type="button">변경</button>
                            </td>
                            <td><fmt:formatNumber value="${obj.cnt * obj.item_price}" pattern="###,###원"/></td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="dd-MM-yyyy"/></td>
                            <td><a href="/delcart?id=${obj.id}" class="btn btn-danger" role="button">삭제</a>
                            </td>
                        </tr>
                        <c:set var="total" value="${total +(obj.cnt * obj.item_price)}"/>
                    </c:forEach>
                    </tbody>
                </table>
                <h4><fmt:formatNumber value="${total}" pattern="###,###원"/></h4>
            </div>
        </div>
    </div>
</div>
<style>
    .medium_img {
        width: 80px;
        height: 80px;
    }
</style>