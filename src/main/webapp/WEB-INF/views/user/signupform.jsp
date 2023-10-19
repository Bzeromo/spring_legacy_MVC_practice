<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="../common/bootstrap.jsp" %>
</head>
<body>
	<div class="container">
		<h2>회원가입</h2>
		<form action="signup" method="POST">
			<div class="mb-3">
				<label for="id" class="form-label">ID</label>
				<input type="text" class="form-control" id="id" name="id">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">PW</label>
				<input type="password" class="form-control" id="password" name="password">
			</div>
			<div class="mb-3">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" id="name" name="name">
			</div>
			<div class="mb-3">
				<label for="curriculum" class="form-label">트랙</label>
				<select name="curriculumCode" class="form-select" id="curriculum">
					<option value="100">Python</option>
					<option value="200">Java</option>
					<option value="300">Embedded</option>
					<option value="400">Mobile</option>
				</select>
			</div>
			<button class="btn btn-primary">회원가입</button>
		</form>
	
	</div>
</body>
</html>