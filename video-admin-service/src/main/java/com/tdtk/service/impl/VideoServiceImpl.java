package com.tdtk.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tdtk.pojo.UsersReport;
import com.tdtk.service.VideoService;
import org.n3r.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tdtk.enums.BGMOperatorTypeEnum;
import com.tdtk.mapper.BgmMapper;
import com.tdtk.mapper.UsersReportMapperCustom;
import com.tdtk.mapper.VideosMapper;
import com.tdtk.pojo.Bgm;
import com.tdtk.pojo.BgmExample;
import com.tdtk.pojo.Videos;
import com.tdtk.pojo.vo.Reports;
import com.tdtk.utils.PagedResult;

@Service
public class VideoServiceImpl implements VideoService {
	
	
	@Autowired
	private VideosMapper videosMapper;
		
	@Autowired
	private BgmMapper bgmMapper;
	
	@Autowired
	private Sid sid;
	
//	@Autowired
//	private ZKCurator zkCurator;
	
	@Autowired
	private UsersReportMapperCustom usersReportMapperCustom;
	
	
	@Override
	public PagedResult queryReportList(Integer page, Integer pageSize) {

		PageHelper.startPage(page, pageSize);

		List<Reports> reportsList = usersReportMapperCustom.selectAllVideoReport();

		PageInfo<Reports> pageList = new PageInfo<Reports>(reportsList);

		PagedResult grid = new PagedResult();
		grid.setTotal(pageList.getPages());
		grid.setRows(reportsList);
		grid.setPage(page);
		grid.setRecords(pageList.getTotal());

		return grid;
	}

	@Override
	public void delVideoReport(UsersReport userReport) {
		usersReportMapperCustom.delVideoReport(userReport);
	}

	@Override
	public void updateVideoStatus(String videoId, Integer status) {
		
		Videos video = new Videos();
		video.setId(videoId);
		video.setStatus(status);
		videosMapper.updateByPrimaryKeySelective(video);
	}
	
	
	@Override
	public PagedResult queryBgmList(Integer page, Integer pageSize) {
		
		PageHelper.startPage(page, pageSize);
		
		BgmExample example = new BgmExample();
		List<Bgm> list = bgmMapper.selectByExample(example);
		
		PageInfo<Bgm> pageList = new PageInfo<>(list);
		
		PagedResult result = new PagedResult();
		result.setTotal(pageList.getPages());
		result.setRows(list);
		result.setPage(page);
		result.setRecords(pageList.getTotal());
		
		return result;
	}
	
	
	@Override
	public void addBgm(Bgm bgm) {
		String bgmId = sid.nextShort();
		bgm.setId(bgmId);
		bgmMapper.insert(bgm);
		
		Map<String, String> map = new HashMap<>();
		map.put("operType", BGMOperatorTypeEnum.ADD.type);
		map.put("path", bgm.getPath());
		
//		zkCurator.sendBgmOperator(bgmId, JsonUtils.objectToJson(map));
	}
	
	@Override
	public void deleteBgm(String id) {
		
		// [1] 先查询出bgm对象
		Bgm bgm = bgmMapper.selectByPrimaryKey(id);
		// [2] 在执行删除操作
		bgmMapper.deleteByPrimaryKey(id);
		// [3] 封装map对象
		Map<String, String> map = new HashMap<>();
		map.put("operType", BGMOperatorTypeEnum.DELETE.type);
		map.put("path", bgm.getPath());
		// [4] 添加节点数据（数据是删除的信息）
//		zkCurator.sendBgmOperator(id, JsonUtils.objectToJson(map));
		
	}

	

}
