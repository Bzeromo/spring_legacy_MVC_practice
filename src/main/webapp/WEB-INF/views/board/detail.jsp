<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<%@ include file="../common/bootstrap.jsp" %>
</head>
<body>
	<div class="container">
		<h2>글상세보기</h2>
		<hr>
		<div class="card">
			<div class="card-body">
				 <h5 class="card-title">${board.title}<span class="badge text-bg-danger">${board.viewCnt}</span></h5>
				 <div class="d-flex justify-content-between">
				 	<div class="card-subtitle">${board.writer}</div>
				 	<div class="card-subtitle">${board.regDate}</div>
				 </div>
    			 <p class="card-text">${board.content}</p>
    			 
    			 <div>
    			 	<a href="delete?id=${board.id}" class="btn btn-outline-danger">삭제</a>
    			 	<a href="updateform?id=${board.id}" class="btn btn-outline-success">수정</a>
    			 	<a href="list" class="btn btn-outline-primary">목록</a>
    			 </div>
			</div>
		</div>
		
	
	</div>
</body>
</html>