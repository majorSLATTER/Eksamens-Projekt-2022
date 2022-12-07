-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EGpim
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EGpim
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EGpim` DEFAULT CHARACTER SET utf8 ;
USE `EGpim` ;

-- -----------------------------------------------------
-- Table `EGpim`.`PIM Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EGpim`.`PIM Status` (
  `StatusID` INT NOT NULL,
  `StatusNavn` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`StatusID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EGpim`.`Kategori`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EGpim`.`Kategori` (
  `KategoriID` INT NOT NULL,
  `KatergoriNavn` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`KategoriID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EGpim`.`Produkt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EGpim`.`Produkt` (
  `ProduktID` INT NOT NULL,
  `Varenummer` VARCHAR(45) NULL,
  `Navn` VARCHAR(45) NULL,
  `Vægt` VARCHAR(45) NULL,
  `Bæredygtighed` VARCHAR(255) NULL,
  `Sporbarhed` VARCHAR(255) NULL,
  `Anvendelse` VARCHAR(255) NULL,
  `Bortskaffelse` VARCHAR(255) NULL,
  `PIM Status_StatusID` INT NOT NULL,
  `Kategori_KategoriID` INT NOT NULL,
  `StartDate` DATE NOT NULL,
  `EstEndDate` DATE NULL,
  PRIMARY KEY (`ProduktID`, `PIM Status_StatusID`, `Kategori_KategoriID`),
  INDEX `fk_Produkt_PIM Status1_idx` (`PIM Status_StatusID` ASC) VISIBLE,
  INDEX `fk_Produkt_Kategori1_idx` (`Kategori_KategoriID` ASC) VISIBLE,
  CONSTRAINT `fk_Produkt_PIM Status1`
    FOREIGN KEY (`PIM Status_StatusID`)
    REFERENCES `EGpim`.`PIM Status` (`StatusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produkt_Kategori1`
    FOREIGN KEY (`Kategori_KategoriID`)
    REFERENCES `EGpim`.`Kategori` (`KategoriID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EGpim`.`Farve`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EGpim`.`Farve` (
  `FarveID` INT NOT NULL,
  `FarveNavn` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FarveID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EGpim`.`Materiale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EGpim`.`Materiale` (
  `MaterialeID` INT NOT NULL,
  `MaterialeNavn` VARCHAR(45) NOT NULL,
  `PrisPrUnit` VARCHAR(45) NOT NULL,
  `Kommentar` VARCHAR(45) NULL,
  PRIMARY KEY (`MaterialeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EGpim`.`OperationForlob`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EGpim`.`OperationForlob` (
  `OperationID` INT NOT NULL,
  `OperationNummer` VARCHAR(45) NOT NULL,
  `Tid` VARCHAR(45) NOT NULL,
  `Kapacitet` VARCHAR(45) NOT NULL,
  `Kommentar` VARCHAR(45) NULL,
  `Produkt_ProduktID` INT NOT NULL,
  PRIMARY KEY (`OperationID`, `Produkt_ProduktID`),
  INDEX `fk_OperationForlob_Produkt1_idx` (`Produkt_ProduktID` ASC) VISIBLE,
  CONSTRAINT `fk_OperationForlob_Produkt1`
    FOREIGN KEY (`Produkt_ProduktID`)
    REFERENCES `EGpim`.`Produkt` (`ProduktID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EGpim`.`Produkt_Materiale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EGpim`.`Produkt_Materiale` (
  `Produkt_ProduktID` INT NOT NULL,
  `Materiale_MaterialeID` INT NOT NULL,
  `Antal` INT NULL,
  `Enhed` VARCHAR(45) NULL,
  PRIMARY KEY (`Produkt_ProduktID`, `Materiale_MaterialeID`),
  INDEX `fk_Produkt_Materiale_Materiale1_idx` (`Materiale_MaterialeID` ASC) VISIBLE,
  CONSTRAINT `fk_Produkt_Materiale_Produkt1`
    FOREIGN KEY (`Produkt_ProduktID`)
    REFERENCES `EGpim`.`Produkt` (`ProduktID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produkt_Materiale_Materiale1`
    FOREIGN KEY (`Materiale_MaterialeID`)
    REFERENCES `EGpim`.`Materiale` (`MaterialeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EGpim`.`Produkt_Farve`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EGpim`.`Produkt_Farve` (
  `Produkt_ProduktID` INT NOT NULL,
  `Farve_FarveID` INT NOT NULL,
  PRIMARY KEY (`Produkt_ProduktID`, `Farve_FarveID`),
  INDEX `fk_Produkt_Farve_Farve1_idx` (`Farve_FarveID` ASC) VISIBLE,
  CONSTRAINT `fk_Produkt_Farve_Produkt`
    FOREIGN KEY (`Produkt_ProduktID`)
    REFERENCES `EGpim`.`Produkt` (`ProduktID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produkt_Farve_Farve1`
    FOREIGN KEY (`Farve_FarveID`)
    REFERENCES `EGpim`.`Farve` (`FarveID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
