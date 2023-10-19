package com.ssafy.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.board.model.dao.UserDao;
import com.ssafy.board.model.dto.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public List<User> getUserList() {
		
		return userDao.selectAll();
	}
	
	@Override
	public void signup(User user) {
		userDao.insertUser(user);
	}

	@Override
	public User login(User user) {
		//DB 해당 ID만 넘겨서 데이터 가지고 오고 가지고 온 User 데이터와 내가 현재 가진 user의 비밀번호 비교
		User tmp = userDao.selectOne(user.getId());
		
		if(tmp != null && tmp.getPassword().equals(user.getPassword()))
			return tmp;
		
		return null;
	}
}
