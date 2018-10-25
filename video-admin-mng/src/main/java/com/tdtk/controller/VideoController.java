package com.tdtk.controller;

import com.tdtk.enums.VideoStatusEnum;
import com.tdtk.pojo.Bgm;
import com.tdtk.pojo.UsersReport;
import com.tdtk.service.VideoService;
import com.tdtk.utils.IMoocJSONResult;
import com.tdtk.utils.PagedResult;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;


@Controller
@RequestMapping("video")
public class VideoController {

	
	@Autowired
	private VideoService videoService;
	
	
	/**
	 * 跳转到举报页面
	 */
	@GetMapping("/showReportList")
	public String showReportList() {
		return "video/reportList";
	}
	
	/**
	 * 举报data列表数据
	 */
	@PostMapping("/reportList")
	@ResponseBody
	public PagedResult reportList(Integer page) {
		
		PagedResult result = videoService.queryReportList(page, 10);
		return result;
	}
	
	
	/**
	 *  禁播功能
	 */
	@PostMapping("/forbidVideo")
	@ResponseBody
	public IMoocJSONResult forbidVideo(String videoId) {
		
		videoService.updateVideoStatus(videoId, VideoStatusEnum.FORBID.value);
		return IMoocJSONResult.ok();
	}

	/**
	 *  删除视频
	 */
	@PostMapping("/delVideo")
	@ResponseBody
	public IMoocJSONResult delVideo(String videoId) {

        UsersReport reports = new UsersReport();
        reports.setDealVideoId(videoId);
        reports.setIsdel("1");

        videoService.delVideoReport(reports);
		return IMoocJSONResult.ok();
	}

	/**
	 * 查询bgm列表 页面
	 */
	@GetMapping("/showBgmList")
	public String showBgmList() {
		return "video/bgmList";
	}
	
	/**
	 * 查询bgm列表 data数据
	 */
	@PostMapping("/queryBgmList")
	@ResponseBody
	public PagedResult queryBgmList(Integer page) {
		return videoService.queryBgmList(page, 10);
	}
	
	/**
	 * 跳转到BGM添加页面
	 */
	@GetMapping("/showAddBgm")
	public String login() {
		return "video/addBgm";
	}
	
	
	/**
	 * 提交表单 保存BGM到数据库
	 */
	@PostMapping("/addBgm")
	@ResponseBody
	public IMoocJSONResult addBgm(Bgm bgm) {
		
		videoService.addBgm(bgm);
		return IMoocJSONResult.ok();
	}
	
	/**
	 * 从数据库 删除BGM
	 */
	@PostMapping("/delBgm")
	@ResponseBody
	public IMoocJSONResult delBgm(String bgmId) {
		videoService.deleteBgm(bgmId);
		return IMoocJSONResult.ok();
	}
	
	
	
	/**
	 * 异步上传bgm
	 */
	@PostMapping("/bgmUpload")
	@ResponseBody
	public IMoocJSONResult bgmUpload(HttpServletRequest request, @RequestParam("file") MultipartFile[] files) throws Exception {

        String basePath = request.getSession().getServletContext().getRealPath("");
        System.out.println(basePath);
		// 文件保存的命名空间

        // 保存到数据库中的相对路径
        String uploadPathDB = "upload"+ File.separator + "videos_bgm";

        basePath+=uploadPathDB;

		FileOutputStream fileOutputStream = null;
		InputStream inputStream = null;
		try {
			if (files != null && files.length > 0) {
				
				String fileName = files[0].getOriginalFilename();
				if (StringUtils.isNotBlank(fileName)) {
					// 文件上传的最终保存路径
					String finalPath =  basePath + File.separator + fileName;
					// 设置数据库保存的路径
					uploadPathDB += (File.separator + fileName);
					
					File outFile = new File(finalPath);
					if (outFile.getParentFile() != null || !outFile.getParentFile().isDirectory()) {
						// 创建父文件夹
						outFile.getParentFile().mkdirs();
					}
					
					fileOutputStream = new FileOutputStream(outFile);
					inputStream = files[0].getInputStream();
					IOUtils.copy(inputStream, fileOutputStream);
				}
				
			} else {
				return IMoocJSONResult.errorMsg("上传出错...");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return IMoocJSONResult.errorMsg("上传出错...");
		} finally {
			if (fileOutputStream != null) {
				fileOutputStream.flush();
				fileOutputStream.close();
			}
		}
		return IMoocJSONResult.ok(File.separator +uploadPathDB);
	}



}
