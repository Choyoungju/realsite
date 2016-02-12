package com.hanains.mysite.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanains.mysite.dao.StudyDao;
import com.hanains.mysite.dao.StudyDao;
import com.hanains.mysite.vo.BoardVo;
import com.hanains.mysite.vo.StudyVo;


@Service
public class StudyService {
	private final int LIST_PAGESIZE = 5;
	private final int LIST_BLOCKSIZE = 5;
	
	@Autowired
	private StudyDao studyDao;
	
	public Map<String, Object> listStudy( String searchKeyword, Long page ){

		//1. calculate pager's basic data 
		long totalCount = studyDao.getCount( searchKeyword );
		long pageCount = (long)Math.ceil( (double)totalCount / LIST_PAGESIZE );
		long blockCount = (long)Math.ceil( (double)pageCount / LIST_BLOCKSIZE );
		long currentBlock = (long)Math.ceil( (double)page / LIST_BLOCKSIZE ); 
		
		//2. page validation
		if( page < 1 ) {
			page = 1L;
			currentBlock = 1;
		} else if( page > pageCount ) {
			page = pageCount;
			currentBlock = (int)Math.ceil( (double)page / LIST_BLOCKSIZE );
		}
		
		//3. calculate pager's data
		long startPage = (currentBlock == 0 ) ? 1 : ( currentBlock - 1 ) * LIST_BLOCKSIZE + 1;
		long endPage = ( startPage - 1 ) + LIST_BLOCKSIZE;
		long prevPage = ( currentBlock > 1 ) ? ( currentBlock - 1 ) * LIST_BLOCKSIZE : 0;
		long nextPage = ( currentBlock < blockCount ) ? currentBlock * LIST_BLOCKSIZE + 1 : 0;

		//4. fetch list
		List<StudyVo> list = studyDao.getList( searchKeyword, page, LIST_PAGESIZE );
		
		//5. pack all information of list
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "list", list );
		map.put( "searchKeyword", searchKeyword );
		map.put( "firstItemIndex", totalCount - ( page - 1 ) * LIST_PAGESIZE );
		map.put( "currentPage", page );
		map.put( "startPage", startPage );
		map.put( "endPage", endPage );
		map.put( "pageCount", pageCount );
		map.put( "prevPage", prevPage );
		map.put( "nextPage", nextPage );
		
		return map;
	}
	
	public void writeStudy( StudyVo vo ){
		studyDao.insert( vo );
	}
	
	public void updateStudy( StudyVo vo ){
		studyDao.update( vo );
	}	

	public void deleteStudy( Long no, Long memberNo ){
		studyDao.delete( no, memberNo );
	}	

	public StudyVo viewStudy( Long no ){
		StudyVo vo = studyDao.get( no );
		studyDao.updateViewCount( no );
		return vo;
	}
}
