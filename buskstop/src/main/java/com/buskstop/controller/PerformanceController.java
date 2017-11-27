package com.buskstop.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.buskstop.service.PerformanceService;
import com.buskstop.vo.Performance;

@Controller
public class PerformanceController {
	
	@Autowired
	private PerformanceService service;
	
	@RequestMapping("/performanceRegister")
	public ModelAndView insertPerformance(@ModelAttribute Performance performance, HttpServletRequest request) {
		
		
		
		service.insertPerformance(performance);
		return new ModelAndView("redirect:/peformance_success.do","performance", performance.getPerformanceNo());
	}
	
	@RequestMapping("/performance_success")
	public ModelAndView performanceSeccess(@RequestParam String performance) {
		String massege = "성공";
		return new ModelAndView("performance/performance.tiles", "success", massege);
	}
}
