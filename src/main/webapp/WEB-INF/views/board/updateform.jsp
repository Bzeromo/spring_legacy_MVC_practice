<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<%@ include file="../common/bootstrap.jsp" %>
</head>
<body>
	<div class="container">
		<h2>글수정</h2>
		<hr>
		<form action="update" method="POST">
		  <input type="hidden" name="id" value="${board.id}">
		  <div class="mb-3">
		    <label for="title" class="form-label">제목</label>
		    <input type="text" class="form-control" id="title" name="title" value="${board.title }">
		  </div>
		  <div class="mb-3">
		    <label for="writer" class="form-label">쓰니</label>
		    <input type="text" class="form-control" id="writer" name="writer" value="${board.writer }" readonly>
		  </div>
		  <div class="mb-3">
		    <label for="content" class="form-label">내용</label>
		    <textarea class="form-control" id="content" rows="10" cols="30" name="content">${board.content}</textarea>
		  </div>
		  
		  <button class="btn btn-primary">수정</button>
		</form>
	</div>
</body>
</html>