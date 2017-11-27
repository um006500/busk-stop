package com.buskstop.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.buskstop.dao.UserDao;
import com.buskstop.vo.User;


@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertUser(User user) {
		return session.insert(makeSqlId("insertUser"),user);
	}
	
	public User selectUserById(String id) {
		User user = session.selectOne(makeSqlId("selectUserById"), id);
		return session.selectOne(makeSqlId("selectUserById"), id);
	}
	
	private String makeSqlId(String id) {
		return "com.buskstop.config.mybatis.mapper.userMapper."+id;
	}
	
}
