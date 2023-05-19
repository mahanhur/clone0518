
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-8 text-left">
    <h1 style="margin-top: 30px">CS Center</h1>
    <hr/>
    <div style="display: flex; flex-direction: row">
        <div class="upper1">
            <h3>TEL.<span style="font-size:30px;">1544-7198</span></h3>
            <br/>
            <h5>- 평일 9:00~18:00</h5>
            <h5>- 토, 일, 공휴일 휴무</h5>
        </div>
        <div class="upper2" style="margin-left:40px; margin-top: 8px;">
            <h3>NOTICE<span style="font-size:13px; color:darkgray;">  공지사항</span></h3>
            <hr/>
            <h3>FAQ<span style="font-size:13px; color:darkgray;">  자주 묻는 질문</span></h3>
            <hr/>
            <h3>1:1 QnA<span style="font-size:13px; color:darkgray;">  1:1 문의</span></h3>
            <hr/>
        </div>
        <div class="upper3" style="margin-left:20px; margin-top: 8px;">
            <h3>FIND ID<span style="font-size:13px; color:darkgray;">  아이디 찾기</span></h3>
            <hr/>
            <h3>FIND PASS<span style="font-size:13px; color:darkgray;">  비밀번호 찾기</span></h3>
            <hr/>
            <h3>MEMBERSHIP<span style="font-size:13px; color:darkgray;">  멤버십</span></h3>
            <hr/>
        </div>
    </div>
    <hr/>

    <h1 style="margin-top: 5%;">QnA</h1>
    <table class="table">
        <thead>
        <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="i" items="${qna}">
            <tr>
                <td><a href="/qna/detail?id=${i.id}">${i.title}</td>
                <td>${i.cust_id}</td>
                <td>${i.rdate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/qna/add" class="btn btn-primary">글쓰기</a>
    <hr/>
</div>
