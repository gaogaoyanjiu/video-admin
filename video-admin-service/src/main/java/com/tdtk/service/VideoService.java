package com.tdtk.service;

import com.tdtk.pojo.Bgm;
import com.tdtk.pojo.UsersReport;
import com.tdtk.utils.PagedResult;

public interface VideoService {
	
	public void addBgm(Bgm bgm);

	PagedResult queryBgmList(Integer page, Integer pageSize);
	
	public void deleteBgm(String id);
	
	
	
	public PagedResult queryReportList(Integer page, Integer pageSize);

	public void delVideoReport(UsersReport userReport);

	
	public void updateVideoStatus(String videoId, Integer status);

}
