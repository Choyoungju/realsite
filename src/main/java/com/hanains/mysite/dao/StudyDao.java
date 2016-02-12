package com.hanains.mysite.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StopWatch;

import com.hanains.mysite.vo.StudyVo;




@Repository
public class StudyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void update( StudyVo vo ) {
		sqlSession.update( "study.update", vo );
	}
	
	public List<StudyVo> getList( String searchKeyword, Long page, Integer pageSize ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "searchKeyword", searchKeyword );
		map.put( "page", page );
		map.put( "pageSize", pageSize );
		
		List<StudyVo> list = sqlSession.selectList( "study.selectList", map );
		
		return list;
	}

	public Long getCount( String searchKeyword ) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "searchKeyword", searchKeyword );
		
		Long count = sqlSession.selectOne( "study.selectCount", map );
		
		
		
		return count;
	}	
	
	public void insert( StudyVo vo ) {
		Long groupNo = vo.getGroupNo();
		if( groupNo != null ) { // 답글인 경우
			sqlSession.update( "study.updateOrderNo", vo.getOrderNo() );
		}
		
		sqlSession.insert( "study.insert", vo );
	}
	
	public void delete( Long no, Long memberNo ) {
		Map<String, Long> map = new HashMap<String, Long>();
		map.put( "no", no );
		map.put( "memberNo", memberNo );
		
		sqlSession.delete( "study.delete", map );
	}
	
	public void updateViewCount( Long no ) {
		sqlSession.update( "study.updateViewCount", no );
	}
	
	public StudyVo get( Long no ) {
		StudyVo vo = sqlSession.selectOne( "study.selectByNo", no );
		return vo;
	}
}
