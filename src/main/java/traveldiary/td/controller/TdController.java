package traveldiary.td.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import traveldiary.common.common.CommandMap;
import traveldiary.td.dto.DayDTO;
import traveldiary.td.dto.DiaryDTO;
import traveldiary.td.dto.MemberDTO;
import traveldiary.td.dto.ReplyDTO;
import traveldiary.td.dto.testDTO;
import traveldiary.td.service.TdService;


@Controller
public class TdController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="tdService")
	private TdService tdService;
	
	
	/*
	@RequestMapping(value="/td/memberList.do")
	public ModelAndView openMemberList() throws Exception{
		ModelAndView mv = new ModelAndView("/td/memberList");
		
		List<MemberDTO> mlist = tdService.selectMemberList();
		
		mv.addObject("memberList", mlist);
	}
	*/
	
	/*
	 *@RequestMapping Annotation 적용 메소드틑 커맨드 클래스와 웹 앱 관련 파라미터 사용가능 
	 * 
	 * 
	 */
	
	//@RequestParam Annotation : HTTP 요청 파라미터를 메소드의 파라미터로 전달받음
	//value=파라미터이름(String) , required=해당 파라미터 필수여부(boolean, true)
	
	//에러가..나야하는데...???
	@RequestMapping(value="/td/testConn.do")
	public ModelAndView openTestPage(@RequestParam(value="textJsp", required=true)String jspText) throws Exception{
		ModelAndView mv = new ModelAndView("/td/testConn");
		
		testDTO testDto = new testDTO();
		
		testDto = tdService.testService();
		testDto.setJsp(jspText);
		testDto.setController("cont");
		
		mv.addObject("test", testDto);
		
		return mv;
	}
	
	@RequestMapping(value="/td/main.do")
	public ModelAndView openMainPage(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/main");
	
		MemberDTO userInfo = null;
		List<DiaryDTO> mdiary = null;
		
		//어떻게 가져오지? 인터셉터에서 컨트롤러로 값을 전달해 줄 수 있나? 일단은 세션에서 바로
		HttpSession session = request.getSession(false);
		String status = session.getAttribute("status").toString();
		
		//로그인 된 경우와 그렇지 않은 경우 고려하기 나중에...
		//정보가 빈 상태라면
		if(status.equals("logout")){
			//손님 계정이니 다이어리 목록은 없닷
			mv.addObject("identify", "guest");
		} else {
			userInfo = (MemberDTO) session.getAttribute("userInfo");
			
			//로그인된 상태, 개인 일기장 목록 가져오기
		//	mdiary = tdService.getmDiaryList(Integer.parseInt(userNum));
			mv.addObject("identify", "member");
		}
		
		mv.addObject("userInfo", userInfo);
		mv.addObject("diaryList", mdiary);
		
		return mv;
	}
	
	
	//common으로 옮겨야 할 것 같은뎅
	@RequestMapping(value="/td/login.do")
	public ModelAndView openLoginPage(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/login");
		

		return mv;
	}
	
	//세션값에 로그인한 사용자 번호값만 등록해놓음. 나중에 필요하다면 변경할 것
	@RequestMapping(value="/td/logincheck.do")
	public ModelAndView doLogin(HttpServletRequest request , MemberDTO member) throws Exception{
		
		
		String resultURL = null;
		Map<String, Object> resultMap = tdService.doLogin(member);	
		MemberDTO m = (MemberDTO)resultMap.get("member");
		
		//로그인 성공시
		if(resultMap.get("result").equals("1001")){
			HttpSession session = request.getSession(true);
			session.setAttribute("status", "login");
			session.setAttribute("userInfo", m);
			resultURL = "redirect:/";
		} else {
			resultURL = "redirect:/td/login.do";
		}
		
		ModelAndView mv = new ModelAndView(resultURL);
		mv.addObject("loginRe",resultMap);
		
		return mv;
	}
	
	//세션해지코드의 위치...? 굳이 service단까지 들어가야할까?
	//세션을 아예 삭제하지말고 userNum값을 0으로 바꾸기 이렇게 써도 되는건가 나중에 찾아볼것
	@RequestMapping(value="/td/logout.do")
	public ModelAndView doLogout(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/main");
		
		HttpSession session = request.getSession(false);
		MemberDTO userInfo = null;
		
		session.setAttribute("userInfo", userInfo);
		session.setAttribute("status", "logout");
		//tdService.doLogout(userNum);
		
		mv.addObject("identify", "guest");
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/td/mydiary.do")
	public ModelAndView openMydiaryPage(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/mydiary");
		
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		if(status.equals("logout")){
			mv.addObject("identify", "guest");
		} else {
			mv.addObject("identify", "member");
		}
		
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/td/mydiaryList.do")
	public ModelAndView selectMydiary(HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<DiaryDTO> mdiary = null;
		Map<String, Object> resultmap = new HashMap<String, Object>();
		int total = 0;
		
		//어떻게 가져오지? 인터셉터에서 컨트롤러로 값을 전달해 줄 수 있나? 일단은 세션에서 바로
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		//로그인 된 경우와 그렇지 않은 경우 고려하기 나중에...
		if(status.equals("logout")){
			//손님 계정이니 다이어리 목록은 없닷
		} else {
			//로그인된 상태, 개인 일기장 목록 가져오기
			MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
			mv.addObject("userInfo", userInfo);
			//diary dto
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mnum", userInfo.getMember_num());
			map.put("pnum", commandMap.getMap().get("pagenum"));
			resultmap = (Map<String, Object>) tdService.getmDiaryList(map);
			mdiary = (List<DiaryDTO>) resultmap.get("diaryList");

			//total count
			total = (Integer) resultmap.get("total");
		}
		
				
		mv.addObject("total", total);
		mv.addObject("progress", (List<Map<String, Object>>) resultmap.get("prog"));
		mv.addObject("diaryList", mdiary);
		
		
		return mv;
	}
	
	@RequestMapping(value="/td/diarydays.do")
	public ModelAndView opendiarydays(HttpServletRequest request ,
										@RequestParam(value="mnum", required=true)int mnum,
										@RequestParam(value="dvol", required=true)int dvol) throws Exception{
		ModelAndView mv = new ModelAndView("/td/diarydays");
		
		HttpSession session = request.getSession(false);
		String status = session.getAttribute("status").toString();
		MemberDTO userInfo = null;
		
		//이걸 왜 한거지
		request.setAttribute("mnum", mnum);
		request.setAttribute("dvol", dvol);
		
		//로그인 상태 구분해서 열람 수정하기
		if(status.equals("logout")){
			mv.addObject("identify", "guest");
		}else{
			//멤버면 userinfo 가져오기
			userInfo = (MemberDTO)session.getAttribute("userInfo");
			
			mv.addObject("identify", "member");
		}
		
		Map<String, Object> resultmap = new HashMap<String, Object>();
		resultmap = tdService.getDiaryInfo(mnum, dvol);
		
		mv.addObject("diaryInfo", resultmap.get("diaryInfo"));
		mv.addObject("location", resultmap.get("location"));
		mv.addObject("userInfo",userInfo);
		mv.addObject(mnum);
		mv.addObject(dvol);
		
		return mv;
	}
	

	@RequestMapping(value="/td/diarydaylist.do")
	public ModelAndView getdiarydaylist(HttpServletRequest request, int mnum, int dvol) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultmap = new HashMap<String, Object>();
		
		//이걸 또 할 필요가 있나?
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		//로그인 된 경우와 그렇지 않은 경우 고려하기 나중에...
	//	if(status.equals("logout")){
			//손님 계정이니 다이어리 목록은 없닷
	//	} else {
			//로그인된 상태, 개인 일기장 목록 가져오기
			MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
			mv.addObject("userInfo", userInfo);
			
			//day dto
			Map<String, Object> map = new HashMap<String, Object>();
		//	map.put("mnum", Integer.parseInt(request.getParameter("mnum")));
		//	map.put("dvol", Integer.parseInt(request.getParameter("dvol")));
			map.put("mnum",  mnum);
			map.put("dvol",  dvol);
			resultmap = (Map<String, Object>) tdService.getDiaryDays(map);
			
			mv.addObject("progress", resultmap.get("prog"));

			mv.addObject("dayList",resultmap.get("dayList"));
			mv.addObject("total", resultmap.get("total"));
			mv.addObject("replyCount", resultmap.get("reCount"));
			
	//	}
		
		return mv;
	}
	
	@RequestMapping(value="/td/openDayDetail.do")
	public ModelAndView openDayDetail(HttpServletRequest request,
										@RequestParam(value="dnum", required=true)int dnum) throws Exception{
		ModelAndView mv = new ModelAndView("/td/daydetail");
		
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		MemberDTO userInfo = new MemberDTO();
		
		if(status.equals("login")){
			userInfo = (MemberDTO) session.getAttribute("userInfo");
			mv.addObject("userInfo", userInfo);
		}
		
		DayDTO day = (DayDTO) tdService.getDayDetail(dnum, userInfo.getMember_num()).get("day");
		mv.addObject("day", day);
		
		return mv;
	}
	
	@RequestMapping(value="/td/openWriteDay.do")
	public ModelAndView openWriteDay(HttpServletRequest request,
										@RequestParam(value="dvol", required=true)int dvol) throws Exception{
		ModelAndView mv = new ModelAndView("/td/writeday");
		
		mv.addObject("dvol", dvol);
		
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		MemberDTO userInfo = new MemberDTO();
		
		if(status.equals("login")){
			userInfo = (MemberDTO) session.getAttribute("userInfo");
			mv.addObject("userInfo", userInfo);
		}
		//select에 사용할 일기장 정보 가져오기
		mv.addObject("diaryList", tdService.getmDiaryList(userInfo.getMember_num()));
		
		return mv;
	}
	
	//시간 경과에 의핸 세션 해제는 나중에 수정하기
	@RequestMapping(value="/td/writeDay.do")
	public ModelAndView writeDay(HttpServletRequest request, DayDTO day){
		ModelAndView mv = new ModelAndView("/td/daydetail");
		
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		
		try {
			int dnum = tdService.writeDay(day);
			
			//insert가 성공하면 내용 불러와서 상세화면으로 보내기
			if(dnum>0)
				mv.addObject("day", (DayDTO)tdService.getDayDetail(dnum, userInfo.getMember_num()).get("day"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("failFlag", "fail");
		
		return mv;
	}
	
	@RequestMapping(value="/td/diarylist.do")
	public ModelAndView openDiarylistPage(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/diarylist");
		
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		if(status.equals("logout")){
			mv.addObject("identify", "guest");
		} else {
			mv.addObject("identify", "member");
		}
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/td/getdiarylist.do")
	public ModelAndView getDiaryList(HttpServletRequest request, String identify, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<DiaryDTO> diary = null;
		Map<String, Object> resultmap = new HashMap<String, Object>();
		int total = 0;
		
		//diary dto
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pnum", commandMap.getMap().get("pagenum"));
		resultmap = (Map<String, Object>) tdService.getDiaryList(map);
		diary = (List<DiaryDTO>) resultmap.get("diaryList");

		//total count
		total = (Integer) resultmap.get("total");
	
				
		mv.addObject("total", total);
		mv.addObject("progress", (List<Map<String, Object>>) resultmap.get("prog"));
		mv.addObject("diaryList", diary);
		
		
		return mv;
	}
	
	@RequestMapping(value="/td/days.do")
	public ModelAndView opendays(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/daylist");
		
		HttpSession session = request.getSession(false);
		String status = session.getAttribute("status").toString();
		MemberDTO userInfo = null;
		
		//로그인 상태 구분해서 열람 수정하기
		if(status.equals("logout")){
			mv.addObject("identify", "guest");
		}else{
			//멤버면 userinfo 가져오기
			userInfo = (MemberDTO)session.getAttribute("userInfo");
			
			mv.addObject("identify", "member");
		}
		
		mv.addObject("userInfo",userInfo);
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/td/daylist.do")
	public ModelAndView getDayList(HttpServletRequest request, String identify, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<DayDTO> daylist = null;
		Map<String, Object> resultmap = new HashMap<String, Object>();
		int total = 0;
		
		//day dto
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pnum", commandMap.getMap().get("pagenum"));
		resultmap = (Map<String, Object>) tdService.getDayList(map);
		daylist = (List<DayDTO>) resultmap.get("dayList");

		//total count
		total = (Integer) resultmap.get("total");
		
				
		mv.addObject("total", total);
		mv.addObject("dayList", daylist);
		mv.addObject("replyCount", resultmap.get("reCount"));
		
		return mv;
	}
	
	@RequestMapping(value="/td/openModifyDiary.do")
	public ModelAndView openModifyDiary(HttpServletRequest request,
										@RequestParam(value="dvol", required=true)int dvol) throws Exception{
		ModelAndView mv = new ModelAndView("/td/modifydiary");
		
		mv.addObject("dvol", dvol);
		
		request.setAttribute("dvol", dvol);
		
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		MemberDTO userInfo = new MemberDTO();
		
		if(status.equals("login")){
			userInfo = (MemberDTO) session.getAttribute("userInfo");
			mv.addObject("userInfo", userInfo);
		}
		
		// 수정하기위해 원래 다이어리 정보 가져오기
		mv.addObject("diaryInfo", tdService.getDiaryInfo(userInfo.getMember_num(), dvol));
		
		return mv;
	}
	
	//시간 경과에 의핸 세션 해제는 나중에 수정하기
	@RequestMapping(value="/td/modifyDiary.do")
	public ModelAndView modifyDiary(HttpServletRequest request, DiaryDTO diary) throws Exception{
		ModelAndView mv = new ModelAndView("/td/diarydays");
		
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dvol", request.getAttribute("dvol"));
		map.put("mnum", userInfo.getMember_num());
		map.put("diary",  diary);
		
		int re = tdService.modifyDiary(map);
		
		//update가 성공하면 내용 불러와서 해당 일기장 일기목록으로 보내기
		if(re>0){
			//day dto
			Map<String, Object> remap = new HashMap<String, Object>();
			Map<String, Object> resultmap = new HashMap<String, Object>();
		//	map.put("mnum", Integer.parseInt(request.getParameter("mnum")));
		//	map.put("dvol", Integer.parseInt(request.getParameter("dvol")));
			remap.put("mnum",  userInfo.getMember_num());
			remap.put("dvol", map.get("dvol"));
			resultmap = (Map<String, Object>) tdService.getDiaryDays(map);
			
			mv.addObject("progress", resultmap.get("prog"));

			mv.addObject("dayList",resultmap.get("dayList"));
			mv.addObject("total", resultmap.get("total"));
			mv.addObject("replyCount", resultmap.get("reCount"));
		} else{
			mv.addObject("failFlag", "fail");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/td/openWriteDiary.do")
	public ModelAndView openWriteDiary(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/td/writediary");
		
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		MemberDTO userInfo = new MemberDTO();
		
		if(status.equals("login")){
			userInfo = (MemberDTO) session.getAttribute("userInfo");
			mv.addObject("userInfo", userInfo);
		}
		
		return mv;
	}
	
	/*
	//시간 경과에 의핸 세션 해제는 나중에 수정하기
	@RequestMapping(value="/td/writeDiary.do")
	public ModelAndView writeDiary(HttpServletRequest request, CommandMap commandmap){
		ModelAndView mv = new ModelAndView("/td/daydetail");
		
		HttpSession session = request.getSession(false);
		String status = (String) session.getAttribute("status");
		
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		
		try {
			int dnum = tdService.writeDiary(commandmap.getMap());
			
			//insert가 성공하면 내용 불러와서 상세화면으로 보내기
			if(dnum>0)
				mv.addObject("day", (DayDTO)tdService.getDayDetail(dnum, userInfo.getMember_num()).get("day"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("failFlag", "fail");
		
		return mv;
	}
	*/
	
	@RequestMapping(value="/td/replylist.do")
	public ModelAndView getReplyList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String, Object> resultmap = tdService.getReplyList(commandMap.getMap());
		
		mv.addObject("replyList", resultmap.get("replyList"));
		mv.addObject("totalcount", resultmap.get("total"));
		
		return mv;
	}
	
	//댓글을 쓰고나서 리스트를 다시 불러온 후 json으로 넘겨주고 새로 작성하기
	@RequestMapping(value="/td/writereply.do")
	public ModelAndView writeReply(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		return mv;
	}
	
	
	
	
	
	
}
	
	
	
	
	

