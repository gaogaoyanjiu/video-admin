

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bgm
-- ----------------------------
DROP TABLE IF EXISTS `bgm`;
CREATE TABLE `bgm` (
  `id` varchar(64) NOT NULL,
  `author` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL COMMENT '播放地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bgm
-- ----------------------------
INSERT INTO `bgm` VALUES ('18102624D6234G0H', '音乐001', '音乐001', '/upload/videos_bgm/001.mp3');
INSERT INTO `bgm` VALUES ('181026255BSB5Y5P', '音乐002', '音乐002', '/upload/videos_bgm/002测试.mp3');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` varchar(20) NOT NULL,
  `father_comment_id` varchar(20) DEFAULT NULL,
  `to_user_id` varchar(20) DEFAULT NULL,
  `video_id` varchar(20) NOT NULL COMMENT '视频id',
  `from_user_id` varchar(20) NOT NULL COMMENT '留言者，评论的用户id',
  `comment` text NOT NULL COMMENT '评论内容',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程评论表';

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for search_records
-- ----------------------------
DROP TABLE IF EXISTS `search_records`;
CREATE TABLE `search_records` (
  `id` varchar(64) NOT NULL,
  `content` varchar(255) NOT NULL COMMENT '搜索的内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='视频搜索的记录表';

-- ----------------------------
-- Records of search_records
-- ----------------------------
INSERT INTO `search_records` VALUES ('1', 'spring');
INSERT INTO `search_records` VALUES ('18051309YBCMHYRP', '大数据');
INSERT INTO `search_records` VALUES ('1805130DAXX58ARP', '大数据');
INSERT INTO `search_records` VALUES ('1805130DMG6P0ZC0', '大数据');
INSERT INTO `search_records` VALUES ('1805130FNGHD3B0H', 'spring');
INSERT INTO `search_records` VALUES ('180513C94W152Z7C', 'java');
INSERT INTO `search_records` VALUES ('180513DXNT7SY04H', '大数据');
INSERT INTO `search_records` VALUES ('2', 'spring');
INSERT INTO `search_records` VALUES ('3', 'spring');
INSERT INTO `search_records` VALUES ('317213433814581248', 'zookeeper');
INSERT INTO `search_records` VALUES ('317228158319329280', 'java');
INSERT INTO `search_records` VALUES ('317228290433613824', 'java');
INSERT INTO `search_records` VALUES ('317228409834962944', 'spring');
INSERT INTO `search_records` VALUES ('317228524723240960', '大数据');
INSERT INTO `search_records` VALUES ('317228595856539648', 'zookeeper');
INSERT INTO `search_records` VALUES ('317229129619472384', 'zookeeper');
INSERT INTO `search_records` VALUES ('317229232759504896', '大数据');
INSERT INTO `search_records` VALUES ('317229402419101696', 'zookeeper');
INSERT INTO `search_records` VALUES ('317229545245638656', 'zookeeper');
INSERT INTO `search_records` VALUES ('317229622980771840', 'zookeeper');
INSERT INTO `search_records` VALUES ('317236545612414976', 'java');
INSERT INTO `search_records` VALUES ('317236591537946624', 'zookeeper');
INSERT INTO `search_records` VALUES ('317236612784193536', 'spring');
INSERT INTO `search_records` VALUES ('317236937446391808', '大数据');
INSERT INTO `search_records` VALUES ('317236955412692992', '大数据');
INSERT INTO `search_records` VALUES ('317237378146107392', 'springboot');
INSERT INTO `search_records` VALUES ('317237438776868864', 'spring');
INSERT INTO `search_records` VALUES ('317237732961157120', 'java');
INSERT INTO `search_records` VALUES ('317237816685756416', 'zookeeper');
INSERT INTO `search_records` VALUES ('317239954474270720', '哈哈哈');
INSERT INTO `search_records` VALUES ('317241004142886912', 'spring');
INSERT INTO `search_records` VALUES ('317241022434246656', '哈哈哈');
INSERT INTO `search_records` VALUES ('317241039458926592', '大数据');
INSERT INTO `search_records` VALUES ('317241387628101632', '大数据');
INSERT INTO `search_records` VALUES ('317241422346452992', '大数据');
INSERT INTO `search_records` VALUES ('317241468563488768', '哈哈哈');
INSERT INTO `search_records` VALUES ('317241577174990848', '大数据');
INSERT INTO `search_records` VALUES ('317241585204985856', '大数据');
INSERT INTO `search_records` VALUES ('317241590733078528', '大数据');
INSERT INTO `search_records` VALUES ('317241595615248384', '哈哈哈');
INSERT INTO `search_records` VALUES ('317241604926603264', 'springboot');
INSERT INTO `search_records` VALUES ('317241623333306368', 'java');
INSERT INTO `search_records` VALUES ('317241638644613120', 'springboot');
INSERT INTO `search_records` VALUES ('5', 'springboot');
INSERT INTO `search_records` VALUES ('6', 'springboot');
INSERT INTO `search_records` VALUES ('7', 'zookeeper');
INSERT INTO `search_records` VALUES ('8', 'zookeeper');
INSERT INTO `search_records` VALUES ('9', 'zookeeper');

-- ----------------------------
-- Table structure for tv_play
-- ----------------------------
DROP TABLE IF EXISTS `tv_play`;
CREATE TABLE `tv_play` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tv_name` varchar(100) DEFAULT NULL COMMENT '电视剧名称',
  `tv_episodes` varchar(20) DEFAULT NULL COMMENT '剧集',
  `tv_createtime` datetime NOT NULL COMMENT '创建时间',
  `tv_updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `tv_isdel` char(1) DEFAULT NULL COMMENT '是否删除(1是，0否)',
  `tv_publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `tv_type` varchar(20) DEFAULT NULL COMMENT '影片分类',
  `tv_is_recommend` char(1) DEFAULT NULL COMMENT '是否推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电视剧表';

-- ----------------------------
-- Records of tv_play
-- ----------------------------

-- ----------------------------
-- Table structure for t_film
-- ----------------------------
DROP TABLE IF EXISTS `t_film`;
CREATE TABLE `t_film` (
  `id` varchar(255) NOT NULL,
  `actor` varchar(255) DEFAULT NULL,
  `cataLogName` varchar(255) DEFAULT NULL,
  `cataLog_id` varchar(255) DEFAULT NULL,
  `evaluation` double NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `isUse` int(11) NOT NULL,
  `locName` varchar(255) DEFAULT NULL,
  `loc_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `onDecade` varchar(255) DEFAULT NULL,
  `plot` text,
  `resolution` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `subClassName` varchar(255) DEFAULT NULL,
  `subClass_id` varchar(255) DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `type_id` varchar(255) DEFAULT NULL,
  `updateTime` varchar(255) DEFAULT NULL,
  `isVip` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_film
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(64) NOT NULL,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `face_image` varchar(255) DEFAULT NULL COMMENT '我的头像，如果没有默认给一张',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `fans_counts` int(11) DEFAULT '0' COMMENT '我的粉丝数量',
  `follow_counts` int(11) DEFAULT '0' COMMENT '我关注的人总数',
  `receive_like_counts` int(11) DEFAULT '0' COMMENT '我接受到的赞美/收藏 的数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('180425CFA4RB6T0H', 'zhangsan', 'kU8h64TG/bK2Y91vRT9lyg==', '/180425CFA4RB6T0H/face/111.jpg', 'zhangsan', '0', '0', '0');
INSERT INTO `users` VALUES ('316593590182608896', 'admin', '4QrcOUm6Wau+VuBX8g+IPg==', '/316593590182608896/face/tmp_1fe09b8a07ec94a4ea1813dd3b0ebf0df5d1c25f3aff7add.jpg', 'admin', '0', '0', '1');
INSERT INTO `users` VALUES ('334', 'test', '2', '2', '2', '0', '8', '0');

-- ----------------------------
-- Table structure for users_fans
-- ----------------------------
DROP TABLE IF EXISTS `users_fans`;
CREATE TABLE `users_fans` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL COMMENT '用户',
  `fan_id` varchar(64) NOT NULL COMMENT '粉丝',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`fan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户粉丝关联关系表';

-- ----------------------------
-- Records of users_fans
-- ----------------------------

-- ----------------------------
-- Table structure for users_like_videos
-- ----------------------------
DROP TABLE IF EXISTS `users_like_videos`;
CREATE TABLE `users_like_videos` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL COMMENT '用户',
  `video_id` varchar(64) NOT NULL COMMENT '视频',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_video_rel` (`user_id`,`video_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户喜欢的/赞过的视频';

-- ----------------------------
-- Records of users_like_videos
-- ----------------------------
INSERT INTO `users_like_videos` VALUES ('317438905427165184', '316593590182608896', '317436266744381440');

-- ----------------------------
-- Table structure for users_report
-- ----------------------------
DROP TABLE IF EXISTS `users_report`;
CREATE TABLE `users_report` (
  `id` varchar(64) NOT NULL,
  `deal_user_id` varchar(64) NOT NULL COMMENT '被举报用户id',
  `deal_video_id` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL COMMENT '类型标题，让用户选择，详情见 枚举',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `userid` varchar(64) NOT NULL COMMENT '举报人的id',
  `create_date` datetime NOT NULL COMMENT '举报时间',
  `is_del` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='举报用户表';

-- ----------------------------
-- Records of users_report
-- ----------------------------
INSERT INTO `users_report` VALUES ('180521FZ501ABDYW', '180425CFA4RB6T0H', '317434935453417472', '引人不适', '不合时宜的视频', '316593590182608896', '2018-05-21 20:58:35', '0');
INSERT INTO `users_report` VALUES ('180521FZK44ZRWX4', '180425CFA4RB6T0H', '317436378520485888', '引人不适', '不合时宜的视频', '316593590182608896', '2018-05-21 20:59:53', '0');
INSERT INTO `users_report` VALUES ('180521FZR1TYRTXP', '180425CFA4RB6T0H', '317436266744381440', '辱骂谩骂', '不合时宜的视频', '316593590182608896', '2018-05-21 21:00:18', '0');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL COMMENT '发布者id',
  `audio_id` varchar(64) DEFAULT NULL COMMENT '用户使用音频的信息',
  `video_desc` varchar(128) DEFAULT NULL COMMENT '视频描述',
  `video_path` varchar(255) NOT NULL COMMENT '视频存放的路径',
  `video_seconds` float(6,2) DEFAULT NULL COMMENT '视频秒数',
  `video_width` int(6) DEFAULT NULL COMMENT '视频宽度',
  `video_height` int(6) DEFAULT NULL COMMENT '视频高度',
  `cover_path` varchar(255) DEFAULT NULL COMMENT '视频封面图',
  `like_counts` bigint(20) NOT NULL DEFAULT '0' COMMENT '喜欢/赞美的数量',
  `status` int(1) NOT NULL COMMENT '视频状态：\r\n1、发布成功\r\n2、禁止播放，管理员操作',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='视频信息表';

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('317434935453417472', '180425CFA4RB6T0H', '', '测试123', '/316593590182608896/video/tmp_289a8d765fa9de8e144c0351c76a0ec7e1991334fec863d4.mp4', '15.00', '272', '480', '/316593590182608896/video/cover/tmp_289a8d765fa9de8e144c0351c76a0ec7e1991334fec863d4.jpg', '0', '1', '2018-10-11 17:47:51');
INSERT INTO `videos` VALUES ('317436266744381440', '180425CFA4RB6T0H', '', '', '/316593590182608896/video/tmp_e71f56a6e561593eea4b3f82c4c286a26b50fc53deae5eb1.mp4', '15.00', '272', '480', '/316593590182608896/video/cover/tmp_e71f56a6e561593eea4b3f82c4c286a26b50fc53deae5eb1.jpg', '1', '2', '2018-10-11 17:58:25');
INSERT INTO `videos` VALUES ('317436378520485888', '180425CFA4RB6T0H', '', '', '/316593590182608896/video/tmp_27bc1b8c726fa96ea55d634f8c01ba2780111bf05820c193.mp4', '26.00', '272', '480', '/316593590182608896/video/cover/tmp_27bc1b8c726fa96ea55d634f8c01ba2780111bf05820c193.jpg', '0', '2', '2018-10-11 17:59:19');
INSERT INTO `videos` VALUES ('317438997882208256', '180425CFA4RB6T0H', '', '', '/316593590182608896/video/tmp_7a434f64a23b17d37af8f6c69cb7c9fb8343275d689ef53b.mp4', '30.00', '272', '496', '/316593590182608896/video/cover/tmp_7a434f64a23b17d37af8f6c69cb7c9fb8343275d689ef53b.jpg', '0', '1', '2018-10-11 18:20:08');
INSERT INTO `videos` VALUES ('317439468919324672', '316593590182608896', '', '', '/316593590182608896/video/tmp_db59aa249ef36415440cfcfcdef921088ea8731219edcd2f.mp4', '19.00', '480', '272', '/316593590182608896/video/cover/tmp_db59aa249ef36415440cfcfcdef921088ea8731219edcd2f.jpg', '0', '1', '2018-10-11 18:23:52');
INSERT INTO `videos` VALUES ('317439577069453312', '316593590182608896', '', '', '/316593590182608896/video/tmp_432c2ddb97a9ddb6efab6ae2f2dfc0804880d4d6fba86a49.mp4', '12.00', '272', '480', '/316593590182608896/video/cover/tmp_432c2ddb97a9ddb6efab6ae2f2dfc0804880d4d6fba86a49.jpg', '0', '1', '2018-10-11 18:24:44');
INSERT INTO `videos` VALUES ('317439621839454208', '316593590182608896', '', '', '/316593590182608896/video/tmp_5a0c25d3e242ec2eb8e9f979455a2a898522c8ebc5277d6d.mp4', '15.00', '480', '272', '/316593590182608896/video/cover/tmp_5a0c25d3e242ec2eb8e9f979455a2a898522c8ebc5277d6d.jpg', '0', '1', '2018-10-11 18:25:05');
INSERT INTO `videos` VALUES ('317439979972198400', '316593590182608896', '', '', '/316593590182608896/video/tmp_4f09090897205313f00b6c9fb0ec9e1db1e33236cd576273.mp4', '29.00', '272', '368', '/316593590182608896/video/cover/tmp_4f09090897205313f00b6c9fb0ec9e1db1e33236cd576273.jpg', '0', '1', '2018-10-11 18:27:56');
INSERT INTO `videos` VALUES ('317441995444322304', '316593590182608896', '001', '', '/316593590182608896/video/cover/0a90e83da5fc40dc939e9bec26c21a5a.mp4', '20.48', '1920', '1080', '/316593590182608896/video/cover/wx382cdc22a8ddbafc.jpg', '0', '1', '2018-10-11 18:43:57');
INSERT INTO `videos` VALUES ('317454540813107200', '316593590182608896', '', '', '/316593590182608896/video/tmp_235620c196b2b09acd22df77f5b7e7a17c895303c0834ea5.mp4', '18.00', '272', '480', '/316593590182608896/video/cover/tmp_235620c196b2b09acd22df77f5b7e7a17c895303c0834ea5.jpg', '0', '1', '2018-10-11 20:23:39');
INSERT INTO `videos` VALUES ('317454629434556416', '316593590182608896', '', '', '/316593590182608896/video/tmp_9d7f48461703b487e9125494c849a1de7d5d0e171c5a2cd3.mp4', '29.00', '368', '640', '/316593590182608896/video/cover/tmp_9d7f48461703b487e9125494c849a1de7d5d0e171c5a2cd3.jpg', '0', '1', '2018-10-11 20:24:21');
