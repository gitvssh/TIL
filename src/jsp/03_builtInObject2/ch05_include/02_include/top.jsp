<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- top.jsp --%>

<%
String id=(String)session.getAttribute("id");
String log="";
id="김";
if(id==null){
	log="<a href=Login.jsp>로그인</a>";
}else{
	log="<a href=Logout.jsp>로그아웃</a>";
}

String mem="";
if(id==null){
	mem="<a href=Register.jsp>회원가입</a>";
}else{
	mem="<a href=MemberUpdate.jsp>회원정보수정</a>";
}
%>
<table width="70%" align=center border=1>
	<tr bgcolor="#ffcc00">
		<td align=center><b><%=log %></b></td>
		<td align=center><b><%=mem %></b></td>
		<td align=center><b><a href="Product.sjp">상품목록</a></b></td>
		<td align=center><b><a href="CartList.sjp">장바구니</a></b></td>
		<td align=center><b><a href="OrderList.sjp">구매목록</a></b></td>
	</tr>
</table>