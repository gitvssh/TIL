<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%--02_session.jsp--%>
<%
String memid="park";
session.setAttribute("id",memid);
session.setAttribute("pwd","123");
%>

표현식 <%=session.getAttribute("id")%>님 환영합니다<br>
표현언어 ${sessionScope.id}님 환영합니다<br>
