package com.buskstop.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.buskstop.service.StageService;
import com.buskstop.vo.Stage;
import com.buskstop.vo.StageImage;

@Controller
public class StageController {

	@Autowired
	private StageService service;
	
	
	@RequestMapping("/stageReservation")
	public ModelAndView selectStage(@ModelAttribute Stage stage) {
		
		return new ModelAndView("stageView.do","stage",stage);
	}
	//공연장 등록
	@RequestMapping("/stageRegister")
	public ModelAndView insertStage(@ModelAttribute Stage stage, MultipartHttpServletRequest mhsq, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(stage);
		new SimpleDateFormat("hh:mm:ss").format(stage.getStageStartTime());
		new SimpleDateFormat("hh:mm:ss").format(stage.getStageEndTime());
		service.insertStage(stage);
		//파일 경로
		String dir = request.getServletContext().getRealPath("/stageImage");
		
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = mhsq.getFiles("imgs");
		if(mf.size()==1 && mf.get(0).getOriginalFilename().equals("")) {
		}else {	for(int i=0; i< mf.size(); i++) {
				//파일 중복명 처리, 저장되는 파일 이름
				String fileName = UUID.randomUUID().toString();
				//파일 저장
				File upImage = new File(dir, fileName+".jpg");
				mf.get(i).transferTo(upImage);
				StageImage uploadImage = new StageImage(0, fileName, stage.getStageNo());
				service.insertStageImage(uploadImage);
			}
		}

		return new ModelAndView("stage/selectAllStage.tiles");
	}
	
	@RequestMapping("/selectAllStage")
	public ModelAndView selectAllStage(@RequestParam(required=false) String locationSearch, @RequestParam(required=false) String instrumentSearch, @RequestParam(required=false) Date startDate, @RequestParam(required=false) Date endDate) throws Exception{
		System.out.println("컨트롤러"+startDate+endDate);
		List<Stage> list = null;
		Map<String, Object> map = null;
		int page=1;
		System.out.println(locationSearch+instrumentSearch);
		/*
		if(locationSearch==null && instrumentSearch==null) {
			map = service.selectStageByStageLocation(page,locationSearch,startDate,endDate);
		} else if(locationSearch==null && instrumentSearch!=null) {
			map = service.selectStageByInstrument(page,instrumentSearch,startDate,endDate);
		} else if(locationSearch!=null && instrumentSearch==null) {
			map = service.selectStageByStageDate(page,startDate,endDate);
		}
		*/
		map = service.selectAllStage(page);
		
		list = (List<Stage>)map.get("list");
		
		map.put("list", list);
		
//		map.put("stageLocation", locationSearch);
//		map.put("instruemtn", instrumentSearch);
//		map.put("startDate", startDate);
//		map.put("endDate", endDate);
		
		return new ModelAndView("stageView.do","map",map);
		
	}
	
	// 공연장 정보 공연장 수정에 빼와서 뿌려주기
	@RequestMapping("/updateStage")
	public ModelAndView updateStageByStageNo(@RequestParam int stageNo) {
		Stage stage = null;
		
		stage = service.selectStageByStageNo(stageNo);
		List<StageImage> stageImage = service.selectStageImageByStageNo(stageNo);
		stage.setStageImage(stageImage);
		return new ModelAndView("/stageUpdateView.do", "stage", stage);
		
	}
	
	//공연정보 받아서 수정
	@RequestMapping("/updateStageChange")
	public ModelAndView updateStageChange(@ModelAttribute Stage stage, MultipartHttpServletRequest mhsq, HttpServletRequest request) throws IllegalStateException, IOException {
		//공연장 변경
		service.updateStage(stage);
		//기존에 공연장 번호를 가진 공연장사진 제거
		int stageNo = stage.getStageNo();
		service.deleteStageImageByStageNo(stageNo);
		//업데이트된 공연장 사진 업로드
		
		//파일 경로
		String dir = request.getServletContext().getRealPath("/stageImage");
		
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = mhsq.getFiles("imgs");
		if(mf.size()==1 && mf.get(0).getOriginalFilename().equals("")) {
		}else {
			for(int i=0; i< mf.size(); i++) {
				//파일 중복명 처리, 저장되는 파일 이름
				String fileName = UUID.randomUUID().toString();
				
				//파일 저장
				File upImage = new File(dir, fileName+".jpg");
				mf.get(i).transferTo(upImage);
				
				StageImage uploadImage = new StageImage(0, fileName, stage.getStageNo());
				
				service.insertStageImage(uploadImage);
			}
		}
		return new ModelAndView("redirect:/stageView.do");
	}
	
	public ModelAndView deleteStage(@RequestParam int stageNo) {
		service.deleteStageByStageNo(stageNo);
		
		String msg = null;
		
		if(service.selectStageByStageNo(stageNo) == null) {
			msg = "삭제가 완료되었습니다.";
		}else {
			msg = "삭제가 실패되었습니다.";
		}
		return new ModelAndView("/stageView.do", "msg", msg);
	}
}
