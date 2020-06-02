package traveldiary.td.dto;

import java.util.List;


public class DayListViewDTO {

	private int dayTotalCount;
	private int currentPageNumber;
	private List<DayDTO> dayList;
	private int pageTotalCount;
	private int dayCountPerPage;
	private int firstRow;
	private int endRow;

	
	public DayListViewDTO(List<DayDTO> dayList,
			int dayTotalCount,		
			int currentPageNumber,		
			int dayCountPerPage,	 
			int startRow,
			int endRow) 
	{
		this.dayList = dayList;
		this.dayTotalCount = dayTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.dayCountPerPage = dayCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;

		calculatePageTotalCount();
	}

	private void calculatePageTotalCount() {
		if (dayTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = dayTotalCount / dayCountPerPage;
			if (dayTotalCount % dayCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getDayTotalCount() {
		return dayTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<DayDTO> getDayList() {
		return dayList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getDayCountPerPage() {
		return dayCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty() {
		return dayTotalCount == 0;
	}

}
