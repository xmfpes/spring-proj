package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface HelpDAO {
	void create(BoardVO vo) throws Exception;
	BoardVO read(Integer bno) throws Exception;
	void update(BoardVO vo) throws Exception;
	void delete(Integer bno) throws Exception;
	List<BoardVO> listCriteria(Criteria cri) throws Exception;
	int countPaging(Criteria cri) throws Exception;
	List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	int listSearchCount(SearchCriteria cri) throws Exception;
	void updateViewCnt(Integer bno) throws Exception;
	public void updateReplyCnt(Integer bno, int amount) throws Exception;
	public void addAttach(String fullName) throws Exception;
	public void deleteAttach(Integer bno) throws Exception;
	public void replaceAttach(String fullName, Integer bno) throws Exception;
	public List<String> getAttach(Integer bno) throws Exception;
}
