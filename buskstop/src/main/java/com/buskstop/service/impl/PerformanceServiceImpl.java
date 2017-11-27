package com.buskstop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.buskstop.dao.PerformanceDao;
import com.buskstop.service.PerformanceService;
import com.buskstop.vo.Performance;

@Service
public class PerformanceServiceImpl implements PerformanceService {
	
	@Autowired
	private PerformanceDao dao;
	
	// 공연정보 등록
	@Override
	@Transactional
	public void insertPerformance(Performance performance) {
		//Performance 테이블 insert
		dao.insertPerformance(performance);
	}
}
