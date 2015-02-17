-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 17, 2015 at 04:45 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `school_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('14dd7940ff9e05c089ab1b91ad0fa899', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', 1424178919, '');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `scid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`scid`, `name`) VALUES
(1, 'School of Computing & Informatics');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `scid` int(11) DEFAULT NULL,
  `admin_number` varchar(40) DEFAULT NULL,
  `surname` varchar(20) DEFAULT NULL,
  `other_names` varchar(100) DEFAULT NULL,
  `year_of_admin` year(4) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email_uni` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `scid` (`scid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_next_of_kin`
--

CREATE TABLE IF NOT EXISTS `student_next_of_kin` (
  `nkid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `relationship` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nkid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `st_event`
--

CREATE TABLE IF NOT EXISTS `st_event` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `ecid` int(11) DEFAULT NULL,
  `description` text,
  `event_date` date DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `sid` (`sid`),
  KEY `ecid` (`ecid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `st_event_category`
--

CREATE TABLE IF NOT EXISTS `st_event_category` (
  `ecid` int(11) NOT NULL AUTO_INCREMENT,
  `event_category` varchar(20) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`ecid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `st_event_comment`
--

CREATE TABLE IF NOT EXISTS `st_event_comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `comment` text,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  KEY `eid` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `st_event_document`
--

CREATE TABLE IF NOT EXISTS `st_event_document` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `label` varchar(30) DEFAULT NULL,
  `description` text,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `eid` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `ulid` int(11) DEFAULT NULL,
  `scid` int(11) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  KEY `ulid` (`ulid`),
  KEY `scid` (`scid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `ulid`, `scid`, `username`, `email`, `designation`, `photo`, `password`, `date_time`) VALUES
(1, 1, 1, 'Anthony Nandaa', 'nandaa@uonbi.ac.ke', 'Graduate Assistant', NULL, '827ccb0eea8a706c4c34a16891f84e7b', '2015-02-17 13:44:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE IF NOT EXISTS `user_level` (
  `ulid` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `level_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ulid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`ulid`, `level`, `level_name`) VALUES
(1, 1, 'Super User'),
(2, 2, 'Administrator'),
(3, 3, 'Normal');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`scid`) REFERENCES `school` (`scid`);

--
-- Constraints for table `student_next_of_kin`
--
ALTER TABLE `student_next_of_kin`
  ADD CONSTRAINT `student_next_of_kin_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`);

--
-- Constraints for table `st_event`
--
ALTER TABLE `st_event`
  ADD CONSTRAINT `st_event_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `st_event_ibfk_2` FOREIGN KEY (`ecid`) REFERENCES `st_event_category` (`ecid`);

--
-- Constraints for table `st_event_comment`
--
ALTER TABLE `st_event_comment`
  ADD CONSTRAINT `st_event_comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  ADD CONSTRAINT `st_event_comment_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `st_event` (`eid`);

--
-- Constraints for table `st_event_document`
--
ALTER TABLE `st_event_document`
  ADD CONSTRAINT `st_event_document_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `st_event` (`eid`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`ulid`) REFERENCES `user_level` (`ulid`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`scid`) REFERENCES `school` (`scid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
