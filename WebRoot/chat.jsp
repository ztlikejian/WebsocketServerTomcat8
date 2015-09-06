<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String serverHost = request.getServerName();
int serverPort = request.getServerPort();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<title>基于WebSocket的聊天室</title>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		if (window.WebSocket){
		    alert("supports WebSocket!");
		} else {
		    alert("does not support WebSocket.");
		}
		var serverHost = '<%=serverHost%>';
		var serverPort = '<%=serverPort%>';
		var serverPath =  serverHost + ":" + serverPort;
		var nick = '${nick}';
		//var webSocket = new WebSocket('ws://'+ serverPath +'/WebsocketServerTomcat8/websocket/' + nick);
		var webSocket = new WebSocket('ws://localhost:8081/WebsocketServerJetty9/websocket/?nick=likejian');
		webSocket.onerror = function(event) {
			onError(event);
		};
	
		webSocket.onopen = function(event) {
			onOpen(event);
		};
	
		webSocket.onmessage = function(event) {
			onMessage(event);
		};
	
		function onMessage(event) {
			var text = event.data;
			$("#chatdiv").append(text + "</br>");
			$("#chatdiv")[0].scrollTop = $("#chatdiv")[0].scrollHeight;
		}
	
		function onOpen(event) {
			
		}
	
		function onError(event) {
			alert(event.data);
		}
		function disconnect() {
			webSocket.close();
			return false;
		}
		$(function(){
			$("#say").bind("click",function(){
				var sayContent = $('#sayContent').val();
				if(sayContent != ""){
					webSocket.send(sayContent);					
				}
  			});
		}); 
	</script>
   </head>
<body>
	您的昵称：<span id="nick">${nick}</span>
	<div id="chatdiv" style="overflow-y:auto; width:400px; height:300px;"></div>
	</br>
	<input type="text" id="sayContent"/><button id="say">说话</button>
	</br>
	<button onclick="disconnect();">退出聊天室</button>
	<a href="http://www.baidu.com">打开百度</a>
</body>
</html>
