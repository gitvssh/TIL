<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>foward1.jsp</title>
</head>
<body>
<h2>foward1.jsp</h2>
<h2>포워드 액션</h2>

<form action="forward2.jsp" method="post">
	<table border="1">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" size=12></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age" size=12></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="addr" size=40></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="전송">
		<input type="reset" value="취소">
		</td>
	</tr>
	</table>
</form>
</body>
</html>