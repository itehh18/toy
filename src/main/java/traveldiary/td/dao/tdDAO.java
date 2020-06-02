package traveldiary.td.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import traveldiary.common.common.CommandMap;
import traveldiary.common.dao.AbstractDAO;
import traveldiary.td.dto.DayDTO;
import traveldiary.td.dto.DayListViewDTO;
import traveldiary.td.dto.DiaryDTO;
import traveldiary.td.dto.MemberDTO;
import traveldiary.td.dto.ReplyDTO;

/**
 * Repository : DAO를 스프링에 인식시키기 위해서 주로 사용.
 * pom.xml의 <context:component-scan base-package="경로"></context:component-scan>
 * 이 경로 안에 달고있는 클래스가 있으면 인식해주고 객체로 만들어 준당
 * 이 DAO를 controller에서 Inject하고 사용이 가능
 *
 */
@Repository("tdDAO")
public class tdDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public DayListViewDTO selectDayList() throws Exception{
	//	return selectList(td.selectDayList);
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List selectMemberList()throws Exception {
		return selectList("td.selectMembetList");
	}

	
	@SuppressWarnings("unchecked")
	public List<DiaryDTO> selectmDiaryList(Map<String, Object> map) throws Exception{
		
		int pnum = Integer.parseInt((String)map.get("pnum"));
	//	int pnum = (Integer) map.get("pnum");
		
		if(pnum>0)
			map.put("pnum", (pnum-1)*9);
		else
			map.put("pnum",0);
		
		map.put("cnum", 9);
		
		return (List<DiaryDTO>)selectList("td.selectmDiaryList", map);
	}
	
	//일기쓰기 경우 select에 넣을 일기장 정보 가져오기
	@SuppressWarnings("unchecked")
	public List<DiaryDTO> selectmDiaryList(int mnum) throws Exception{
		return (List<DiaryDTO>)selectList("td.selectinfoDiaryList", mnum);
	}
	
	public MemberDTO doLogin(MemberDTO member) throws Exception{
		String mid = member.getMember_id();
		
		return (MemberDTO) selectOne("td.selectMember", mid);
	}
	
	public int selectmDLTotal(int mnum) throws Exception{
		return (Integer) selectOne("td.selectmDiaryLCount", mnum);
	}
	
	//전체 값을 가져올땐 매개변수없이
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getProgress() throws Exception{
		return selectList("td.selectProgress");
	}
	
	//개인 목록을 가져올 땐 매개변수로 mnum받기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getProgress(int mnum) throws Exception{
		return selectList("td.selectmProgress", mnum);
	}
	
	//특정 일기장을 가져올땐 매개변수로 map(mnum, dvol)받기
	public double getProgress(Map<String, Object> map) throws Exception{
		Double prog = 0.0;
		try{
			return (Double) selectOne("td.selectdProgress", map);
		} catch (NullPointerException e){
			return prog;
		}
//			throw new Exception("taDAO getProgress " + e.getMessage(), e);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<DayDTO> selectmDays(Map<String, Object> map){
		return (List<DayDTO>) selectList("td.selectmDays", map);
	}

	public int selectddTotal(Map<String, Object> map){
		return (Integer) selectOne("td.selectddCount", map);
	}
	
	//특정 일기장의 일기 목록에 쓰일 댓글 수 리스트 반환 map(mnum, dvol) 매개변수로 받기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getdRecount(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("td.selectdRecount", map);
		
	}
	
	public DayDTO getDay(int dnum) throws Exception{
		return (DayDTO) selectOne("td.selectDay", dnum);
	}
	
	public boolean insertDay(DayDTO day) throws Exception{

			int re = (Integer) insert("td.insertDay", day);
			
			if(re>0)
				return true;
			else
				return false;
	}
	
	public int selectindnum(DayDTO day) throws Exception{
		return (Integer) selectOne("td.selectindnum", day);
	}
	
	public void plusHits(int dnum) throws Exception{
		update("td.plusHits", dnum);
	}
	
	public int getDiaryTotalCount() throws Exception{
		return (Integer) selectOne("td.getDiaryTotalCount");
	}
	
	@SuppressWarnings("unchecked")
	public List<DiaryDTO> selectDiaryList(Map<String, Object> map) throws Exception{
		
		int pnum = Integer.parseInt((String)map.get("pnum"));
		
		if(pnum>0)
			map.put("pnum", (pnum-1)*9);
		else
			map.put("pnum",0);
		
		map.put("cnum", 9);
		
		return (List<DiaryDTO>)selectList("td.selectDiaryList", map);
	}
	
	public DiaryDTO getDiaryInfo(Map<String, Object> map){
		return (DiaryDTO) selectOne("td.selectDiaryInfo", map);
	}
	
	public String getLocation(String l_code){
		return (String) selectOne("td.selectLocation", l_code);
	}
	
	@SuppressWarnings("unchecked")
	public List<DayDTO> getDayList(Map<String, Object> map) throws Exception {
		int pnum = Integer.parseInt((String)map.get("pnum"));
		
		if(pnum>0)
			map.put("pnum", (pnum-1)*20);
		else
			map.put("pnum",0);
		
		map.put("cnum", 20);
		return (List<DayDTO>) selectList("td.selectDayList", map);
	}
	
	public int getDayTotal() throws Exception{
		return (Integer) selectOne("td.selectDayCount");
	}
	
	//특정 일기장의 일기 목록에 쓰일 댓글 수 리스트 반환 map(mnum, dvol) 매개변수로 받기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getReCount() throws Exception{
		return (List<Map<String, Object>>) selectList("td.selectReCount");
	}
	
	//특정 일기의 댓글 총 갯수 가져오기
	public int getReCount(int dnum) throws Exception{
		return (Integer) selectOne("td.selectOneReCount");
	}
	
	public int modifyDiary(Map<String, Object> map) throws Exception{
		try{
			update("td.updateDiary", map);
			return 1;
		}catch(Exception e){
			e.getMessage();
			return -1;
		}
	}
	
	public int writeDiary(CommandMap commandMap) throws Exception{
		try{
			insert("td.insertDiary", commandMap);
			return 1;
		}catch(Exception e){
			e.getMessage();
			return -1;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<ReplyDTO> getReplyList(Map<String, Object> map) throws Exception{
		return (List<ReplyDTO>) selectList("td.selectReplyList", map);
	}
}
