<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 생성하기</title>
<%@ include file="../common/bootstrap.jsp" %>
</head>
<body>
	<div class="container">
		<h2>글작성</h2>
		<hr>
		<form action="write" method="POST">
		  <div class="mb-3">
		    <label for="title" class="form-label">제목</label>
		    <input type="text" class="form-control" id="title" name="title">
		  </div>
		  <div class="mb-3">
		    <label for="writer" class="form-label">쓰니</label>
		    <input type="text" class="form-control" id="writer" name="writer">
		  </div>
		  <div class="mb-3">
		    <label for="content" class="form-label">내용</label>
		    <textarea class="form-control" id="content" rows="10" cols="30" name="content"></textarea>
		  </div>
		  
		  <button class="btn btn-primary">등록</button>
		</form>
		
	</div>
</body>
</html>