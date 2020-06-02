package traveldiary.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import traveldiary.td.dto.MemberDTO;

public class AbstractDAO {
    protected Log log = LogFactory.getLog(AbstractDAO.class);
     
    //xml에 선언했던 의존관계 자동 주입
    @Autowired
    private SqlSessionTemplate sqlSession;
     
    protected void printQueryId(String queryId) {
        if(log.isDebugEnabled()){
            log.debug("\t QueryId  \t:  " + queryId);
        }
    }
     
    //로그를 보기 편하게 sql 명령어 재정의
    public Object insert(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.insert(queryId, params);
    }
     
    public Object update(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.update(queryId, params);
    }
     
    public Object delete(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.delete(queryId, params);
    }
     
    public Object selectOne(String queryId){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId);
    }
     
    public Object selectOne(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId, params);
    }
     
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId){
        printQueryId(queryId);
        return sqlSession.selectList(queryId);
    }
     
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
    }
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public Map selectPagingListEgov(String queryId, Object params){
        printQueryId(queryId);
         
        Map<String,Object> map = (Map<String,Object>)params;
        PaginationInfo paginationInfo = null;
         
        if(map.containsKey("currentPageNo") == false || StringUtils.isEmpty(map.get("currentPageNo")) == true)
            map.put("currentPageNo","1");
         
        paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(Integer.parseInt(map.get("currentPageNo").toString()));
        
        // 정해진 값이 없으면 한 페이지당 15개
        if(map.containsKey("PAGE_ROW") == false || StringUtils.isEmpty(map.get("PAGE_ROW")) == true){
            paginationInfo.setRecordCountPerPage(15);
        }
        else{
            paginationInfo.setRecordCountPerPage(Integer.parseInt(map.get("PAGE_ROW").toString()));
        }
        paginationInfo.setPageSize(10);
         
        int start = paginationInfo.getFirstRecordIndex();
        int end = paginationInfo.getRecordCountPerPage();
        map.put("START",start);
        map.put("END",end);
         
        params = map;
         
        //굳이 모든 리스트를 가져오는데 TOTAL_COUNT를 항마다 표시해야할까 다른 SQL로 불러오는게 낫지 않을까?
        Map<String,Object> returnMap = new HashMap<String,Object>();
        List<Map<String,Object>> list = sqlSession.selectList(queryId,params);
         
        if(list.size() == 0){
            map = new HashMap<String,Object>();
            map.put("TOTAL_COUNT",0); 
            list.add(map);
             
            if(paginationInfo != null){
                paginationInfo.setTotalRecordCount(0);
                returnMap.put("paginationInfo", paginationInfo);
            }
        }
        else{
            if(paginationInfo != null){
                paginationInfo.setTotalRecordCount(Integer.parseInt(list.get(0).get("TOTAL_COUNT").toString()));
                returnMap.put("paginationInfo", paginationInfo);
            }
        }
        returnMap.put("result", list);
        return returnMap;
    }
    
    @SuppressWarnings("unchecked")
    public Object selectPagingList(String queryId, Object params){
        printQueryId(queryId);
        Map<String,Object> map = (Map<String,Object>)params;
         
        String strPageIndex = (String)map.get("PAGE_INDEX");
        String strPageRow = (String)map.get("PAGE_ROW");
        int nPageIndex = 0;
        int nPageRow = 20;
         
        if(StringUtils.isEmpty(strPageIndex) == false){
            nPageIndex = Integer.parseInt(strPageIndex)-1;
        }
        if(StringUtils.isEmpty(strPageRow) == false){
            nPageRow = Integer.parseInt(strPageRow);
        }
        
        map.put("START", (nPageIndex * nPageRow) + 1);
        map.put("END", nPageRow);
         
        return sqlSession.selectList(queryId, map);
    }

    @SuppressWarnings("unchecked")
    public List<MemberDTO> selectMemberList(String queryId){
    	printQueryId(queryId);
    	
    	
		return null;
    	
    	
    }
    



}
