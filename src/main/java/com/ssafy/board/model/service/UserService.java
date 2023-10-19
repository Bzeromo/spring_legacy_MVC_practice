package com.ssafy.board.model.service;

import java.util.List;

import com.ssafy.board.model.dto.User;

public interface UserService {
	List<User> getUserList();

	void signup(User user);

	User login(User user);
}
