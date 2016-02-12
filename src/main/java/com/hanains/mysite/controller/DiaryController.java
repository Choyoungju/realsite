package com.hanains.mysite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanains.mysite.service.DiaryService;
import com.hanains.mysite.vo.DiaryVo;

@Controller
@RequestMapping("/diary")
public class DiaryController {


	@Autowired
	private DiaryService diaryService;

	@RequestMapping("")
	public String list(Model model){
		List<DiaryVo> list = diaryService.list();
		model.addAttribute("list",list);

		return "/diary/list";

	}

	@RequestMapping("/insert")
	public String insert(@ModelAttribute DiaryVo vo ){
		
		if(vo.getMessage().trim().length()==0||vo.getName().trim().length()==0 || vo.getPassword().trim().length()==0){
			return "redirect:/diary?result=fail";
		}
		
		diaryService.write(vo);
		return "redirect:/diary";
	}
	
	@RequestMapping("/delete")
	public String delete(@ModelAttribute DiaryVo vo){
		diaryService.delete(vo);
		
		return "redirect:/diary";
	}
	
	@RequestMapping("/deleteform")
	public String deleteform(){
		
		return "/diary/deleteform";
	}



}
