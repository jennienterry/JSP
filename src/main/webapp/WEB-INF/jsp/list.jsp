<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.koreait.board.*"%>
<%
List<BoardVO> list = (List<BoardVO>) request.getAttribute("data");
%>
<!-- object 타입이면 형변환 안해도 된다. (상속관계ㅇ) 그러나 형변환 해줘야하는 이유는
     object로 받아버리면 밑에 size나 get 메소드를 몰라서 사용을 못하게되기 때문이다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<h1>리스트</h1>
	<div>
		<a href="/write">글쓰기</a>
	</div>
	<div>
		<table>
			<tr>
				<th>no</th>
				<th>제목</th>
			</tr>
			<%
			for (int i = 0; i < list.size(); i++) {
				BoardVO vo = list.get(i);
			%>
			
			<tr>
				<td><%=i%></td>
				<td>
				<a href="/detail?no=<%=i %>"><%=vo.getTitle()%></a>
				</td>
			</tr>
			<%	}	%>
		</table>
	</div>
</body>
</html>
