package com.hanains.mysite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StopWatch;

import com.hanains.mysite.vo.DiaryVo;
import com.hanains.mysite.vo.GuestBookVo;


@Repository
public class DiaryDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public List<DiaryVo> getList() {
		
		String taskName= "DiaryDao.getList()";
		StopWatch stopWatch = new StopWatch();
		stopWatch.start(taskName);
		
		List<DiaryVo> list = sqlSession.selectList( "diary.select" );
		
		stopWatch.stop();
		System.out.println("Excution time : " + taskName + " " + stopWatch.getTotalTimeMillis());
		return list;
	}
	
	public void insert(DiaryVo vo){
		
		sqlSession.insert("diary.insert",vo);
	}
	
	
	
	public void delete(DiaryVo vo){
		sqlSession.delete("diary.delete", vo);
	}
}