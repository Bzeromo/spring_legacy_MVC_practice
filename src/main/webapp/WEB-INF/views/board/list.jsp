<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<%@ include file="../common/bootstrap.jsp" %>
</head>
<body>
	<div class="container">
		<%@ include file ="../common/header.jsp" %>
		<h2>게시글 목록</h2>
		<hr>
	
		<table class="table text-center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓰니</th>
				<th>조회수</th>
				<th>등록날짜</th>
			</tr>
			<c:forEach items="${list}" var="board">
				<tr>
					<td>${board.id}</td>
					<td><a href="detail?id=${board.id}">${board.title}</a></td>
					<td>${board.writer}</td>
					<td>${board.viewCnt}</td>
					<td>${board.regDate}</td>
				</tr>
			</c:forEach>
		</table>
		<!-- action 경로를 작성할 떄는 헷갈리지 않게 풀로 쓰는게 좋을듯 하지만 직접 작성보다는 변수를 활용 -->
		<form action="search" method="GET" class="row">
		 	<div class="col-2">
		 		<label>검색기준</label>
		 		<select class="form-select" name="key">
		 			<option value="none">없음</option>
		 			<option value="writer">쓰니</option>
		 			<option value="title">제목</option>
		 			<option value="content">내용</option>
		 		</select>
		 	</div>
		 	<div class="col-5">
		 		<label>검색 내용</label>
		 		<input type="text" name="word" class="form-control">
		 	</div>
		 	<div class="col-2">
		 		<label>정렬기준</label>
		 		<select class="form-select" name="orderBy">
		 			<option value="none">없음</option>
		 			<option value="writer">쓰니</option>
		 			<option value="title">제목</option>
		 			<option value="view_cnt">조회수</option>
		 		</select>
		 	</div>
		 	<div class="col-2">
		 	<label>정렬방향</label>
		 		<select class="form-select" name="orderByDir">
		 			<option value="asc">오름차순</option>
		 			<option value="desc">내림차순</option>
		 		</select>
		 	</div>
		 	<div class="col-1">
		 		<input type="submit" value="검색" class="btn btn-primary">
		 	</div>
		
		
		
		</form>
	
	
	
	
		<div class="d-flex justify-content-end">
			<a href="writeform"class="btn btn-outline-warning">등록</a>
		</div>
		
		
		
		
		
	</div>



</body>
</html>