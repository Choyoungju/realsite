package com.hanains.mysite.controller;

import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.Map;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hanains.mysite.annotation.Auth;
import com.hanains.mysite.annotation.AuthUser;
import com.hanains.mysite.service.StudyService;

import com.hanains.mysite.vo.StudyVo;
import com.hanains.mysite.vo.UserVo;


@Controller
@RequestMapping( "/study" )
public class StudyController {
	@Autowired
	private StudyService studyService;
	
	private static final Log LOG = LogFactory.getLog( StudyController.class );
	private static final String SAVE_PATH = "/temp/";
	
	
	
	// 리스트 요청
	@RequestMapping( "" )
	public String list( 
		@RequestParam( value="kw", required = true, defaultValue = "" ) String searchKeyword,
		@RequestParam( value="p", required = true, defaultValue = "1" ) Long page,
		Model model ) {
		
		Map<String, Object> map = studyService.listStudy( searchKeyword, page );
		model.addAttribute( "listData", map );
		LOG.warn( "######### 리스트" );
		
	
		
		return "/study/list";
	}
	
	// 글쓰기 폼 요청
	@Auth
	@RequestMapping( "/write" )
	public String write() {
		
		LOG.warn( "######### 입력" );
		// 로그인 사용자 체크
		return "/study/write";
	}
	
	// 답글달기 폼 요청
	@Auth	
	@RequestMapping( "/reply/{no}" )
	public String reply( @PathVariable( "no" ) Long no, Model model ) {
		StudyVo vo = studyService.viewStudy( no );
		model.addAttribute( "vo", vo );
		LOG.warn( "######### 답글" );
		return "/study/write";
	}
	
	
	// 글(새글/답글) 등록 요청
	@Auth	
	@RequestMapping( "/insert" )
	public String insert( @AuthUser UserVo authUser, @ModelAttribute StudyVo vo ) {
		
		System.out.println( authUser );
		vo.setMemberNo( authUser.getNo() );
		studyService.writeStudy( vo );
		
		if(vo.getContent().trim().length()==0 ||vo.getTitle().trim().length()==0) {
			return "redirect:/study/insert?result=fail";
		}
		LOG.warn( "######### 삽입" );
		return "redirect:/study/upload";
	}
	
	// 글(새글/답글) 수정폼 요청
	@Auth
	@RequestMapping( "/modify/{no}" )
	public String modify( @PathVariable( "no" ) Long no, Model model ) {
		StudyVo vo = studyService.viewStudy( no );
		model.addAttribute( "vo", vo );
		LOG.warn( "######### 수정" );
		return "/study/modify";
	}
	
	// 글(새글/답글) 수정 요청
	@Auth
	@RequestMapping( "/update" )
	public String update( @AuthUser UserVo authUser, @ModelAttribute StudyVo vo ) {
		vo.setMemberNo( authUser.getNo() );
		studyService.updateStudy( vo );
		LOG.warn( "######### 업데이트" );
		return "redirect:/study";
	}
	
	// 글(새글/답글) 삭제 요청
	@Auth
	@RequestMapping( "/delete/{no}" )
	public String delete( @AuthUser UserVo authUser, @PathVariable( "no" ) Long no ) {
		studyService.deleteStudy( no, authUser.getNo() );
		LOG.warn( "######### 삭제" );
		return "redirect:/study";
	}	
	
	// 글(새글/답글) 보기 요청
	@RequestMapping( "/view/{no}" )
	public String view( @PathVariable( "no" ) Long no, Model model ) {
		StudyVo vo = studyService.viewStudy( no );
		model.addAttribute( "vo", vo );
		LOG.warn( "######### 글 읽기" );
		return "/study/view";
	}
	
	
	
	
	@RequestMapping( "/upload" )
	public String upload(  @RequestParam( "uploadFile" ) MultipartFile multipartFile, Model model, @ModelAttribute StudyVo vo) {
        

		System.out.println("업로드 리퀘스트 매핑은 불러오는데 파일 빔");
		if(vo.getContent().trim().length()==0 ||vo.getTitle().trim().length()==0) {
			return "redirect:/study/write?result=fail";
		}
		
		// 파일 처리
		if( multipartFile.isEmpty() == false ) {
			
	        String fileOriginalName = multipartFile.getOriginalFilename();
	        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
	        String fileName = multipartFile.getName();
	        Long size = multipartFile.getSize();
	        
	        String saveFileName = genSaveFileName( extName );
	
	        LOG.debug( " ######## fileOriginalName : " + fileOriginalName );
	        LOG.debug( " ######## fileName : " + fileName );
	        LOG.debug( " ######## fileSize : " + size );
	        LOG.debug( " ######## fileExtensionName : " + extName );
	        LOG.debug( " ######## saveFileName : " + saveFileName );        
	
	        writeFile( multipartFile, SAVE_PATH, saveFileName );
	        
	        String url = "/profile-images/" + saveFileName;
	        model.addAttribute( "profileUrl", url );
	        
	        System.out.println("업로드 리퀘스트 매핑");
	       vo.setFilename(url);
		}else{
			vo.setFilename("");
		}
		
		studyService.writeStudy(vo);
		LOG.warn( "######### 파일 업로드 관련" );
        return "redirect:/study/";
	}
	
	private void writeFile( MultipartFile file, String path, String fileName ) {
		FileOutputStream fos = null;
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream( path + fileName );
			fos.write(fileData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		}
	}
	
	private String genSaveFileName( String extName ) {
		
        Calendar calendar = Calendar.getInstance();
		String fileName = "";
        
        fileName += calendar.get( Calendar.YEAR );
        fileName += calendar.get( Calendar.MONTH );
        fileName += calendar.get( Calendar.DATE );
        fileName += calendar.get( Calendar.HOUR );
        fileName += calendar.get( Calendar.MINUTE );
        fileName += calendar.get( Calendar.SECOND );
        fileName += calendar.get( Calendar.MILLISECOND );
        fileName += ( "." + extName );
        
        return fileName;
	}
	
}