-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mer2a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mer2a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mer2a` ;
USE `mer2a` ;

-- -----------------------------------------------------
-- Table `mer2a`.`ALUMNES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`ALUMNES` (
  `nom` VARCHAR(20) NULL,
  `cognoms` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefon` INT(9) NULL,
  `dni` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`dni`));


-- -----------------------------------------------------
-- Table `mer2a`.`DEPARTAMENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`DEPARTAMENTS` (
  `id` VARCHAR(20) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `ubicacio` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mer2a`.`PROFESSORS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`PROFESSORS` (
  `nom` VARCHAR(20) NULL,
  `cognoms` VARCHAR(45) NULL,
  `departaments` VARCHAR(45) NULL,
  `nif` VARCHAR(9) NOT NULL,
  `DEPARTAMENTS_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`nif`),
  INDEX `fk_PROFESSORS_DEPARTAMENTS1_idx` (`DEPARTAMENTS_id` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSORS_DEPARTAMENTS1`
    FOREIGN KEY (`DEPARTAMENTS_id`)
    REFERENCES `mer2a`.`DEPARTAMENTS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mer2a`.`ASSIGNATURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`ASSIGNATURA` (
  `id` VARCHAR(45) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `descripcio` VARCHAR(45) NULL,
  `criteris_aval` VARCHAR(45) NULL,
  `objectius` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mer2a`.`MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`MATRICULA` (
  `id` VARCHAR(45) NOT NULL,
  `data` VARCHAR(45) NULL,
  `nivell` VARCHAR(45) NULL,
  `grup` VARCHAR(9) NULL,
  `curs` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_MATRICULA_ALUMNES`
    FOREIGN KEY (`grup`)
    REFERENCES `mer2a`.`ALUMNES` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mer2a`.`ASSIGNATURA MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`ASSIGNATURA MATRICULA` (
  `ID` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `aula` VARCHAR(45) NULL,
  `calendari` VARCHAR(45) NULL,
  `ASSIGNATURA_id` VARCHAR(45) NOT NULL,
  `PROFESSORS_nif` VARCHAR(9) NOT NULL,
  `MATRICULA_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_ASSIGNATURA MATRICULA_ASSIGNATURA1_idx` (`ASSIGNATURA_id` ASC) VISIBLE,
  INDEX `fk_ASSIGNATURA MATRICULA_PROFESSORS1_idx` (`PROFESSORS_nif` ASC) VISIBLE,
  INDEX `fk_ASSIGNATURA MATRICULA_MATRICULA1_idx` (`MATRICULA_id` ASC) VISIBLE,
  CONSTRAINT `fk_ASSIGNATURA MATRICULA_ASSIGNATURA1`
    FOREIGN KEY (`ASSIGNATURA_id`)
    REFERENCES `mer2a`.`ASSIGNATURA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ASSIGNATURA MATRICULA_PROFESSORS1`
    FOREIGN KEY (`PROFESSORS_nif`)
    REFERENCES `mer2a`.`PROFESSORS` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ASSIGNATURA MATRICULA_MATRICULA1`
    FOREIGN KEY (`MATRICULA_id`)
    REFERENCES `mer2a`.`MATRICULA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
