<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<title>Comet4J Hello World</title>
	<script type="text/javascript" src="js/comet4j.js"></script>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		function intochat(){
			var nickVal = $("#nick").val();
			window.location.href="chatServlet/into?nick=" + nickVal;
		}
	</script>
   </head>
<body>
	<span>你的昵称：</span><input type="text" id="nick"/>
	<button onclick="intochat();">进入聊天室</button>
</body>
</html>
