package com.ssafy.board.model.dao;

import java.util.List;

import com.ssafy.board.model.dto.User;

public interface UserDao {
	List<User> selectAll();

	void insertUser(User user);

	User selectOne(String id);
}
