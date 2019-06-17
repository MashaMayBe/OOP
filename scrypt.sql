-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.17 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных shopdb
CREATE DATABASE IF NOT EXISTS `shopdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shopdb`;


-- Дамп структуры для таблица shopdb.category
CREATE TABLE IF NOT EXISTS `category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Path` varchar(100) NOT NULL DEFAULT 'images\\categories\\no-image.jpg',
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shopdb.category: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`CategoryID`, `Name`, `Path`) VALUES
	(7, 'Apple', 'images\\categories\\3003342'),
	(8, 'Samsung', 'images\\categories\\486118481'),
	(9, 'HTC', 'images\\categories\\3752891'),
	(10, 'Lumia', 'images\\categories\\3511401'),
	(11, 'LG', 'images\\categories\\3080315'),
	(12, 'Xaomi', 'images\\categories\\3140889');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- Дамп структуры для таблица shopdb.good
CREATE TABLE IF NOT EXISTS `good` (
  `GoodID` int(11) NOT NULL AUTO_INCREMENT,
  `Price` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `About` varchar(1000) NOT NULL,
  `Path` varchar(100) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  PRIMARY KEY (`GoodID`),
  KEY `FK_book_category` (`CategoryID`),
  CONSTRAINT `FK_good_category` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shopdb.good: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` (`GoodID`, `Price`, `Name`, `About`, `Path`, `CategoryID`) VALUES
	(15, 350000, 'Apple', '', 'images\\goods\\135523128', 7),
	(16, 150000, 'HTC', '', 'images\\goods\\1208985679', 9),
	(17, 300000, 'Samsung', '', 'images\\goods\\-968438677', 8);
/*!40000 ALTER TABLE `good` ENABLE KEYS */;


-- Дамп структуры для таблица shopdb.order
CREATE TABLE IF NOT EXISTS `order` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Submited` bit(1) NOT NULL DEFAULT b'0',
  `Delivered` bit(1) NOT NULL DEFAULT b'0',
  `Number` int(11) NOT NULL DEFAULT '1',
  `UserID` int(11) NOT NULL,
  `GoodID` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_order_user` (`UserID`),
  KEY `FK_order_good` (`GoodID`),
  CONSTRAINT `FK_order_good` FOREIGN KEY (`GoodID`) REFERENCES `good` (`GoodID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_order_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shopdb.order: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`OrderID`, `Date`, `Submited`, `Delivered`, `Number`, `UserID`, `GoodID`) VALUES
	(11, '2014-06-09', b'1', b'1', 2, 3, 16),
	(12, '2014-06-09', b'1', b'1', 1, 3, 17);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


-- Дамп структуры для таблица shopdb.user
CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(25) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `Rights` varchar(15) NOT NULL,
  `State` bit(1) NOT NULL,
  `PhoneNo` varchar(20) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Login` (`Login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shopdb.user: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`UserID`, `Login`, `Password`, `Rights`, `State`, `PhoneNo`) VALUES
	(3, 'admin', 'BB68F4C90C0332DDA68E1D5088A3D241432D5B4F', 'ROLE_ADMIN', b'1', '(000)000-0000');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
