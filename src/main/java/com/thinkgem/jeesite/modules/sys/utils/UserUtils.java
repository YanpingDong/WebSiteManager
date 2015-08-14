/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.thinkgem.jeesite.modules.sys.utils;

import java.util.List;
import java.util.Map;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.dao.MenuDao;
import com.thinkgem.jeesite.modules.sys.entity.Menu;


/**
 * 用户工具类
 * @author ThinkGem
 * @version 2013-5-29
 */
public class UserUtils {
	
	private static MenuDao menuDao = SpringContextHolder.getBean(MenuDao.class);
	private static Map<String, Object> map = Maps.newHashMap();;
	public static final String CACHE_MENU_LIST = "menuList";
	
	public static List<Menu> getMenuList(){
		@SuppressWarnings("unchecked")
		List<Menu> menuList = (List<Menu>)getCache(CACHE_MENU_LIST);
		if (menuList == null){
			menuList = menuDao.findAllList();
			putCache(CACHE_MENU_LIST, menuList);
		}
		return menuList;
	}
	
	public static Object getCache(String key) {
		return getCache(key, null);
	}
	
	public static Object getCache(String key, Object defaultValue) {
		Object obj = getCacheMap().get(key);
		return obj==null?defaultValue:obj;
	}

	public static void putCache(String key, Object value) {
		getCacheMap().put(key, value);
	}

	public static void removeCache(String key) {
		getCacheMap().remove(key);
	}
	
	public static Map<String, Object> getCacheMap(){
		return map;
	}
	
}
