package com.tdtk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

	@GetMapping("/hello")
	@ResponseBody
	public String hello() {
		return "hello";
	}
	
	@GetMapping("/center")
	public String center() {
		return "center";
	}
}
