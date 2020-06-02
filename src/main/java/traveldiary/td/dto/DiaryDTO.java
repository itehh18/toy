package traveldiary.td.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DiaryDTO {

	private int member_num;
	private int diary_volum;
	private String diary_title;
	private String time;
	private String start_day;
	private String end_day;
	private String location_code;
	private String loc_detail;
	private String diary_cover;
	private String p_code;
	private String del_flag;

	
	
	public void setMember_num(int mnum){
		this.member_num = mnum;
	}
	
	public int getMember_num(){
		return this.member_num;
	}
	
	public void setDiary_volum(int dvol){
		this.diary_volum = dvol;
	}
	
	public int getDiary_volum(){
		return this.diary_volum;
	}
	
	public void setDiary_title(String title){
		this.diary_title = title;
	}
	
	public String getDiary_title(){
		return this.diary_title;
	}
	
	public void setDate(Date time){
		this.time = setDateFormat(time);
	}
	
	public String getDate(){
		return this.time;
	}
	
	public void setStart_day(Date sday){
		this.start_day = setDateFormat(sday);
	}
	
	public String getStart_day(){
		return this.start_day;
	}
	
	public void setEnd_day(Date eday){
		this.end_day = setDateFormat(eday);
	}
	
	public String getEnd_day(){
		return this.end_day;
	}
	
	public void setLocation_code(String loc){
		this.location_code = loc;
	}
	
	public String getLocation_code(){
		return this.location_code;
	}
	
	public void setDiary_cover(String cov){
		this.diary_cover = cov;
	}
	
	public String getDiary_cover(){
		return this.diary_cover;
	}
	
	public void setP_code(String pcode){
		this.p_code = pcode;
	}
	
	public String getP_code(){
		return this.p_code;
	}
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}
	
	public String setDateFormat(Date d){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		return formatter.format(d);
	}

	public String getLoc_detail() {
		return loc_detail;
	}

	public void setLoc_detail(String loc_detail) {
		this.loc_detail = loc_detail;
	}
}