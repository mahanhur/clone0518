<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <script src="/js/scripts.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <%--카카오맵--%>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da86c8457c75372952796f5bbc52cb25"></script>
    <%--HighChart--%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>

    <!--웹소켓-->
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
<style>
    #scroll-btn {
        font-family: 'Nanum Gothic', sans-serif;
        opacity: 0;
        width: 65px;
        height: 65px;
        color: dimgray;
        background-color: white;
        position: fixed;
        bottom: 13%;
        right: 10%;
        border: 1px solid lightgrey;
        font: bold 15px monospace;
        transition: opacity 2s, transform 2s;
    }
    #scroll-btn.show {
        opacity: 1;
        transition: opacity 5s, transform 5s;
    }
    #scroll-btn2 {
        font-family: 'Nanum Gothic', sans-serif;
        opacity: 0;
        width: 65px;
        height: 65px;
        color: dimgray;
        background-color: white;
        position: fixed;
        bottom: 5%;
        right: 10%;
        border: 1px solid lightgrey;
        font: bold 15px monospace;
        transition: opacity 2s, transform 2s;
    }
    #scroll-btn2.show {
        opacity: 1;
        transition: opacity 5s, transform 5s;
    }
    #scroll-btn:hover {
        color: white;
        background-color: #222222;
    }

    #scroll-btn2:hover {
        color: white;
        background-color: #222222;
    }
</style>

</head>
<body>
<%--navbar--%>
<nav class="main-navbar navbar-inverse">
    <div class="container-fluid">

        <div class="navbar-header">
            <div style="margin: 4px 0px;">
                <a class="main-logo" href="/">MOSINSA</a>
            </div>
        </div>

        <form class="navbar-form navbar-left" action="">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="티셔츠 페스티벌 최대 80% 할인" name="search" style="border-radius: 0; width:250px; font-size: 12px; height: 28px">
                <div class="input-group-btn">
                    <a href="#" class="btn btn-dark" style="background-color: #222222; padding: 3px; margin: auto; width: 28px; height: 28px; border-color: gray; border-radius: 0">
                        <span class="glyphicon glyphicon-search" style="color: lightgrey"></span>
                    </a>
                </div>
            </div>
        </form>

        <ul class="nav main-navbar-nav navbar-right" style="padding-right: 20px">
            <li><a href="/item/top" class="main-navbar-category" style="color: #00D47B;background-color: transparent">상의</a></li>
            <li><a href="/item/bottom" class="main-navbar-category" style="color: #ED00EC;background-color: transparent">하의</a></li>
            <li><a href="/item/shoes" class="main-navbar-category" style="color: #FFFFFF;background-color: transparent">신발</a></li>
            <li></li>
        </ul>

    </div>
</nav>

<div style="height:50px; padding:10px; border-bottom:1px solid lightgrey">
    <c:choose>
        <c:when test="${logincust ==null}">
            <button type="button" id="login_btn" onclick="location.href='/login'"><p>로그인</p></button>
            <span class="loginbar-category" ><a href="#" style="color: #00A3FF; font-weight: bold">바로접속 ON</a></span>
        </c:when>
   <c:otherwise>
            <button type="button" id="login_btn" onclick="location.href='/logout'"><p>로그아웃</p></button>
       <span class="loginbar-category" ><a href="#" style="color: #00A3FF; font-weight: bold">바로접속 ON</a></span>
       <span class="loginbar-category"><a href="/custinfo?id=${logincust.id}">마이페이지</a></span>
       <span class="loginbar-category"><a href="/cart?cid=${logincust.id}">장바구니</a></span>
       <span class="loginbar-category"><a href="/qna">고객센터</a></span>
       <span class="loginbar-category">${logincust.name}(${logincust.id})님 즐거운 쇼핑되세요!</span>

   </c:otherwise>
    </c:choose>

    <c:if test="${logincust == null}">
        <span class="loginbar-category"><a href="/register" style="color: #048EFF">회원 가입 EVENT. 신규 가입 후 바로 사용 가능한 15% 할인 쿠폰 / 모신사 스탠다드 990원 구매 기회</a></span>
    </c:if>
</div>
<div class="container-fluid text-center">
    <div class="row content">
        <%--left menu center--%>
        <c:choose>
            <c:when test="${left == null}">
                <jsp:include page="left.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${left}.jsp"/>
            </c:otherwise>
        </c:choose> <%--left menu end--%>
        <%--center--%>
        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>
        </c:choose> <%--center end--%>
    </div> <%--row content end--%>
</div><%--container end--%>
<footer class="container-fluid text-center">
    <p>Footer Text</p>
</footer>
</body>
</html>
<script>
    let chatbtn = {
        init:function(){
            const scrollBtn = document.createElement("button");
            scrollBtn.innerHTML = "챗봇";
            scrollBtn.setAttribute("id", "scroll-btn");
            document.body.appendChild(scrollBtn);
            scrollBtn.classList.add("show");
            scrollBtn.addEventListener("click", function(){
                location.href='/login';
            });
            const scrollBtn2 = document.createElement("button");
            scrollBtn2.innerHTML = "1:1 상담";
            scrollBtn2.setAttribute("id", "scroll-btn2");
            document.body.appendChild(scrollBtn2);
            scrollBtn2.classList.add("show");
            scrollBtn2.addEventListener("click", function(){
                location.href='/ws';
            });
        }
    };
    $(function(){
        chatbtn.init();
    });

</script>