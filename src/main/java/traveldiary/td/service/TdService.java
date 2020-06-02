package traveldiary.td.service;


import java.util.List;
import java.util.Map;

import traveldiary.common.common.CommandMap;
import traveldiary.td.dto.DayDTO;
import traveldiary.td.dto.DayListViewDTO;
import traveldiary.td.dto.DiaryDTO;
import traveldiary.td.dto.MemberDTO;
import traveldiary.td.dto.testDTO;

public interface TdService {
	
//	List<MemberDTO> selectMemberList() throws Exception;
	
	testDTO testService() throws Exception;

	Map<String, Object> getmDiaryList(Map<String, Object> map) throws Exception;
	//다이어리 작성 시 select 항목에 쓰일 멤버 일기장 목록 가져오기
	List<DiaryDTO> getmDiaryList(int mnum) throws Exception;
	
	Map<String, Object> doLogin(MemberDTO member) throws Exception;
	
	Map<String, Object> getDiaryDays(Map<String, Object> map) throws Exception;
	
	Map<String, Object> getDayDetail(int dnum, int unum) throws Exception;
	
	int writeDay(DayDTO day) throws Exception;
	
	Map<String, Object> getDiaryList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> getDiaryInfo(int mnum, int dvol) throws Exception; 
	
	Map<String, Object> getDayList(Map<String, Object> map) throws Exception;
	
	int modifyDiary(Map<String, Object> map) throws Exception;
	
	Map<String, Object> getReplyList(Map<String, Object> map) throws Exception;
	
	
}
