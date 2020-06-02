package traveldiary.td.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import traveldiary.common.dao.AbstractDAO;
import traveldiary.td.dto.DayListViewDTO;
import traveldiary.td.dto.MemberDTO;

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


}
