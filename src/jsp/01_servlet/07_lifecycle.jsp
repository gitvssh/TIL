<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
String str="Hello!!--전역변수";

public void jspInit(){
	str+="jspInit()메서드";
}
%>

<%!
public void jspDestroy(){
	System.out.println("jspDestroy() call");
}
%>
<%
str+="_jspService() 메서드";
%>
<%= str %>
</body>
</html>