/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.5.28 : Database - referapp
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`referapp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `referapp`;

/*Table structure for table `company_dtl` */

DROP TABLE IF EXISTS `company_dtl`;

CREATE TABLE `company_dtl` (
  `CompanyID` int(5) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(255) NOT NULL,
  `EmployeeStength` int(10) DEFAULT NULL,
  `CompanyUrl` varchar(255) DEFAULT NULL,
  `CMMLevel` int(1) DEFAULT NULL,
  `ReviewUrl` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `UpdatedBy` int(10) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `company_dtl` */

/*Table structure for table `technology_dtl` */

DROP TABLE IF EXISTS `technology_dtl`;

CREATE TABLE `technology_dtl` (
  `TechID` int(5) NOT NULL AUTO_INCREMENT,
  `TechnologyName` varchar(255) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedBy` int(11) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`TechID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `technology_dtl` */

/*Table structure for table `user_dtl` */

DROP TABLE IF EXISTS `user_dtl`;

SHOW CREATE TABLE user_dtl;

CREATE TABLE `user_dtl` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `PersonalEmailID` varchar(255) NOT NULL,
  `CorporateID` varchar(255) NOT NULL,
  `ContactNumber` int(10) NOT NULL,
  `LoginID` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `YOE` int(2) DEFAULT NULL,
  `IsPremium` tinyint(1) NOT NULL,
  `VerificationId` int(10) NOT NULL,
  `IsJobSeeker` tinyint(1) NOT NULL,
  `LastVerifiedDate` datetime NOT NULL,
  `Role` varchar(255) DEFAULT NULL,
  `PreviousCompanyID` int(5) DEFAULT NULL,
  `CurrentCompanyID` int(5) NOT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `AlternateContactNumber` int(10) DEFAULT NULL,
  CONSTRAINT pk_User_Comapany_ID PRIMARY KEY (UserId,CorporateID,CurrentCompanyID),
  CONSTRAINT fk_User_Comapany_ID FOREIGN KEY (CurrentCompanyID) REFERENCES company_dtl(CompanyID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_dtl` */

/*Table structure for table `verification_dtl` */

DROP TABLE IF EXISTS `verification_dtl`;

CREATE TABLE `verification_dtl` (
  `VerificationID` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT NULL,
  `VerifiedEmailID` varchar(255) DEFAULT NULL,
  `VerificationDate` datetime DEFAULT NULL,
  `NextVerificationDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `UpdatedBy` int(10) DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`VerificationID`),
  FOREIGN KEY (UserId) REFERENCES user_dtl(UserId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `verification_dtl` */

/*Table structure for table `user_Technical_dtl` */

DROP TABLE IF EXISTS `user_Technical_dtl`;

CREATE TABLE `user_Technical_dtl` (
  `UserTechID` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL,
  `TechID` int(5) NOT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `UpdatedBy` int(10) DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`UserTechID`),
  FOREIGN KEY (UserId) REFERENCES user_dtl(UserId),
  FOREIGN KEY (TechID) REFERENCES technology_dtl(TechID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
