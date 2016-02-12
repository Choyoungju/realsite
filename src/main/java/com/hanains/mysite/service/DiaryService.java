package com.hanains.mysite.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanains.mysite.dao.DiaryDao;
import com.hanains.mysite.dao.GuestBookDao;
import com.hanains.mysite.dao.UserDao;
import com.hanains.mysite.vo.DiaryVo;
import com.hanains.mysite.vo.GuestBookVo;
import com.hanains.mysite.vo.UserVo;

@Service
public class DiaryService {

	
	@Autowired
	private DiaryDao diaryDao;
	
	public void write( DiaryVo vo ) {
		diaryDao.insert( vo );
		
	}
	

	
	public void delete( DiaryVo vo ) {
		diaryDao.delete( vo );
		
	}
	
	public List<DiaryVo> list() {
		List<DiaryVo> list = diaryDao.getList();
		return list;
	}
	

}