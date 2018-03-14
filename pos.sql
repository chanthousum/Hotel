/*
Navicat MySQL Data Transfer

Source Server         : PHP
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : pos

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-02-14 07:32:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tblcategory`
-- ----------------------------
DROP TABLE IF EXISTS `tblcategory`;
CREATE TABLE `tblcategory` (
  `CategoryID` int(11) NOT NULL DEFAULT '0',
  `CategoryName` varchar(255) DEFAULT NULL,
  `Active` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcategory
-- ----------------------------
INSERT INTO `tblcategory` VALUES ('1', 'Soft Drink', 'Yes');
INSERT INTO `tblcategory` VALUES ('2', 'Beer', 'Yes');
INSERT INTO `tblcategory` VALUES ('3', 'Food', 'Yes');

-- ----------------------------
-- Table structure for `tblorder`
-- ----------------------------
DROP TABLE IF EXISTS `tblorder`;
CREATE TABLE `tblorder` (
  `OrderID` int(11) NOT NULL DEFAULT '0',
  `OrderDate` date DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblorder
-- ----------------------------
INSERT INTO `tblorder` VALUES ('1', null, null);

-- ----------------------------
-- Table structure for `tblorderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `tblorderdetail`;
CREATE TABLE `tblorderdetail` (
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  KEY `ProductID` (`ProductID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `tblorderdetail_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `tblproduct` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblorderdetail_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `tblorder` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblorderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `tblproduct`
-- ----------------------------
DROP TABLE IF EXISTS `tblproduct`;
CREATE TABLE `tblproduct` (
  `ProductID` int(11) NOT NULL DEFAULT '0',
  `Barcode` varchar(255) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `PriceIn` float DEFAULT NULL,
  `PriceOut` float DEFAULT NULL,
  `Images` varchar(255) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `tblproduct_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `tblcategory` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblproduct
-- ----------------------------
INSERT INTO `tblproduct` VALUES ('1', '1', 'CoCaCola Can', '200', '0.4', '0.5', 'E:\\ALL DOCUMENTS\\All Projects\\Project Java\\POS\\Images\\CoCaCola-Can.png', '1', '1');

-- ----------------------------
-- Table structure for `tbluserlogin`
-- ----------------------------
DROP TABLE IF EXISTS `tbluserlogin`;
CREATE TABLE `tbluserlogin` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbluserlogin
-- ----------------------------
INSERT INTO `tbluserlogin` VALUES ('1', 'chanthou', '1');
INSERT INTO `tbluserlogin` VALUES ('2', 'sarim', '1');
