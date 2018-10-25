package com.tdtk.service;

import com.tdtk.pojo.Users;
import com.tdtk.utils.PagedResult;

public interface UsersService {

	public PagedResult queryUsers(Users user, Integer page, Integer pageSize);
	
}
