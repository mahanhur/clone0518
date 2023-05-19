<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
  #to {
    width: 600px;
    height: 200px;
    overflow: auto;
    border: 2px solid lightgray;
    border-radius: 10px;
    margin-left: 18%;
  }
</style>
<script>
  let websocket = {
    id:null,
    stompClient:null,
    init:function(){
      this.id = $('#cust_id').text();
      $("#connect").click(function() {
        websocket.connect();
      });
      $("#disconnect").click(function() {
        websocket.disconnect();
      });
      $("#sendto").click(function() {
        websocket.sendTo();
        $("#to").append(
                "<h4>" + "${logincust.id}" +":"+
                $("#totext").val()
                + "</h4>");
      });
    },
    connect:function(){
      var sid = this.id;
      var socket = new SockJS('http://172.16.21.163:8090/ws');
      this.stompClient = Stomp.over(socket);
      this.stompClient.connect({}, function(frame) {
        websocket.setConnected(true);
        console.log('Connected: ' + frame);
        this.subscribe('/send/to/'+sid, function(msg) {
          $("#to").append(
                  "<h4>" + JSON.parse(msg.body).sendid +":"+
                  JSON.parse(msg.body).content1
                  + "</h4>");
        });
      });
    },
    disconnect:function(){
      if (this.stompClient !== null) {
        this.stompClient.disconnect();
      }
      websocket.setConnected(false);
      console.log("Disconnected");
    },
    setConnected:function(connected){
      if (connected) {
        $("#status").text("Connected");
      } else {
        $("#status").text("Disconnected");
      }
    },
    sendTo:function(){
      var msg = JSON.stringify({
        'sendid' : this.id,
        'receiveid' : "admin15",
        'content1' : $('#totext').val()
      });
      this.stompClient.send('/receiveto', {}, msg);
    }
  };
  $(function(){
    websocket.init();
  })
</script>
<div class="col-sm-8">
  <!-- Section-->
  <div class="container px-4 px-lg-5 mt-5">
    <div>
      <div class="panel panel-default">
        <div class="panel-body">
          <h3 id="cust_id">${logincust.id}</h3>
          Status : <h3 id="status" style="color:red">Ready</h3>
          <button id="connect" type="button" class="btn btn-primary">Connect</button>
          <button id="disconnect" type="button" class="btn btn-primary">Disconnect</button>
          <hr/>
          <div id="to"></div>
          Content : <input type="text" id="totext">
          <button id="sendto" type="button" class="btn btn-secondary">Send</button>
        </div>
      </div>
    </div>
  </div>
</div>