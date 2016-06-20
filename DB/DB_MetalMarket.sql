SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `PURCHASE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PURCHASE` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PURCHASE` (
  `User_ID` INT NOT NULL,
  `PURCHASE_ID` INT NOT NULL,
  `STATUS` VARCHAR(1) NULL,
  `ADDRESS` VARCHAR(150) NULL,
  `DATE_START` DATETIME NULL,
  `DATE_END` DATETIME NULL,
  PRIMARY KEY (`User_ID`, `PURCHASE_ID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User` ;

SHOW WARNINGS;
-- todo build unique index on  EMAIL, LOGIN
--
CREATE TABLE IF NOT EXISTS `User` (
  `User_ID` INT NOT NULL,
  `FIO` VARCHAR(45) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `LOGIN` VARCHAR(45) NULL,
  `PASSWORD` VARCHAR(45) NULL,
  PRIMARY KEY (`User_ID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DIMENSIONS_TYPE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DIMENSIONS_TYPE` ;
-- todo varchar size
SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `DIMENSIONS_TYPE` (
  `DIMENSION_ID` INT NOT NULL,
  `DESCRIPTION` VARCHAR(45) NULL,
  PRIMARY KEY (`DIMENSIONS_ID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PRODUCT_DIMENSIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUCT_DIMENSIONS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PRODUCT_DIMENSIONS` (
  `PRODUCT_ID` INT NOT NULL,
  `DIMENSION_ID` INT NOT NULL,
  `VALUE` DECIMAL(10,0) NULL,
   PRIMARY KEY (`PRODUCT_ID`, `DIMENSION_ID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PRODUCT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUCT` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PRODUCT` (
  `PRODUCT_ID` INT NOT NULL,
  `PRODUCT_TYPE_ID` INT NOT NULL,
  `DESCRIPTION` VARCHAR(250) NOT NULL,
  `WEIGHT` DECIMAL(10,0) NULL,
   PRIMARY KEY (`PRODUCT_ID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PURCHASE_PRODUCT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PURCHASE_PRODUCT` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PURCHASE_PRODUCT` (
  `PURCHASE_ID` INT NOT NULL,
  `PRODUCT_ID` INT NOT NULL,
  `WEIGHT` DECIMAL(10,0) NULL,
  `PURCHASE_User_ID` INT NOT NULL,
  `PURCHASE_PURCHASE_ID` INT NOT NULL,
  `PRODUCT_PRODUCT_ID` INT NOT NULL,
  PRIMARY KEY (`PURCHASE_ID`, `PRODUCT_ID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PRODUCT_TYPE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUCT_TYPE` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PRODUCT_TYPE` (
  `PRODUCT_TYPE_ID` INT NULL,
  `GROUP_ID` INT NULL,
  `DESCRIPTION` VARCHAR(45) NULL  ,
  PRIMARY KEY (`PRODUCT_TYPE_ID`)
  )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PRODUCT_TYPE_DIMENSION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUCT_TYPE_DIMENSION` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PRODUCT_TYPE_DIMENSION` (
  `PRODUCT_TYPE_ID` INT NOT NULL,
  `DIMENSIONS_TYPE` INT NOT NULL,
  PRIMARY KEY (`PRODUCT_TYPE_ID`, `DIMENSIONS_TYPE`)
)
  ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PRODUCT_GROUP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUCT_GROUP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PRODUCT_GROUP` (
  `GROUP_ID` INT NULL,
  `DESCRIPTION` VARCHAR(45) NULL)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
