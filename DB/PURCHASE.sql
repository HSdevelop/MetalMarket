CREATE TABLE IF NOT EXISTS `PURCHASE` (
  `User_ID` INT NOT NULL,
  `PURCHASE_ID` INT NOT NULL,
  `STATUS` VARCHAR(45) NULL,
  `ADDRESS` VARCHAR(150) NULL,
  `DATE_START` VARCHAR(45) NULL,
  `DATE_END` VARCHAR(45) NULL,
  PRIMARY KEY (`User_ID`, `PURCHASE_ID`))
ENGINE = InnoDB;