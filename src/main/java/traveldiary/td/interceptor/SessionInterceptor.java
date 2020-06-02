package traveldiary.td.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import traveldiary.td.dto.MemberDTO;

@Service
public class SessionInterceptor extends HandlerInterceptorAdapter {

	protected Log log = LogFactory.getLog(SessionInterceptor.class);
	
	/**preHandle : 클라이언트의 요청을 컨트롤러에 전달하기 전에 호출
	 *  return false인 경우 intercepter or controller 실행없이 요청종료
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		
		try{
			HttpSession session = request.getSession(false);
			
			//세션이 아예 존재하지 않으면
			if(session == null){
				//그냥냅둬
			} else {
				
				String status = (String)session.getAttribute("status");
				//세션이 존재하지만 status란 값은 없어
				if(status == null){
					session.setAttribute("status", "logout");
				}
			}
			
			MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
			if(log.isDebugEnabled()){
				if(session.getAttribute("status").equals("login"))
					log.debug(" Session Info \t:  Login " + userInfo.getMember_id()+"("+userInfo.getMember_num()+")");
				else
					log.debug(" Session Info \t:  Logout ");
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return true;
	}
}
