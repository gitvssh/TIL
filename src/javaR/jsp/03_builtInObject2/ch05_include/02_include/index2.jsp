<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index2.jsp</title>
</head>
<body bgcolor="#996600">
<%@ include file="top.jsp" %>

<table width="70%" align=center height="80%" bgcolor="#ffff99">
<%
if(id!=null){
%>
<tr>
	<td align=center>
	<%=id %>님 방문해 주셔서 감사합니다.
	</td>
</tr>
<%	
}else{
%>
<tr>
	<td align=center>
	로그인 하신 후에 방문해주세요.
	</td>
</tr>
<%
}
%>

</table>

<%@ include file="bottom.jsp" %>
</body>
</html>