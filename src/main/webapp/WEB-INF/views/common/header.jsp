<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div>
	<c:if test="${empty loginUser }"> 
		<a href="login" class="btn btn-outline-primary">login</a>
		<a href="signup" class="btn btn-outline-secondary">sign up</a>
	</c:if>
	<c:if test="${not empty loginUser }"> 
		${loginUser }님 환영합니다.
		<a href="logout" class="btn btn-outline-danger">logout</a>
		<c:if test="${'admin' eq loginUser }">
			<a href="users">관리자 페이지</a>
		</c:if>
	</c:if>
</div>