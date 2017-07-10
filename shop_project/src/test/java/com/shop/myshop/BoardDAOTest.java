package com.shop.myshop;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Inject
	private BoardDAO dao;
	
	@Test
	public void testCreate() throws Exception{
		BoardVO board = new BoardVO();
		board.setTitle("���ο� ��");
		board.setContent("��.��.��.��");
		board.setWriter("��ȫ��");
		dao.create(board);
	}
	
	@Test
	public void testRead() throws Exception{
		logger.info(dao.read(3).toString());
	}
	
	@Test
	public void testUpdate() throws Exception{
		BoardVO board = new BoardVO();
		board.setBno(1);
		board.setTitle("������ ���Դϴ�");
		board.setContent("���� �׽�Ʈ");
		dao.update(board);
	}
	
	@Test
	public void testDelete() throws Exception{
		dao.delete(1);
	}
//	@Test
//	public void testListPage() throws Exception{
//		int page =3;
//		List<BoardVO> list = dao.listPage(page);
//		for(BoardVO boardVO : list){
////			logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
//		}
//	}
	@Test
	public void testListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<BoardVO> list = dao.listCriteria(cri);
		
		for(BoardVO boardVO : list){
			logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
		}
	}
	@Test
	public void testURI() throws Exception{
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.path("/board/read")
				.queryParam("bno", 12)
				.queryParam("perPageNum",  20)
				.build();
		
		logger.info("/board/read?bno=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}
	@Test
	public void testURI2() throws Exception{
		UriComponents uriComponents =
				UriComponentsBuilder
				.newInstance()
				.path("/{module}/{page}")
				.queryParam("bno",  12)
				.queryParam("perPageNum",  20)
				.build().expand("board","read")
				.encode();
		logger.info("/board/read?bno=12&perPageNum=20");
		logger.info(uriComponents.toString());		
		
	}
	@Test
	public void testdynamic1() throws Exception{
		SearchCriteria cri=new SearchCriteria();
		cri.setPage(1);;
		cri.setKeyword("1");
		cri.setSearchType("tcw");
		
		System.out.println("========");
		
		List<BoardVO> list = dao.listSearch(cri);
		for(BoardVO boardVO : list){
			logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
			
			logger.info("===============");
		}
	}
}
