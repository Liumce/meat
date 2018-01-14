/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : meat

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2017-12-26 08:31:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '政策法规', '用于添加政策法规类内容');
INSERT INTO `t_category` VALUES ('2', '食品咨询', '');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL COMMENT '文章的id',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '评论人电话',
  `content` text NOT NULL COMMENT '评论内容',
  `fdate` datetime NOT NULL COMMENT '评论时间',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '评论状态，未审核为0，审核通过为1，审核不通过为2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_post`
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL COMMENT '栏目id',
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext NOT NULL COMMENT '正文',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '作者',
  `fdate` datetime NOT NULL COMMENT '发表时间',
  `udate` datetime DEFAULT NULL COMMENT '修改时间',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT '发布时的ip地址',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`),
  KEY `fk_post_category_id` (`category_id`),
  CONSTRAINT `fk_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_post
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'xx', '123456', null, null);
