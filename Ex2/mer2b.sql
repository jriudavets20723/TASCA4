-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CINE` (
  `NIF` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `num_sales` VARCHAR(45) NULL,
  `ubicacio` VARCHAR(45) NULL,
  `preu` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `localitat` VARCHAR(45) NULL,
  `horari` VARCHAR(45) NULL,
  PRIMARY KEY (`NIF`));


-- -----------------------------------------------------
-- Table `mydb`.`PEL·LICULES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PEL·LICULES` (
  `ISBN` TIMESTAMP NOT NULL,
  `nom` VARCHAR(45) NULL,
  `director` VARCHAR(45) NULL,
  `protagonista` VARCHAR(45) NULL,
  `actor` VARCHAR(45) NULL,
  `any_produccio` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`));


-- -----------------------------------------------------
-- Table `mydb`.`PROJECCIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROJECCIO` (
  `ID` INT NOT NULL,
  `sala` VARCHAR(45) NULL,
  `horari_inici` VARCHAR(45) NULL,
  `horari_fi` VARCHAR(45) NULL,
  `cine` VARCHAR(45) NULL,
  `data` VARCHAR(45) NULL,
  `CINE_NIF` INT NOT NULL,
  `PEL·LICULES_ISBN` TIMESTAMP NOT NULL,
  INDEX `fk_PROJECCIO_CINE_idx` (`CINE_NIF` ASC) VISIBLE,
  INDEX `fk_PROJECCIO_PEL·LICULES1_idx` (`PEL·LICULES_ISBN` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_PROJECCIO_CINE`
    FOREIGN KEY (`CINE_NIF`)
    REFERENCES `mydb`.`CINE` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROJECCIO_PEL·LICULES1`
    FOREIGN KEY (`PEL·LICULES_ISBN`)
    REFERENCES `mydb`.`PEL·LICULES` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`TARIFES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TARIFES` (
  `ID` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `preu` VARCHAR(45) NULL,
  `descripcio` VARCHAR(45) NULL,
  `PROJECCIO_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_TARIFES_PROJECCIO1_idx` (`PROJECCIO_ID` ASC) VISIBLE,
  CONSTRAINT `fk_TARIFES_PROJECCIO1`
    FOREIGN KEY (`PROJECCIO_ID`)
    REFERENCES `mydb`.`PROJECCIO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
