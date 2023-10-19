<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="../common/bootstrap.jsp" %>
</head>
<body>
	<div class="container">
		<h2>로그인</h2>
		<form action="login" method="POST">
			<div class="mb-3">
				<label for="id" class="form-label">ID</label>
				<input type="text" class="form-control" id="id" name="id">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">PW</label>
				<input type="password" class="form-control" id="password" name="password">
			</div>
			<button class="btn btn-primary">로그인</button>
		</form>
	</div>
</body>
</html>