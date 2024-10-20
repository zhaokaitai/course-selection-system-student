/*
 Navicat Premium Data Transfer

 Source Server         : mysqlHost
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : select-course

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 20/10/2024 16:01:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` bigint NOT NULL,
  `college_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学院名称',
  `college_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学院代码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '管理科学与信息工程学院', 'GK');
INSERT INTO `college` VALUES (2, '旅游学院', 'LV');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程代码',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称\r\n\r\n',
  `course_enname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名称',
  `college_id` bigint NULL DEFAULT NULL COMMENT '开课学院',
  `total_time` bigint NULL DEFAULT NULL COMMENT '总课时',
  `credit` tinyint NULL DEFAULT NULL COMMENT '学分',
  `begin_term` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开课学期',
  `course_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程类别',
  `course_character` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程性质',
  `teacher_model` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教学模式',
  `score_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成绩录入级别',
  `class_num` tinyint NULL DEFAULT NULL COMMENT '教学班个数',
  `is_listing` tinyint NULL DEFAULT NULL COMMENT '可否申请免听(0-Y 1-N)',
  `is_totalexam` tinyint NULL DEFAULT NULL COMMENT '是否统一安排考试(0-Y 1-N)',
  `is_totalreexam` tinyint NULL DEFAULT NULL COMMENT '是否统一安排补考（0-Y 1-N)',
  `is_reexam` tinyint NULL DEFAULT NULL COMMENT '是否可以补考(0-Y 1-N)',
  `is_practice` tinyint NULL DEFAULT NULL COMMENT '是否实践课(0-Y 1-N)',
  `oo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '面向对象',
  `week_time` tinyint NULL DEFAULT NULL COMMENT '周学时',
  `advice_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预修课',
  `course_introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程简介',
  `teachering_programmer` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教学大纲',
  `course_ownership` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程归属',
  `book_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教材编号',
  PRIMARY KEY (`course_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('GK_JK_001', '51单片机', NULL, 1, 51, 4, '4', '专业课', '必修', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试课程描述', '测试课程大纲', NULL, NULL);
INSERT INTO `course` VALUES ('GK_JK_002', 'UML建模语言', NULL, 1, 34, 3, '3', '专业课', '必修', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试课程描述', '测试课程大纲', NULL, NULL);
INSERT INTO `course` VALUES ('GK_JK_003', '软件工程综合实践', NULL, 1, 51, 4, '4', '专业课', '必修', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GK_JK_002', '测试课程描述', '测试课程大纲', NULL, NULL);
INSERT INTO `course` VALUES ('GK_JK_004', 'JAVAEE', NULL, 1, 34, 4, '4', '专业课', '必修', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JavaEE（现在称为Jakarta EE）是一个基于Java的为企业级应用开发提供的一套规范和API。以下是一个JavaEE课程的大纲示例，适合初学者到中级开发者：', 'JavaEE（现在称为Jakarta EE）是一个基于Java的为企业级应用开发提供的一套规范和API。以下是一个JavaEE课程的大纲示例，适合初学者到中级开发者：', NULL, NULL);
INSERT INTO `course` VALUES ('GX_001', '旅游学院测试', NULL, 2, 34, 2, '4', '校选课', '选修', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '这是课程描述', '这是教学大纲', NULL, NULL);

-- ----------------------------
-- Table structure for learning_lesson
-- ----------------------------
DROP TABLE IF EXISTS `learning_lesson`;
CREATE TABLE `learning_lesson`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_number` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `class_id` bigint NOT NULL COMMENT '教学班id',
  `teacher_id` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教工号',
  `id_optional` tinyint NULL DEFAULT NULL COMMENT '是否自选（0-是 1不是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of learning_lesson
-- ----------------------------

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `major_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业名称',
  `major_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业代码',
  `college_id` bigint NULL DEFAULT NULL COMMENT '所属学院',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '计算机科学与技术', 'JK', 1);
INSERT INTO `major` VALUES (2, '网络工程', 'WLGC', 1);
INSERT INTO `major` VALUES (3, '旅游管理', 'LYGL', 2);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `manager_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `department` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属单位',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for operation_record
-- ----------------------------
DROP TABLE IF EXISTS `operation_record`;
CREATE TABLE `operation_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '选课记录id',
  `student_number` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生名称',
  `course_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程id',
  `course_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  `course_operation` tinyint NOT NULL COMMENT '选课操作（0-选课 1-退课）',
  `time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of operation_record
-- ----------------------------
INSERT INTO `operation_record` VALUES (3, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-10 14:49:45');
INSERT INTO `operation_record` VALUES (4, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-10 15:36:04');
INSERT INTO `operation_record` VALUES (5, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-10 15:47:52');
INSERT INTO `operation_record` VALUES (6, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 09:41:41');
INSERT INTO `operation_record` VALUES (7, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 09:44:32');
INSERT INTO `operation_record` VALUES (8, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 09:44:39');
INSERT INTO `operation_record` VALUES (9, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 09:44:40');
INSERT INTO `operation_record` VALUES (10, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 09:44:42');
INSERT INTO `operation_record` VALUES (11, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 09:44:51');
INSERT INTO `operation_record` VALUES (12, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 09:48:14');
INSERT INTO `operation_record` VALUES (13, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 09:48:17');
INSERT INTO `operation_record` VALUES (14, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 09:50:58');
INSERT INTO `operation_record` VALUES (15, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 09:51:41');
INSERT INTO `operation_record` VALUES (16, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 15:18:37');
INSERT INTO `operation_record` VALUES (17, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 15:19:26');
INSERT INTO `operation_record` VALUES (18, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 15:31:17');
INSERT INTO `operation_record` VALUES (19, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 15:32:05');
INSERT INTO `operation_record` VALUES (20, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 15:32:23');
INSERT INTO `operation_record` VALUES (21, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 15:32:23');
INSERT INTO `operation_record` VALUES (22, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 15:32:24');
INSERT INTO `operation_record` VALUES (23, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 15:38:00');
INSERT INTO `operation_record` VALUES (24, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 15:54:32');
INSERT INTO `operation_record` VALUES (25, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 15:54:37');
INSERT INTO `operation_record` VALUES (26, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 15:54:41');
INSERT INTO `operation_record` VALUES (27, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 16:25:29');
INSERT INTO `operation_record` VALUES (28, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 16:26:00');
INSERT INTO `operation_record` VALUES (29, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 16:27:01');
INSERT INTO `operation_record` VALUES (30, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 16:27:13');
INSERT INTO `operation_record` VALUES (31, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 16:28:16');
INSERT INTO `operation_record` VALUES (32, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 16:28:19');
INSERT INTO `operation_record` VALUES (33, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 16:30:58');
INSERT INTO `operation_record` VALUES (34, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 16:31:02');
INSERT INTO `operation_record` VALUES (35, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 16:33:26');
INSERT INTO `operation_record` VALUES (36, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 16:33:30');
INSERT INTO `operation_record` VALUES (37, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 16:34:23');
INSERT INTO `operation_record` VALUES (38, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 16:41:00');
INSERT INTO `operation_record` VALUES (39, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 16:42:28');
INSERT INTO `operation_record` VALUES (40, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 16:42:30');
INSERT INTO `operation_record` VALUES (41, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 16:43:13');
INSERT INTO `operation_record` VALUES (42, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 16:44:10');
INSERT INTO `operation_record` VALUES (43, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 16:46:02');
INSERT INTO `operation_record` VALUES (44, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 16:46:04');
INSERT INTO `operation_record` VALUES (45, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 16:46:26');
INSERT INTO `operation_record` VALUES (46, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:01:31');
INSERT INTO `operation_record` VALUES (47, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:01:41');
INSERT INTO `operation_record` VALUES (48, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:04:25');
INSERT INTO `operation_record` VALUES (49, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:04:35');
INSERT INTO `operation_record` VALUES (50, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:05:29');
INSERT INTO `operation_record` VALUES (51, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:05:45');
INSERT INTO `operation_record` VALUES (52, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:05:54');
INSERT INTO `operation_record` VALUES (53, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:06:11');
INSERT INTO `operation_record` VALUES (54, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:06:13');
INSERT INTO `operation_record` VALUES (55, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:06:31');
INSERT INTO `operation_record` VALUES (56, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:06:33');
INSERT INTO `operation_record` VALUES (57, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:06:35');
INSERT INTO `operation_record` VALUES (58, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:06:40');
INSERT INTO `operation_record` VALUES (59, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:06:51');
INSERT INTO `operation_record` VALUES (60, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:06:53');
INSERT INTO `operation_record` VALUES (61, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:06:55');
INSERT INTO `operation_record` VALUES (62, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:06:57');
INSERT INTO `operation_record` VALUES (63, '202122450635', '曹哲', 'GK_JK_001', '51单片机', 0, '2024-10-16 22:07:52');
INSERT INTO `operation_record` VALUES (64, '202122450635', '曹哲', 'GK_JK_001', '51单片机', 0, '2024-10-16 22:08:12');
INSERT INTO `operation_record` VALUES (65, '202122450635', '曹哲', 'GK_JK_001', '51单片机', 1, '2024-10-16 22:09:05');
INSERT INTO `operation_record` VALUES (66, '202122450635', '曹哲', 'GK_JK_001', '51单片机', 1, '2024-10-16 22:09:07');
INSERT INTO `operation_record` VALUES (67, '202122450635', '曹哲', 'GK_JK_001', '51单片机', 0, '2024-10-16 22:09:17');
INSERT INTO `operation_record` VALUES (68, '202122450635', '曹哲', 'GK_JK_001', '51单片机', 0, '2024-10-16 22:10:13');
INSERT INTO `operation_record` VALUES (69, '202122450635', '曹哲', 'GK_JK_001', '51单片机', 1, '2024-10-16 22:10:30');
INSERT INTO `operation_record` VALUES (70, '202122450635', '曹哲', 'GK_JK_001', '51单片机', 1, '2024-10-16 22:10:32');
INSERT INTO `operation_record` VALUES (71, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:26:37');
INSERT INTO `operation_record` VALUES (72, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:26:44');
INSERT INTO `operation_record` VALUES (73, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:26:46');
INSERT INTO `operation_record` VALUES (74, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:26:52');
INSERT INTO `operation_record` VALUES (75, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:26:54');
INSERT INTO `operation_record` VALUES (76, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:28:17');
INSERT INTO `operation_record` VALUES (77, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:28:21');
INSERT INTO `operation_record` VALUES (78, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:28:40');
INSERT INTO `operation_record` VALUES (79, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:29:05');
INSERT INTO `operation_record` VALUES (80, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:29:07');
INSERT INTO `operation_record` VALUES (81, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:29:11');
INSERT INTO `operation_record` VALUES (82, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-16 22:30:25');
INSERT INTO `operation_record` VALUES (83, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:30:29');
INSERT INTO `operation_record` VALUES (84, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-16 22:30:31');
INSERT INTO `operation_record` VALUES (85, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-17 08:58:26');
INSERT INTO `operation_record` VALUES (86, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-17 09:21:02');
INSERT INTO `operation_record` VALUES (87, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-17 09:28:22');
INSERT INTO `operation_record` VALUES (88, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-18 19:18:26');
INSERT INTO `operation_record` VALUES (89, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-18 19:18:31');
INSERT INTO `operation_record` VALUES (90, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-18 19:18:40');
INSERT INTO `operation_record` VALUES (91, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-18 19:18:47');
INSERT INTO `operation_record` VALUES (92, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-18 19:18:50');
INSERT INTO `operation_record` VALUES (93, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-18 19:19:36');
INSERT INTO `operation_record` VALUES (94, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-18 19:19:49');
INSERT INTO `operation_record` VALUES (95, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-18 19:20:58');
INSERT INTO `operation_record` VALUES (96, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-18 19:21:30');
INSERT INTO `operation_record` VALUES (97, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-18 19:23:14');
INSERT INTO `operation_record` VALUES (98, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-18 19:23:34');
INSERT INTO `operation_record` VALUES (99, '202122450635', '曹哲', 'GK_JK_004', 'JAVAEE', 1, '2024-10-19 17:29:19');
INSERT INTO `operation_record` VALUES (100, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-19 17:29:21');
INSERT INTO `operation_record` VALUES (101, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-19 17:29:23');
INSERT INTO `operation_record` VALUES (102, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 08:32:17');
INSERT INTO `operation_record` VALUES (103, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 08:32:32');
INSERT INTO `operation_record` VALUES (104, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 08:33:00');
INSERT INTO `operation_record` VALUES (105, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 08:33:15');
INSERT INTO `operation_record` VALUES (106, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 08:34:47');
INSERT INTO `operation_record` VALUES (107, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 08:34:53');
INSERT INTO `operation_record` VALUES (108, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 08:35:32');
INSERT INTO `operation_record` VALUES (109, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 08:35:49');
INSERT INTO `operation_record` VALUES (110, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 08:51:17');
INSERT INTO `operation_record` VALUES (111, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 08:52:09');
INSERT INTO `operation_record` VALUES (112, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 08:52:12');
INSERT INTO `operation_record` VALUES (113, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 08:52:14');
INSERT INTO `operation_record` VALUES (114, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 08:53:25');
INSERT INTO `operation_record` VALUES (115, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 08:54:02');
INSERT INTO `operation_record` VALUES (116, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 08:54:16');
INSERT INTO `operation_record` VALUES (117, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 08:54:31');
INSERT INTO `operation_record` VALUES (118, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 08:54:34');
INSERT INTO `operation_record` VALUES (119, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 08:54:36');
INSERT INTO `operation_record` VALUES (120, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 08:55:59');
INSERT INTO `operation_record` VALUES (121, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 08:56:36');
INSERT INTO `operation_record` VALUES (122, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 08:57:33');
INSERT INTO `operation_record` VALUES (123, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 08:57:39');
INSERT INTO `operation_record` VALUES (124, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 08:58:52');
INSERT INTO `operation_record` VALUES (125, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 09:00:08');
INSERT INTO `operation_record` VALUES (126, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 09:04:06');
INSERT INTO `operation_record` VALUES (127, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 09:05:01');
INSERT INTO `operation_record` VALUES (128, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 09:07:06');
INSERT INTO `operation_record` VALUES (129, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 09:08:05');
INSERT INTO `operation_record` VALUES (130, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 09:08:37');
INSERT INTO `operation_record` VALUES (131, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 09:08:39');
INSERT INTO `operation_record` VALUES (132, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 09:09:18');
INSERT INTO `operation_record` VALUES (133, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 09:10:15');
INSERT INTO `operation_record` VALUES (134, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 09:11:34');
INSERT INTO `operation_record` VALUES (135, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 09:12:06');
INSERT INTO `operation_record` VALUES (136, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 09:14:55');
INSERT INTO `operation_record` VALUES (137, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 09:15:01');
INSERT INTO `operation_record` VALUES (138, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 09:23:42');
INSERT INTO `operation_record` VALUES (139, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 09:23:53');
INSERT INTO `operation_record` VALUES (140, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 09:24:04');
INSERT INTO `operation_record` VALUES (141, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 09:24:07');
INSERT INTO `operation_record` VALUES (142, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 09:41:25');
INSERT INTO `operation_record` VALUES (143, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 09:41:28');
INSERT INTO `operation_record` VALUES (144, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 09:41:53');
INSERT INTO `operation_record` VALUES (145, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 09:42:07');
INSERT INTO `operation_record` VALUES (146, '202122450635', '曹哲', 'GK_JK_004', 'JAVAEE', 0, '2024-10-20 09:42:22');
INSERT INTO `operation_record` VALUES (147, '202122450635', '曹哲', 'GK_JK_004', 'JAVAEE', 1, '2024-10-20 09:49:43');
INSERT INTO `operation_record` VALUES (148, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 09:49:45');
INSERT INTO `operation_record` VALUES (149, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 09:49:47');
INSERT INTO `operation_record` VALUES (150, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 13:02:22');
INSERT INTO `operation_record` VALUES (151, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 14:35:34');
INSERT INTO `operation_record` VALUES (152, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 14:36:23');
INSERT INTO `operation_record` VALUES (153, '202122450635', '曹哲', 'GK_JK_003', '软件工程综合实践', 0, '2024-10-20 14:36:31');
INSERT INTO `operation_record` VALUES (154, '202122450635', '曹哲', 'GK_JK_004', 'JAVAEE', 0, '2024-10-20 14:40:04');
INSERT INTO `operation_record` VALUES (155, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 15:05:37');
INSERT INTO `operation_record` VALUES (156, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 15:07:06');
INSERT INTO `operation_record` VALUES (157, '202122450635', '曹哲', 'GK_JK_003', '软件工程综合实践', 1, '2024-10-20 15:07:28');
INSERT INTO `operation_record` VALUES (158, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 15:07:31');
INSERT INTO `operation_record` VALUES (159, '202122450635', '曹哲', 'GK_JK_004', 'JAVAEE', 1, '2024-10-20 15:07:33');
INSERT INTO `operation_record` VALUES (160, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 15:07:45');
INSERT INTO `operation_record` VALUES (161, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 15:07:55');
INSERT INTO `operation_record` VALUES (162, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 15:08:05');
INSERT INTO `operation_record` VALUES (163, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 15:08:09');
INSERT INTO `operation_record` VALUES (164, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 0, '2024-10-20 15:10:55');
INSERT INTO `operation_record` VALUES (165, '202122450635', '曹哲', 'GK_JK_004', 'JAVAEE', 0, '2024-10-20 15:11:03');
INSERT INTO `operation_record` VALUES (166, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 0, '2024-10-20 15:11:20');
INSERT INTO `operation_record` VALUES (167, '202122450635', '曹哲', 'GK_JK_002', 'UML建模语言', 1, '2024-10-20 15:11:43');
INSERT INTO `operation_record` VALUES (168, '202122450635', '曹哲', 'GK_JK_004', 'JAVAEE', 1, '2024-10-20 15:11:55');
INSERT INTO `operation_record` VALUES (169, '202122450635', '曹哲', 'GX_001', '旅游学院测试', 1, '2024-10-20 15:12:01');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_number` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `user_password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别',
  `avatar_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片',
  `user_spellname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名拼音',
  `user_enname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名称',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `college` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学院名称',
  `major` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业名称',
  `student_class` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '班级名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '入学日期',
  `grade` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年级',
  `train_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '培养方式',
  `student_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生类别',
  `train_level` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '培养层次',
  `college_id` bigint NULL DEFAULT NULL COMMENT '所属学院',
  `educational` tinyint NULL DEFAULT NULL COMMENT '学制',
  `dep_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系名称',
  `credit` int NULL DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`student_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('202122450635', 'e73f870283277526f6e169b0fbad575c', '曹哲', NULL, NULL, NULL, NULL, '18713193400', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacher_id` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教工号',
  `teacher_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教师姓名',
  `teacher_spellname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名拼音',
  `teacher_enname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名称',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别（0-女  1-男）',
  `unit` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所在单位',
  `education_backgroude` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最高学历',
  `work_time` int NULL DEFAULT NULL COMMENT '参加工作时间',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `research_methods` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '研究方向',
  `department` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '科室名称',
  `position` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职称',
  `teacher_introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教师简介',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('123456789', '张三', 'ZhangSan', 'John Zhang', 1, '管理科学与信息工程学院', '博士', 20210101, '13800138000', '人工智能', '软件工程系', '教授', '张三教授是人工智能领域的资深专家，具有丰富的教学与研究经验。', NULL);

-- ----------------------------
-- Table structure for teaching_class
-- ----------------------------
DROP TABLE IF EXISTS `teaching_class`;
CREATE TABLE `teaching_class`  (
  `id` bigint NOT NULL COMMENT '住建',
  `course_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程代码',
  `class_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教学班名称',
  `classroom` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上课教室',
  `class_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上课时间',
  `class_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上课地点',
  `selected_num` int NULL DEFAULT NULL COMMENT '已选人数',
  `capacity` int NULL DEFAULT NULL COMMENT '容量',
  `teacher_id` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教工号',
  `book_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教材编号',
  `current_tim` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前学年',
  `current_term` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前学期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teaching_class
-- ----------------------------
INSERT INTO `teaching_class` VALUES (1, 'GK_JK_002', 'uml教学1班', '北三教A203', '周三/1-2/1-17', '北三教A203', 90, 95, '123456789', '', '', '');
INSERT INTO `teaching_class` VALUES (2, 'GK_JK_002', 'uml教学2班', '北三教A205', '周五/1-2/1-17', '北三教A205', 90, 95, '123456789', NULL, NULL, NULL);
INSERT INTO `teaching_class` VALUES (3, 'GK_JK_001', '单片机教学1班', '北三教A205', '周一/3-5/1-17', '北三教A205', 95, 95, '123456789', NULL, NULL, NULL);
INSERT INTO `teaching_class` VALUES (4, 'GX_001', '测试1班', '北三教C122', '周五/1-2/1-9', '北三教C122', 105, 200, '123456789', NULL, NULL, NULL);
INSERT INTO `teaching_class` VALUES (5, 'GX_001', '测试2班', '北三教C122', '周四/1-2/10-17', '北三教C122', 100, 200, '123456789', NULL, NULL, NULL);
INSERT INTO `teaching_class` VALUES (6, 'GK_JK_004', 'javaEE1', '北三教B104', '周二/6-7/1-17', '北三教B104', 29, 50, '123456789', NULL, NULL, NULL);
INSERT INTO `teaching_class` VALUES (7, 'GK_JK_003', '软工实践教学班', '北三教C113', '周五/1-2/1-9', '北三教C113', 59, 60, '123456789', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for teaching_material
-- ----------------------------
DROP TABLE IF EXISTS `teaching_material`;
CREATE TABLE `teaching_material`  (
  `book_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教材编号',
  `book_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教材名称',
  `book_author` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教材作者',
  `press` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出版社',
  `version_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '版本号',
  `ISBN` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ISBN',
  `publication_date` datetime NULL DEFAULT NULL COMMENT '出版日期',
  PRIMARY KEY (`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teaching_material
-- ----------------------------

-- ----------------------------
-- Table structure for timeset
-- ----------------------------
DROP TABLE IF EXISTS `timeset`;
CREATE TABLE `timeset`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `num_select` tinyint NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of timeset
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
