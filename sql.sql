DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章分类';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-03-31 18:21:49.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-03-31 17:35:13.0');
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`(student_id int(11) NOT NULL AUTO_INCREMENT COMMENT '学生ID',
`student_no` varchar(64) NOT NULL UNIQUE comment '学生编号',
`student_name` varchar(64) comment '学生姓名',
`gender` varchar(64) comment '性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (student_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '学生';

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`(teacher_id int(11) NOT NULL AUTO_INCREMENT COMMENT '教师ID',
`teacher_no` varchar(64) NOT NULL UNIQUE comment '教师编号',
`full_name` varchar(64) comment '姓名',
`gender` varchar(64) comment '性别',
`name_of_department` varchar(64) comment '院系名称',
`lecturing_specialty` varchar(64) comment '授课专业',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (teacher_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '教师';

DROP TABLE IF EXISTS `student_information`;
CREATE TABLE `student_information`(student_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '学生信息ID',
`student_no` int(11) DEFAULT 0 comment '学生编号',
`student_name` varchar(64) comment '学生姓名',
`gender` varchar(64) comment '性别',
`name_of_department` varchar(64) comment '院系名称',
`major` varchar(64) comment '学习专业',
`class_name` varchar(64) comment '班级名称',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (student_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '学生信息';
insert into `student_information` values (1,0,'学生姓名1','性别1','院系名称1','学习专业1','班级名称1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `student_information` values (2,0,'学生姓名2','性别2','院系名称2','学习专业2','班级名称2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `student_information` values (3,0,'学生姓名3','性别3','院系名称3','学习专业3','班级名称3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `student_information` values (4,0,'学生姓名4','性别4','院系名称4','学习专业4','班级名称4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `student_information` values (5,0,'学生姓名5','性别5','院系名称5','学习专业5','班级名称5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `student_information` values (6,0,'学生姓名6','性别6','院系名称6','学习专业6','班级名称6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `student_information` values (7,0,'学生姓名7','性别7','院系名称7','学习专业7','班级名称7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `student_information` values (8,0,'学生姓名8','性别8','院系名称8','学习专业8','班级名称8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `department_management`;
CREATE TABLE `department_management`(department_management_id int(11) NOT NULL AUTO_INCREMENT COMMENT '院系管理ID',
`name_of_department` varchar(64) comment '院系名称',
`person_in_charge` varchar(64) comment '负责人',
`details` text comment '详情介绍',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (department_management_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '院系管理';
insert into `department_management` values (1,'院系名称1','负责人1','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `department_management` values (2,'院系名称2','负责人2','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `department_management` values (3,'院系名称3','负责人3','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `department_management` values (4,'院系名称4','负责人4','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `department_management` values (5,'院系名称5','负责人5','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `department_management` values (6,'院系名称6','负责人6','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `department_management` values (7,'院系名称7','负责人7','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `department_management` values (8,'院系名称8','负责人8','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `professional_management`;
CREATE TABLE `professional_management`(professional_management_id int(11) NOT NULL AUTO_INCREMENT COMMENT '专业管理ID',
`major_name` varchar(64) comment '专业名称',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (professional_management_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '专业管理';
insert into `professional_management` values (1,'专业名称1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `professional_management` values (2,'专业名称2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `professional_management` values (3,'专业名称3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `professional_management` values (4,'专业名称4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `professional_management` values (5,'专业名称5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `professional_management` values (6,'专业名称6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `professional_management` values (7,'专业名称7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `professional_management` values (8,'专业名称8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `class_management`;
CREATE TABLE `class_management`(class_management_id int(11) NOT NULL AUTO_INCREMENT COMMENT '班级管理ID',
`class_name` varchar(64) comment '班级名称',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (class_management_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '班级管理';
insert into `class_management` values (1,'班级名称1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `class_management` values (2,'班级名称2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `class_management` values (3,'班级名称3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `class_management` values (4,'班级名称4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `class_management` values (5,'班级名称5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `class_management` values (6,'班级名称6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `class_management` values (7,'班级名称7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `class_management` values (8,'班级名称8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `course_information`;
CREATE TABLE `course_information`(course_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '课程信息ID',
`course_no` varchar(64) comment '课程编号',
`course_name` varchar(64) comment '课程名称',
`cover` varchar(255) comment '封面',
`class_location` varchar(64) comment '上课地点',
`start_time` datetime comment '开始时间',
`end_time` datetime comment '结束时间',
`teacher_no` int(11) DEFAULT 0 comment '教师编号',
`full_name` varchar(64) comment '姓名',
`details` longtext comment '详情介绍',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (course_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '课程信息';
insert into `course_information` values (1,'课程编号1','课程名称1','/api/upload/1565548561716740096.jpg','上课地点1','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名1','此处可上传文字、图片、视频、超链接、表格等内容区1',91,852,0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_information` values (2,'课程编号2','课程名称2','/api/upload/1565548223559368704.jpg','上课地点2','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名2','此处可上传文字、图片、视频、超链接、表格等内容区2',852,941,0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_information` values (3,'课程编号3','课程名称3','/api/upload/1565548409266372609.jpg','上课地点3','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名3','此处可上传文字、图片、视频、超链接、表格等内容区3',417,470,0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_information` values (4,'课程编号4','课程名称4','/api/upload/1567800992165003265.jpg','上课地点4','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名4','此处可上传文字、图片、视频、超链接、表格等内容区4',460,432,0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_information` values (5,'课程编号5','课程名称5','/api/upload/1565548285026893825.jpg','上课地点5','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名5','此处可上传文字、图片、视频、超链接、表格等内容区5',843,987,0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_information` values (6,'课程编号6','课程名称6','/api/upload/1565548359928774656.jpg','上课地点6','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名6','此处可上传文字、图片、视频、超链接、表格等内容区6',530,495,0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_information` values (7,'课程编号7','课程名称7','/api/upload/1567801149845667841.jpg','上课地点7','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名7','此处可上传文字、图片、视频、超链接、表格等内容区7',608,148,0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_information` values (8,'课程编号8','课程名称8','/api/upload/1565548171524833281.jpg','上课地点8','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名8','此处可上传文字、图片、视频、超链接、表格等内容区8',566,742,0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `classroom_management`;
CREATE TABLE `classroom_management`(classroom_management_id int(11) NOT NULL AUTO_INCREMENT COMMENT '教室管理ID',
`classroom_name` varchar(64) comment '教室名称',
`floor` varchar(64) comment '所在楼层',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (classroom_management_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '教室管理';
insert into `classroom_management` values (1,'教室名称1','所在楼层1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `classroom_management` values (2,'教室名称2','所在楼层2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `classroom_management` values (3,'教室名称3','所在楼层3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `classroom_management` values (4,'教室名称4','所在楼层4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `classroom_management` values (5,'教室名称5','所在楼层5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `classroom_management` values (6,'教室名称6','所在楼层6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `classroom_management` values (7,'教室名称7','所在楼层7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `classroom_management` values (8,'教室名称8','所在楼层8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `course_selection_information`;
CREATE TABLE `course_selection_information`(course_selection_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '选课信息ID',
`course_name` varchar(64) comment '课程名称',
`class_location` varchar(64) comment '上课地点',
`start_time` varchar(64) comment '开始时间',
`end_time` varchar(64) comment '结束时间',
`teacher_no` int(11) DEFAULT 0 comment '教师编号',
`student_no` int(11) DEFAULT 0 comment '学生学号',
`student_name` varchar(64) comment '学生姓名',
`course_selection_time` date comment '选课时间',
`annotation_notes` varchar(64) comment '标注说明',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (course_selection_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '选课信息';
insert into `course_selection_information` values (1,'课程名称1','上课地点1','开始时间1','结束时间1',0,0,'学生姓名1','2023-03-05','标注说明1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_selection_information` values (2,'课程名称2','上课地点2','开始时间2','结束时间2',0,0,'学生姓名2','2023-03-05','标注说明2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_selection_information` values (3,'课程名称3','上课地点3','开始时间3','结束时间3',0,0,'学生姓名3','2023-03-05','标注说明3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_selection_information` values (4,'课程名称4','上课地点4','开始时间4','结束时间4',0,0,'学生姓名4','2023-03-05','标注说明4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_selection_information` values (5,'课程名称5','上课地点5','开始时间5','结束时间5',0,0,'学生姓名5','2023-03-05','标注说明5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_selection_information` values (6,'课程名称6','上课地点6','开始时间6','结束时间6',0,0,'学生姓名6','2023-03-05','标注说明6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_selection_information` values (7,'课程名称7','上课地点7','开始时间7','结束时间7',0,0,'学生姓名7','2023-03-05','标注说明7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_selection_information` values (8,'课程名称8','上课地点8','开始时间8','结束时间8',0,0,'学生姓名8','2023-03-05','标注说明8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `course_test`;
CREATE TABLE `course_test`(course_test_id int(11) NOT NULL AUTO_INCREMENT COMMENT '课程测试ID',
`course_name` varchar(64) comment '课程名称',
`teacher_no` int(11) DEFAULT 0 comment '教师编号',
`student_no` int(11) DEFAULT 0 comment '学生学号',
`student_name` varchar(64) comment '学生姓名',
`test_name` varchar(64) comment '测试名称',
`release_time` date comment '发布时间',
`test_content` varchar(255) comment '测试内容',
`description_of_requirements` text comment '要求说明',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (course_test_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '课程测试';
insert into `course_test` values (1,'课程名称1',0,0,'学生姓名1','测试名称1','2023-03-05','','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_test` values (2,'课程名称2',0,0,'学生姓名2','测试名称2','2023-03-05','','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_test` values (3,'课程名称3',0,0,'学生姓名3','测试名称3','2023-03-05','','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_test` values (4,'课程名称4',0,0,'学生姓名4','测试名称4','2023-03-05','','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_test` values (5,'课程名称5',0,0,'学生姓名5','测试名称5','2023-03-05','','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_test` values (6,'课程名称6',0,0,'学生姓名6','测试名称6','2023-03-05','','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_test` values (7,'课程名称7',0,0,'学生姓名7','测试名称7','2023-03-05','','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_test` values (8,'课程名称8',0,0,'学生姓名8','测试名称8','2023-03-05','','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `submit_test`;
CREATE TABLE `submit_test`(submit_test_id int(11) NOT NULL AUTO_INCREMENT COMMENT '提交测试ID',
`course_name` varchar(64) comment '课程名称',
`teacher_no` int(11) DEFAULT 0 comment '教师编号',
`student_no` int(11) DEFAULT 0 comment '学生学号',
`student_name` varchar(64) comment '学生姓名',
`test_name` varchar(64) comment '测试名称',
`release_time` varchar(64) comment '发布时间',
`submission_time` date comment '提交时间',
`related_attachments` varchar(255) comment '相关附件',
`remarks` varchar(64) comment '备注',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (submit_test_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '提交测试';
insert into `submit_test` values (1,'课程名称1',0,0,'学生姓名1','测试名称1','发布时间1','2023-03-05','','备注1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `submit_test` values (2,'课程名称2',0,0,'学生姓名2','测试名称2','发布时间2','2023-03-05','','备注2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `submit_test` values (3,'课程名称3',0,0,'学生姓名3','测试名称3','发布时间3','2023-03-05','','备注3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `submit_test` values (4,'课程名称4',0,0,'学生姓名4','测试名称4','发布时间4','2023-03-05','','备注4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `submit_test` values (5,'课程名称5',0,0,'学生姓名5','测试名称5','发布时间5','2023-03-05','','备注5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `submit_test` values (6,'课程名称6',0,0,'学生姓名6','测试名称6','发布时间6','2023-03-05','','备注6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `submit_test` values (7,'课程名称7',0,0,'学生姓名7','测试名称7','发布时间7','2023-03-05','','备注7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `submit_test` values (8,'课程名称8',0,0,'学生姓名8','测试名称8','发布时间8','2023-03-05','','备注8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `score_entry`;
CREATE TABLE `score_entry`(score_entry_id int(11) NOT NULL AUTO_INCREMENT COMMENT '成绩录入ID',
`course_name` varchar(64) comment '课程名称',
`teacher_no` int(11) DEFAULT 0 comment '教师编号',
`student_no` int(11) DEFAULT 0 comment '学生学号',
`student_name` varchar(64) comment '学生姓名',
`test_name` varchar(64) comment '测试名称',
`release_time` varchar(64) comment '发布时间',
`test_score` int(11) DEFAULT 0 comment '测试得分',
`annotation_notes` varchar(64) comment '标注说明',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (score_entry_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '成绩录入';
insert into `score_entry` values (1,'课程名称1',0,0,'学生姓名1','测试名称1','发布时间1',1,'标注说明1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `score_entry` values (2,'课程名称2',0,0,'学生姓名2','测试名称2','发布时间2',2,'标注说明2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `score_entry` values (3,'课程名称3',0,0,'学生姓名3','测试名称3','发布时间3',3,'标注说明3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `score_entry` values (4,'课程名称4',0,0,'学生姓名4','测试名称4','发布时间4',4,'标注说明4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `score_entry` values (5,'课程名称5',0,0,'学生姓名5','测试名称5','发布时间5',5,'标注说明5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `score_entry` values (6,'课程名称6',0,0,'学生姓名6','测试名称6','发布时间6',6,'标注说明6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `score_entry` values (7,'课程名称7',0,0,'学生姓名7','测试名称7','发布时间7',7,'标注说明7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `score_entry` values (8,'课程名称8',0,0,'学生姓名8','测试名称8','发布时间8',8,'标注说明8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `course_scheduling_management`;
CREATE TABLE `course_scheduling_management`(course_scheduling_management_id int(11) NOT NULL AUTO_INCREMENT COMMENT '排课管理ID',
`title` varchar(64) comment '标题',
`course_name` varchar(64) comment '课程名称',
`class_location` varchar(64) comment '上课地点',
`start_time` datetime comment '开始时间',
`end_time` datetime comment '结束时间',
`teacher_no` int(11) DEFAULT 0 comment '教师编号',
`full_name` varchar(64) comment '姓名',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (course_scheduling_management_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '排课管理';
insert into `course_scheduling_management` values (1,'标题1','课程名称1','上课地点1','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_scheduling_management` values (2,'标题2','课程名称2','上课地点2','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_scheduling_management` values (3,'标题3','课程名称3','上课地点3','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_scheduling_management` values (4,'标题4','课程名称4','上课地点4','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_scheduling_management` values (5,'标题5','课程名称5','上课地点5','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_scheduling_management` values (6,'标题6','课程名称6','上课地点6','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_scheduling_management` values (7,'标题7','课程名称7','上课地点7','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `course_scheduling_management` values (8,'标题8','课程名称8','上课地点8','2023-03-05 23:05:22','2023-03-05 23:05:22',0,'姓名8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

DROP TABLE IF EXISTS `schedule_management`;
CREATE TABLE `schedule_management`(schedule_management_id int(11) NOT NULL AUTO_INCREMENT COMMENT '课表管理ID',
`title` varchar(64) comment '标题',
`date` date comment '日期',
`the_first_class` varchar(64) comment '第一节课',
`the_second_class` varchar(64) comment '第二节课',
`the_third_class` varchar(64) comment '第三节课',
`the_fourth_class` varchar(64) comment '第四节课',
`section_5` varchar(64) comment '第五节课',
`section_6` varchar(64) comment '第六节课',
`section_7` varchar(64) comment '第七节课',
`section_8` varchar(64) comment '第八节课',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (schedule_management_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '课表管理';
insert into `schedule_management` values (1,'标题1','2023-03-05','第一节课1','第二节课1','第三节课1','第四节课1','第五节课1','第六节课1','第七节课1','第八节课1',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `schedule_management` values (2,'标题2','2023-03-05','第一节课2','第二节课2','第三节课2','第四节课2','第五节课2','第六节课2','第七节课2','第八节课2',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `schedule_management` values (3,'标题3','2023-03-05','第一节课3','第二节课3','第三节课3','第四节课3','第五节课3','第六节课3','第七节课3','第八节课3',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `schedule_management` values (4,'标题4','2023-03-05','第一节课4','第二节课4','第三节课4','第四节课4','第五节课4','第六节课4','第七节课4','第八节课4',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `schedule_management` values (5,'标题5','2023-03-05','第一节课5','第二节课5','第三节课5','第四节课5','第五节课5','第六节课5','第七节课5','第八节课5',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `schedule_management` values (6,'标题6','2023-03-05','第一节课6','第二节课6','第三节课6','第四节课6','第五节课6','第六节课6','第七节课6','第八节课6',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `schedule_management` values (7,'标题7','2023-03-05','第一节课7','第二节课7','第三节课7','第四节课7','第五节课7','第六节课7','第七节课7','第八节课7',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');
insert into `schedule_management` values (8,'标题8','2023-03-05','第一节课8','第二节课8','第三节课8','第四节课8','第五节课8','第六节课8','第七节课8','第八节课8',0,'2023-03-05 23:05:22','2023-03-05 23:05:22');

insert into `auth` values ('1','管理员','学生','student','学生','/student/table','','_blank','1','1','1','1','student_no,student_name,gender','student_no,student_name,gender','student_no,student_name,gender',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('2','管理员','学生','student','学生详情','/student/view','','_blank','1','1','1','1','student_no,student_name,gender','student_no,student_name,gender','student_no,student_name,gender',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('3','管理员','教师','teacher','教师','/teacher/table','','_blank','1','1','1','1','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('4','管理员','教师','teacher','教师详情','/teacher/view','','_blank','1','1','1','1','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('5','管理员','学生信息','student_information','学生信息','/student_information/table','','_blank','1','1','1','1','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('6','管理员','学生信息','student_information','学生详情','/student_information/view','','_blank','1','1','1','1','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('7','管理员','院系管理','department_management','院系管理','/department_management/table','','_blank','1','1','1','1','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('8','管理员','院系管理','department_management','院系详情','/department_management/view','','_blank','1','1','1','1','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('9','管理员','专业管理','professional_management','专业管理','/professional_management/table','','_blank','1','1','1','1','major_name','major_name','major_name',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('10','管理员','专业管理','professional_management','专业详情','/professional_management/view','','_blank','1','1','1','1','major_name','major_name','major_name',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('11','管理员','班级管理','class_management','班级管理','/class_management/table','','_blank','1','1','1','1','class_name','class_name','class_name',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('12','管理员','班级管理','class_management','班级详情','/class_management/view','','_blank','1','1','1','1','class_name','class_name','class_name',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('13','管理员','课程信息','course_information','课程信息','/course_information/table','','_blank','1','1','1','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{"can_show_comment":true}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('14','管理员','课程信息','course_information','课程详情','/course_information/view','','_blank','1','1','1','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('15','管理员','课程信息','course_information','课程信息','/course_information/list','top','_blank','1','1','1','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('16','管理员','课程信息','course_information','课程详情','/course_information/details','','_blank','1','1','1','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('17','管理员','教室管理','classroom_management','教室管理','/classroom_management/table','','_blank','1','1','1','1','classroom_name,floor','classroom_name,floor','classroom_name,floor',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('18','管理员','教室管理','classroom_management','教室详情','/classroom_management/view','','_blank','1','1','1','1','classroom_name,floor','classroom_name,floor','classroom_name,floor',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('19','管理员','选课信息','course_selection_information','选课信息','/course_selection_information/table','','_blank','1','1','1','1','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('20','管理员','选课信息','course_selection_information','选课详情','/course_selection_information/view','','_blank','1','1','1','1','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('21','管理员','选课信息','course_selection_information','选课信息','/course_selection_information/edit','','_blank','1','1','1','1','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('22','管理员','课程测试','course_test','课程测试','/course_test/table','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('23','管理员','课程测试','course_test','课程详情','/course_test/view','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('24','管理员','提交测试','submit_test','提交测试','/submit_test/table','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('25','管理员','提交测试','submit_test','提交详情','/submit_test/view','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('26','管理员','成绩录入','score_entry','成绩录入','/score_entry/table','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes',null,'0','{}','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `auth` values ('27','管理员','成绩录入','score_entry','录入详情','/score_entry/view','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('28','管理员','排课管理','course_scheduling_management','排课管理','/course_scheduling_management/table','','_blank','1','1','1','1','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('29','管理员','排课管理','course_scheduling_management','排课详情','/course_scheduling_management/view','','_blank','1','1','1','1','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('30','管理员','课表管理','schedule_management','课表管理','/schedule_management/table','','_blank','1','1','1','1','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('31','管理员','课表管理','schedule_management','课表详情','/schedule_management/view','','_blank','1','1','1','1','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('32','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('33','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('34','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('35','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('36','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('37','管理员','新闻','article','校园资讯','/article/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('38','管理员','新闻','article','资讯详情','/article/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('39','管理员','新闻','article','校园资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('40','管理员','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('41','管理员','新闻分类','article_type','资讯分类','/article_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('42','管理员','新闻分类','article_type','分类详情','/article_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('43','管理员','公告','notice','公告消息','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('44','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('45','管理员','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('46','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('47','游客','学生','student','学生','/student/table','','_blank','1','0','0','0','student_no,student_name,gender','student_no,student_name,gender','student_no,student_name,gender',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('48','游客','学生','student','学生详情','/student/view','','_blank','1','0','0','0','student_no,student_name,gender','student_no,student_name,gender','student_no,student_name,gender',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('49','游客','教师','teacher','教师','/teacher/table','','_blank','0','0','0','0','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('50','游客','教师','teacher','教师详情','/teacher/view','','_blank','0','0','0','0','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('51','游客','学生信息','student_information','学生信息','/student_information/table','','_blank','0','0','0','0','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('52','游客','学生信息','student_information','学生详情','/student_information/view','','_blank','0','0','0','0','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('53','游客','院系管理','department_management','院系管理','/department_management/table','','_blank','0','0','0','0','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('54','游客','院系管理','department_management','院系管理详情','/department_management/view','','_blank','0','0','0','0','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('55','游客','专业管理','professional_management','专业管理','/professional_management/table','','_blank','0','0','0','0','major_name','major_name','major_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('56','游客','专业管理','professional_management','专业管理详情','/professional_management/view','','_blank','0','0','0','0','major_name','major_name','major_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('57','游客','班级管理','class_management','班级管理','/class_management/table','','_blank','0','0','0','0','class_name','class_name','class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('58','游客','班级管理','class_management','班级管理详情','/class_management/view','','_blank','0','0','0','0','class_name','class_name','class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('59','游客','课程信息','course_information','课程信息','/course_information/table','','_blank','0','0','0','0','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{"can_show_comment":false}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('60','游客','课程信息','course_information','课程信息详情','/course_information/view','','_blank','0','0','0','0','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('61','游客','课程信息','course_information','课程信息','/course_information/list','top','_blank','0','0','0','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('62','游客','课程信息','course_information','课程详情','/course_information/details','','_blank','0','0','0','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{"can_comment":false,"can_show_comment":false}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('63','游客','教室管理','classroom_management','教室管理','/classroom_management/table','','_blank','0','0','0','0','classroom_name,floor','classroom_name,floor','classroom_name,floor',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('64','游客','教室管理','classroom_management','教室管理详情','/classroom_management/view','','_blank','0','0','0','0','classroom_name,floor','classroom_name,floor','classroom_name,floor',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('65','游客','选课信息','course_selection_information','选课信息','/course_selection_information/table','','_blank','0','0','0','0','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('66','游客','选课信息','course_selection_information','选课信息详情','/course_selection_information/view','','_blank','0','0','0','0','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('67','游客','选课信息','course_selection_information','选课信息','/course_selection_information/edit','','_blank','0','0','0','0','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('68','游客','课程测试','course_test','课程测试','/course_test/table','','_blank','0','0','0','0','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('69','游客','课程测试','course_test','课程测试详情','/course_test/view','','_blank','0','0','0','0','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('70','游客','提交测试','submit_test','提交测试','/submit_test/table','','_blank','0','0','0','0','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('71','游客','提交测试','submit_test','提交测试详情','/submit_test/view','','_blank','0','0','0','0','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('72','游客','成绩录入','score_entry','成绩录入','/score_entry/table','','_blank','0','0','0','0','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('73','游客','成绩录入','score_entry','成绩录入详情','/score_entry/view','','_blank','0','0','0','0','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('74','游客','排课管理','course_scheduling_management','排课管理','/course_scheduling_management/table','','_blank','0','0','0','0','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('75','游客','排课管理','course_scheduling_management','排课管理详情','/course_scheduling_management/view','','_blank','0','0','0','0','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('76','游客','课表管理','schedule_management','课表管理','/schedule_management/table','','_blank','0','0','0','0','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('77','游客','课表管理','schedule_management','课表管理详情','/schedule_management/view','','_blank','0','0','0','0','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('78','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('79','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('80','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('81','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('82','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('83','游客','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('84','游客','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('85','游客','新闻','article','校园资讯','/article/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('86','游客','新闻','article','资讯详情','/article/details','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":false}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('87','游客','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('88','游客','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('89','游客','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('90','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('91','游客','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('92','游客','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('93','学生','学生','student','学生','/student/table','','_blank','0','0','0','0','student_no,student_name,gender','student_no,student_name,gender','student_no,student_name,gender',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('94','学生','学生','student','学生详情','/student/view','','_blank','0','0','0','0','student_no,student_name,gender','student_no,student_name,gender','student_no,student_name,gender',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('95','学生','教师','teacher','教师','/teacher/table','','_blank','0','0','0','0','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('96','学生','教师','teacher','教师详情','/teacher/view','','_blank','0','0','0','0','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('97','学生','学生信息','student_information','学生信息','/student_information/table','','_blank','1','1','1','1','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('98','学生','学生信息','student_information','学生详情','/student_information/view','','_blank','1','1','1','1','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('99','学生','院系管理','department_management','院系管理','/department_management/table','','_blank','0','0','0','0','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('100','学生','院系管理','department_management','院系管理详情','/department_management/view','','_blank','0','0','0','0','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('101','学生','专业管理','professional_management','专业管理','/professional_management/table','','_blank','0','0','0','0','major_name','major_name','major_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('102','学生','专业管理','professional_management','专业管理详情','/professional_management/view','','_blank','0','0','0','0','major_name','major_name','major_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('103','学生','班级管理','class_management','班级管理','/class_management/table','','_blank','0','0','0','0','class_name','class_name','class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('104','学生','班级管理','class_management','班级管理详情','/class_management/view','','_blank','0','0','0','0','class_name','class_name','class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('105','学生','课程信息','course_information','课程信息','/course_information/table','','_blank','0','0','0','0','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{"can_show_comment":false}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('106','学生','课程信息','course_information','课程信息详情','/course_information/view','','_blank','0','0','0','0','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('107','学生','课程信息','course_information','课程信息','/course_information/list','top','_blank','1','1','1','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('108','学生','课程信息','course_information','课程详情','/course_information/details','','_blank','1','1','1','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('109','学生','教室管理','classroom_management','教室管理','/classroom_management/table','','_blank','0','0','0','0','classroom_name,floor','classroom_name,floor','classroom_name,floor',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('110','学生','教室管理','classroom_management','教室管理详情','/classroom_management/view','','_blank','0','0','0','0','classroom_name,floor','classroom_name,floor','classroom_name,floor',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('111','学生','选课信息','course_selection_information','选课信息','/course_selection_information/table','','_blank','0','1','0','1','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('112','学生','选课信息','course_selection_information','选课详情','/course_selection_information/view','','_blank','0','1','0','1','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('113','学生','选课信息','course_selection_information','选课信息','/course_selection_information/edit','','_blank','1','1','1','1','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('114','学生','课程测试','course_test','课程测试','/course_test/table','','_blank','0','1','0','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('115','学生','课程测试','course_test','课程详情','/course_test/view','','_blank','0','1','0','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('116','学生','提交测试','submit_test','提交测试','/submit_test/table','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('117','学生','提交测试','submit_test','提交详情','/submit_test/view','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('118','学生','成绩录入','score_entry','成绩查询','/score_entry/table','','_blank','0','1','0','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('119','学生','成绩录入','score_entry','成绩详情','/score_entry/view','','_blank','0','1','0','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('120','学生','排课管理','course_scheduling_management','排课管理','/course_scheduling_management/table','','_blank','0','0','0','0','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('121','学生','排课管理','course_scheduling_management','排课管理详情','/course_scheduling_management/view','','_blank','0','0','0','0','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('122','学生','课表管理','schedule_management','课表信息','/schedule_management/table','','_blank','0','0','0','1','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('123','学生','课表管理','schedule_management','课表详情','/schedule_management/view','','_blank','0','0','0','1','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('124','学生','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('125','学生','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('126','学生','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('127','学生','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('128','学生','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('129','学生','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('130','学生','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('131','学生','新闻','article','校园喜讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('132','学生','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('133','学生','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('134','学生','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('135','学生','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('136','学生','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('137','学生','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('138','学生','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('139','教师','学生','student','学生','/student/table','','_blank','0','0','0','0','student_no,student_name,gender','student_no,student_name,gender','student_no,student_name,gender',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('140','教师','学生','student','学生详情','/student/view','','_blank','0','0','0','0','student_no,student_name,gender','student_no,student_name,gender','student_no,student_name,gender',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('141','教师','教师','teacher','教师','/teacher/table','','_blank','0','0','0','0','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('142','教师','教师','teacher','教师详情','/teacher/view','','_blank','0','0','0','0','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty','teacher_no,full_name,gender,name_of_department,lecturing_specialty',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('143','教师','学生信息','student_information','学生信息','/student_information/table','','_blank','0','1','0','1','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('144','教师','学生信息','student_information','学生详情','/student_information/view','','_blank','0','1','0','1','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name','student_no,student_name,gender,name_of_department,major,class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('145','教师','院系管理','department_management','院系管理','/department_management/table','','_blank','0','0','0','0','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('146','教师','院系管理','department_management','院系管理详情','/department_management/view','','_blank','0','0','0','0','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details','name_of_department,person_in_charge,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('147','教师','专业管理','professional_management','专业管理','/professional_management/table','','_blank','0','0','0','0','major_name','major_name','major_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('148','教师','专业管理','professional_management','专业管理详情','/professional_management/view','','_blank','0','0','0','0','major_name','major_name','major_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('149','教师','班级管理','class_management','班级管理','/class_management/table','','_blank','0','0','0','0','class_name','class_name','class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('150','教师','班级管理','class_management','班级管理详情','/class_management/view','','_blank','0','0','0','0','class_name','class_name','class_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('151','教师','课程信息','course_information','课程信息','/course_information/table','','_blank','1','1','1','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{"can_show_comment":true}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('152','教师','课程信息','course_information','课程详情','/course_information/view','','_blank','1','1','1','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('153','教师','课程信息','course_information','课程信息','/course_information/list','top','_blank','1','1','1','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('154','教师','课程信息','course_information','课程详情','/course_information/details','','_blank','1','1','1','1','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details','course_no,course_name,cover,class_location,start_time,end_time,teacher_no,full_name,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('155','教师','教室管理','classroom_management','教室管理','/classroom_management/table','','_blank','0','0','0','0','classroom_name,floor','classroom_name,floor','classroom_name,floor',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('156','教师','教室管理','classroom_management','教室管理详情','/classroom_management/view','','_blank','0','0','0','0','classroom_name,floor','classroom_name,floor','classroom_name,floor',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('157','教师','选课信息','course_selection_information','选课信息','/course_selection_information/table','','_blank','0','1','0','1','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('158','教师','选课信息','course_selection_information','选课详情','/course_selection_information/view','','_blank','0','1','0','1','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('159','教师','选课信息','course_selection_information','选课信息','/course_selection_information/edit','','_blank','0','0','0','0','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes','course_name,class_location,start_time,end_time,teacher_no,student_no,student_name,course_selection_time,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('160','教师','课程测试','course_test','课程测试','/course_test/table','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('161','教师','课程测试','course_test','课程详情','/course_test/view','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements','course_name,teacher_no,student_no,student_name,test_name,release_time,test_content,description_of_requirements',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('162','教师','提交测试','submit_test','提交测试','/submit_test/table','','_blank','0','1','0','1','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('163','教师','提交测试','submit_test','提交详情','/submit_test/view','','_blank','0','1','0','1','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks','course_name,teacher_no,student_no,student_name,test_name,release_time,submission_time,related_attachments,remarks',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('164','教师','成绩录入','score_entry','成绩录入','/score_entry/table','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('165','教师','成绩录入','score_entry','录入详情','/score_entry/view','','_blank','1','1','1','1','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes','course_name,teacher_no,student_no,student_name,test_name,release_time,test_score,annotation_notes',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('166','教师','排课管理','course_scheduling_management','排课管理','/course_scheduling_management/table','','_blank','0','1','0','1','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('167','教师','排课管理','course_scheduling_management','排课管理详情','/course_scheduling_management/view','','_blank','0','1','0','1','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name','title,course_name,class_location,start_time,end_time,teacher_no,full_name',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('168','教师','课表管理','schedule_management','课表管理','/schedule_management/table','','_blank','0','1','0','1','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('169','教师','课表管理','schedule_management','课表详情','/schedule_management/view','','_blank','0','1','0','1','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8','title,date,the_first_class,the_second_class,the_third_class,the_fourth_class,section_5,section_6,section_7,section_8',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('170','教师','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('171','教师','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('172','教师','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('173','教师','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('174','教师','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('175','教师','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('176','教师','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('177','教师','新闻','article','校园资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('178','教师','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('179','教师','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('180','教师','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('181','教师','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('182','教师','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('183','教师','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `auth` values ('184','教师','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-03-05 23:05:22.0','2023-03-05 23:05:22.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `user_group` values ('3','100','学生',null,'student','student_id','0','3','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `user_group` values ('4','100','教师',null,'teacher','teacher_id','0','0','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1620966404972871680.jpg','784','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1620966354825773056.jpg','649','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1620966244033232897.jpg','106','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
insert into `article` values ('1','国家职业教育智慧教育平台已接入6628门精品在线开放课程','课程','221','0','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0',null,null,null,'<p>	<span style="color: rgb(77, 79, 83);">北京商报讯（记者&nbsp;赵博宇）11月30日，教育部披露职业教育数字化进展情况。据介绍，3月28日，“国家职业教育智慧教育平台”正式上线，6月底平台完成迭代升级。目前平台已接入国家级、省级专业教学资源库1014个，精品在线开放课程6628门，视频公开课2222门。平台现有各类资源556万余条，其中，视频47万余条，图文13万余条。平台目前累计访问30.98亿人次，总访客2.77亿人。</span></p>','/api/upload/1605385205361672192.jpg',null);
insert into `article` values ('2','湖南机电职院三门课程获2022年职业教育国家在线精品课程遴选公示','课程','843','0','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0',null,null,null,'<p><span style="color: rgb(0, 0, 0);"> </span><strong>红网时刻新闻12月16日讯</strong>（通讯员 冉成科 刘琳 麻之语）12月15日，教育部公示了2022年职业教育国家在线精品课程遴选结果。湖南机电职业技术学院经济贸易学院（二级学院）黄亚宇教授主持的《经济 法》、信息工程学院（二级学院）郝丽波副教授主持的《APP应用程序开发》、机械工程学院（二级学院）燕峰副教授主持的《数控车床编程与加工》三门课程入选，该校在线精品课程建设获得国家级荣誉的突破。湖南机电职院《经济法》团队课程设计科学，教学目标清晰，数字化教学资源丰富，推进教育数字化战略行动积极有效，教师团队的师德师风、教学能力与数字素养带动了深刻生动的“课堂革命”。《数控 车床编程与加工》有机融入思想政治教育元素，以引导学生树立崇尚技术、严谨细致、追求卓越、精益求精的匠心品质为主线，融入新技术、新工艺、新规范，优化课程设计和教学实施。《APP应用程序开发》课程面向移动应用开发程序员岗位，对接《移动应用开发》1+X证书及“移动应用软件开发”赛项要求，充分发挥前沿信息技术的放大、叠加、倍增作用，将信息技术融入教学活动中，提高人才培养的针对性。湖南机电职院坚持开发形式多样的数字化课程资源，创新线上线下混合式教学，多维度考核评价在线课程，推动现代信息技术与教育教学的深度融合，职业教育在线精品课程建设工作不断完善并取得新的突 破。</p>','/api/upload/1605384248573820929.jpg','在线课程');
insert into `article` values ('3','【喜报】寿光职教中心两门课程被山东推荐参评2022年职业教育国家在线精品课程 2022年12月16日 10:42 商讯 ','课程','541','0','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0',null,null,null,'<p>根据教育部办公厅《关于开展2022年职业教育国家在线精品课程遴选工作的通知》和《山东省教育厅关于开展2022年职业教育国家在线精品课程遴选工作的通知》要求，寿光职教中心组织相关课程团队积极申报，经专家评审，申报的3门课程全部入选2022年山东省职业教育在线精品课程，其中2门课程为2022年职业教育国家在线精品课程山东拟推荐课程（山东拟推荐中职课程22门）。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/crawl/790/w550h240/20221216/86f2-86a33cca1f6f4ca32efc9fa3653a02e8.jpg"></p><p>此次在线精品课程评选，是教育部提质培优项目，注重课程资源质量与学习数据的真实性。一直以来，寿光职教中心将课程建设作为教学提质升级的重要抓手，自实施混合教学改革以来，积极组织教师培训，建设混合课程，将线上教学活动纳入日常考核，有力契合了在线精品课程的指导思想与评价指标，切实提升了教学质量。学校将以此次在线精品课程评选为契机，进一步深化课程改革，加强对在线课程的指导、评价与改进，提升教学质量，深化内涵建设，以优质课程赋能学校高质量发展。</p><p>来源：寿光职教中心</p>','/api/upload/1605384652929892353.jpg',null);
insert into `article` values ('4','山东85门！2022职业教育国家在线精品课程公示名单来啦','课程','952','0','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0',null,null,null,'<p>日前，教育部发布《关于2022年职业教育国家在线精品课程遴选结果的公示》，确定了1160门2022年职业教育国家在线精品课程，其中山东有85门入选。《公示》的具体内容，随小编一起来看~</p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20221216s/162/w640h322/20221216/b604-49710aa5cd4676928571f721040d98b2.png"></p><p><strong>关于2022年职业教育国家在线精品课程遴选结果的公示</strong></p><p><br></p><p>根据《教育部办公厅关于开展2022年职业教育国家在线精品课程遴选工作的通知》（教职成厅函〔2022〕18号）要求，在各省级教育行政部门和全国行业职业教育教学指导委员会、教育部职业院校教学（教育）指导委员会推荐的基础上，经组织专家遴选，确定了1160门2022年职业教育国家在线精品课程（名单见附件），现予以公示，公示期为2022年12月15日至12月21日。</p><p>公示期内，如有异议，请以书面形式反映。以单位名义反映的须加盖本单位公章，以个人名义反映的应署真实姓名、身份证号，写明联系电话。反映情况的书面意见请于2022年12月21日24时之前通过信函邮寄，或以电子邮件方式发送至电子邮箱，逾期及匿名反映不予受理。</p><p>联系电话：010-66096266</p><p>电子邮箱：jxjc@moe.edu.cn</p><p>通讯地址：北京市西城区大木仓胡同37号教育部职业教育与成人教育司（邮政编码：100816）</p><p class="ql-align-center"><strong>2022年职业教育国家在线精品课程</strong></p><p class="ql-align-center"><strong>公示名单</strong></p><p><br></p>','/api/upload/1605384815853436928.jpg',null);
insert into `article` values ('5','关于2022年职业教育国家在线精品课程遴选结果的公示','课程','722','0','2023-03-05 23:05:23.0','2023-03-05 23:05:23.0',null,null,null,'<p>根据《教育部办公厅关于开展2022年职业教育国家在线精品课程遴选工作的通知》（教职成厅函〔2022〕18号）要求，在各省级教育行政部门和全国行业职业教育教学指导委员会、教育部职业院校教学（教育）指导委员会推荐的基础上，经组织专家遴选，确定了1160门2022年职业教育国家在线精品课程（名单见附件），现予以公示，公示期为2022年12月15日至12月21日。</p><p>公示期内，如有异议，请以书面形式反映。以单位名义反映的须加盖本单位公章，以个人名义反映的应署真实姓名、身份证号，写明联系电话。反映情况的书面意见请于2022年12月21日24时之前通过信函邮寄，或以电子邮件方式发送至电子邮箱，逾期及匿名反映不予受理。</p><p>联系电话：010-66096266</p><p>电子邮箱：jxjc@moe.edu.cn</p><p>通讯地址：北京市西城区大木仓胡同37号教育部职业教育与成人教育司（邮政编码：100816）</p>','/api/upload/1605385029796495361.jpg',null);
insert into `article_type` values ('1','100','课程','0',null,null,null,'2023-03-05 23:05:23.0','2023-03-05 23:05:23.0');
