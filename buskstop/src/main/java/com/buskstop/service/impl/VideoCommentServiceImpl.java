package com.buskstop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buskstop.dao.VideoCommentDao;
import com.buskstop.service.VideoCommentService;
import com.buskstop.vo.VideoComment;

@Service
public class VideoCommentServiceImpl implements VideoCommentService{

	@Autowired
	private VideoCommentDao dao;
	
	@Override
	public void insertVideoComment(VideoComment videoComment) {
		dao.insertVideoComment(videoComment);
	}

	@Override
	public List<VideoComment> selectVideoCommentByVideoNo(int videoNo) {
		return dao.selectVideoCommentByVideoNo(videoNo);
	}

	@Override
	public int updateVideoCommentByVideoCommentNo(VideoComment videoComment) {
		return dao.updateVideoCommentByVideoCommentNo(videoComment);
	}

	@Override
	public int deleteVideoCommentByVideoCommentNo(int videoCommentNo) {
		return dao.deleteVideoCommentByVideoCommentNo(videoCommentNo);
	}

}
