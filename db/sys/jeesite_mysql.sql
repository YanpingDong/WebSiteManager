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
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '字典表';

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
	is_show char(1) NOT NULL COMMENT '是否在菜单中显示',
	create_date datetime COMMENT '创建时间',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '菜单表';

CREATE TABLE `sys_log` (
	`id` VARCHAR(64) NOT NULL COMMENT '编号',
	`type` CHAR(1) NOT NULL DEFAULT '1' COMMENT '日志类型',
	`title` VARCHAR(255) NULL DEFAULT '' COMMENT '日志标题',
	`create_date` DATETIME NOT NULL DEFAULT '' COMMENT '创建时间',
	`remote_addr` VARCHAR(255) NULL DEFAULT NULL COMMENT '操作IP地址',
	`user_agent` VARCHAR(255) NULL DEFAULT NULL COMMENT '用户代理',
	`request_uri` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '请求URI',
	`method` VARCHAR(5) NULL DEFAULT NULL COMMENT '操作方式',
	`params` TEXT NULL COMMENT '操作提交的数据',
	`exception` TEXT NULL COMMENT '异常信息',
	PRIMARY KEY (`id`),
	INDEX `sys_log_request_uri` (`request_uri`),
	INDEX `sys_log_type` (`type`),
	INDEX `sys_log_create_date` (`create_date`)
)
COMMENT='日志表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;



/* Create Indexes */
CREATE INDEX sys_dict_value ON sys_dict (value ASC);
CREATE INDEX sys_dict_label ON sys_dict (label ASC);
CREATE INDEX sys_dict_del_flag ON sys_dict (del_flag ASC);
CREATE INDEX sys_menu_parent_id ON sys_menu (parent_id ASC);
CREATE INDEX sys_menu_parent_ids ON sys_menu (parent_ids ASC);
CREATE INDEX sys_menu_del_flag ON sys_menu (del_flag ASC);