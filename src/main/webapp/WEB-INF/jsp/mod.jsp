<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.koreait.board.BoardVO"%>
<%
BoardVO vo = (BoardVO) request.getAttribute("data");
%>
<%
String no = request.getParameter("no");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
	<h1>글수정</h1>
	  <!--  action 갈곳 / get이냐 post냐 (두개뿐) -->
	<form action="/mod" method="post">
		<input type="hidden" name="no" value="<%=no %>">
		<div>
		제목 : <input type="text" name= "title" value="<%=vo.getTitle()%>"> <!-- 키값 = "밸류값" 이것을 통해 어떤 게시물인지 알게됨 -->
		</div>
		<div>
		내용 : <textarea name ="ctnt" rows="10" cols="10"><%=vo.getCtnt()%></textarea>
		</div>
		<div>
		<input type ="submit" value="글수정">
		<input type ="reset" value="초기화">
		</div>
	</form>
</body>
</html>