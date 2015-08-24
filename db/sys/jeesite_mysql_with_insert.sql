/*取消外键约束，避免一张表有个外键导入的时候外键表代码还没执行*/
SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */
DROP TABLE sys_menu;
DROP TABLE sys_dict;
DROP TABLE sys_log;
/* Create Tables */

CREATE TABLE sys_dict
(
	id varchar(64) NOT NULL COMMENT '编号',
	label varchar(100) NOT NULL COMMENT '标签名',
	value varchar(100) NOT NULL COMMENT '数据值',
	type varchar(100) NOT NULL COMMENT '类型',
	description varchar(100) NOT NULL COMMENT '描述',
	sort int NOT NULL COMMENT '排序（升序）',
	create_date datetime COMMENT '创建时间',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
	PRIMARY KEY (id)
) 
COMMENT = '字典表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;;

CREATE TABLE sys_menu
(
	id varchar(64) NOT NULL COMMENT '编号',
	parent_id varchar(64) NOT NULL COMMENT '父级编号',
	parent_ids varchar(2000) NOT NULL COMMENT '所有父级编号',
	name varchar(100) NOT NULL COMMENT '菜单名称',
	href varchar(255) COMMENT '链接',
	target varchar(20) COMMENT '目标',
	icon varchar(100) COMMENT '图标',
	sort int NOT NULL COMMENT '排序（升序）',
	is_show char(1) NOT NULL DEFAULT '1' COMMENT '是否在菜单中显示',
	create_date datetime COMMENT '创建时间',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) NOT NULL DEFAULT '0'  COMMENT '删除标记',
	PRIMARY KEY (id)
) 
COMMENT = '菜单表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;;

CREATE TABLE sys_log
(
	id varchar(64) NOT NULL COMMENT '编号',
	type char(1) DEFAULT '1' COMMENT '日志类型',
	create_date datetime COMMENT '创建时间',
	remote_addr varchar(255) COMMENT '操作IP地址',
	user_agent varchar(255) COMMENT '用户代理',
	request_uri varchar(255) COMMENT '请求URI',
	method varchar(5) COMMENT '操作方式',
	params text COMMENT '操作提交的数据',
	exception text COMMENT '异常信息',
	PRIMARY KEY (id)
) 
COMMENT = '日志表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;



/* Create Indexes */
CREATE INDEX sys_dict_value ON sys_dict (value ASC);
CREATE INDEX sys_dict_label ON sys_dict (label ASC);
CREATE INDEX sys_dict_del_flag ON sys_dict (del_flag ASC);
CREATE INDEX sys_menu_parent_id ON sys_menu (parent_id ASC);
CREATE INDEX sys_menu_parent_ids ON sys_menu (parent_ids ASC);
CREATE INDEX sys_menu_del_flag ON sys_menu (del_flag ASC);
CREATE INDEX sys_log_request_uri ON sys_log (request_uri ASC);
CREATE INDEX sys_log_type ON sys_log (type ASC);
CREATE INDEX sys_log_create_date ON sys_log (create_date ASC);

/* insert data*/
INSERT INTO `sys_menu` (`id`, `parent_id`, `parent_ids`, `name`, `href`, `target`, `icon`, `sort`, `is_show`, `create_date`, `update_date`, `remarks`, `del_flag`) VALUES
	('1', '0', '0,', '顶级菜单', NULL, NULL, NULL, 0, '1', '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('5', '3', '0,1,2,3,', '字典管理', '/sys/dict/', NULL, 'th-list', 60, '1', '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('2', '1', '0,1,', '系统设置', NULL, NULL, NULL, 900, '1', '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('3', '2', '0,1,2,', '系统设置', NULL, NULL, NULL, 980, '1', '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('4', '3', '0,1,2,3,', '菜单管理', '/sys/menu/', '', 'list-alt', 30, '1', '2013-05-27 08:00:00', '2015-08-18 13:52:30', NULL, '0'),
	('6', '2', '0,1,2,', '日志查询', NULL, NULL, NULL, 985, '1', '2013-06-03 08:00:00', '2013-06-03 08:00:00', NULL, '0'),
	('7', '6', '0,1,2,6,', '日志查询', '/sys/log', NULL, 'pencil', 30, '1', '2013-06-03 08:00:00', '2013-06-03 08:00:00', NULL, '0');
	
	INSERT INTO `sys_dict` (`id`, `label`, `value`, `type`, `description`, `sort`, `create_date`, `update_date`, `remarks`, `del_flag`) VALUES
	('1', '正常', '0', 'del_flag', '删除标记', 10, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('10', '黄色', 'yellow', 'color', '颜色值', 40, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('11', '橙色', 'orange', 'color', '颜色值', 50, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('12', '默认主题', 'default', 'theme', '主题方案', 10, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('13', '天蓝主题', 'cerulean', 'theme', '主题方案', 20, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('14', '橙色主题', 'readable', 'theme', '主题方案', 30, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('15', '红色主题', 'united', 'theme', '主题方案', 40, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('16', 'Flat主题', 'flat', 'theme', '主题方案', 60, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('2', '删除', '1', 'del_flag', '删除标记', 20, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('3', '显示', '1', 'show_hide', '显示/隐藏', 10, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('4', '隐藏', '0', 'show_hide', '显示/隐藏', 20, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('5', '是', '1', 'yes_no', '是/否', 10, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('6', '否', '0', 'yes_no', '是/否', 20, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('62', '接入日志', '1', 'sys_log_type', '日志类型', 30, '2013-06-03 08:00:00', '2013-06-03 08:00:00', NULL, '0'),
	('63', '异常日志', '2', 'sys_log_type', '日志类型', 40, '2013-06-03 08:00:00', '2013-06-03 08:00:00', NULL, '0'),
	('7', '红色', 'red', 'color', '颜色值', 10, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('8', '绿色', 'green', 'color', '颜色值', 20, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0'),
	('9', '蓝色', 'blue', 'color', '颜色值', 30, '2013-05-27 08:00:00', '2013-05-27 08:00:00', NULL, '0');