-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema forza
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `forza` ;

-- -----------------------------------------------------
-- Schema forza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `forza` DEFAULT CHARACTER SET utf8 ;
USE `forza` ;

-- -----------------------------------------------------
-- Table `forza`.`tb_trab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forza`.`tb_trab` (
  `idtb_trab` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idtb_trab`),
  UNIQUE INDEX `idtb_trab_UNIQUE` (`idtb_trab` ASC),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forza`.`tb_equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forza`.`tb_equipe` (
  `idtb_equipe` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  `data_ini` DATE NULL,
  `data_fim` DATE NULL,
  PRIMARY KEY (`idtb_equipe`),
  UNIQUE INDEX `idtb_equipe_UNIQUE` (`idtb_equipe` ASC),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forza`.`tb_frequencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forza`.`tb_frequencia` (
  `idtb_frequencia` TINYINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idtb_frequencia`),
  UNIQUE INDEX `idtb_frequencia_UNIQUE` (`idtb_frequencia` ASC),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forza`.`tb_tarefa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forza`.`tb_tarefa` (
  `idtb_tarefa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  `idtb_frequencia` TINYINT NOT NULL,
  PRIMARY KEY (`idtb_tarefa`),
  UNIQUE INDEX `idtb_tarefa_UNIQUE` (`idtb_tarefa` ASC),
  INDEX `fk_tb_tarefa_tb_frequencia1_idx` (`idtb_frequencia` ASC),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC),
  CONSTRAINT `fk_tb_tarefa_tb_frequencia1`
    FOREIGN KEY (`idtb_frequencia`)
    REFERENCES `forza`.`tb_frequencia` (`idtb_frequencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forza`.`tb_trab_equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forza`.`tb_trab_equipe` (
  `idtb_trab_equipe` INT NOT NULL AUTO_INCREMENT,
  `idtb_trab` INT NOT NULL,
  `idtb_equipe` INT NOT NULL,
  `data_ini` DATE NULL,
  `data_fim` DATE NULL,
  PRIMARY KEY (`idtb_trab_equipe`),
  UNIQUE INDEX `idtb_trab_equipe_UNIQUE` (`idtb_trab_equipe` ASC),
  INDEX `fk_tb_trab_equipe_tb_trab1_idx` (`idtb_trab` ASC),
  INDEX `fk_tb_trab_equipe_tb_equipe1_idx` (`idtb_equipe` ASC),
  CONSTRAINT `fk_tb_trab_equipe_tb_trab1`
    FOREIGN KEY (`idtb_trab`)
    REFERENCES `forza`.`tb_trab` (`idtb_trab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_trab_equipe_tb_equipe1`
    FOREIGN KEY (`idtb_equipe`)
    REFERENCES `forza`.`tb_equipe` (`idtb_equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forza`.`tb_equipe_tarefa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forza`.`tb_equipe_tarefa` (
  `idtb_equipe_tarefa` INT NOT NULL AUTO_INCREMENT,
  `idtb_tarefa` INT NOT NULL,
  `idtb_equipe` INT NOT NULL,
  `data_ini` DATE NULL,
  `data_fim` DATE NULL,
  PRIMARY KEY (`idtb_equipe_tarefa`),
  UNIQUE INDEX `idtb_equipe_tarefa_UNIQUE` (`idtb_equipe_tarefa` ASC),
  INDEX `fk_tb_equipe_tarefa_tb_tarefa1_idx` (`idtb_tarefa` ASC),
  INDEX `fk_tb_equipe_tarefa_tb_equipe1_idx` (`idtb_equipe` ASC),
  CONSTRAINT `fk_tb_equipe_tarefa_tb_tarefa1`
    FOREIGN KEY (`idtb_tarefa`)
    REFERENCES `forza`.`tb_tarefa` (`idtb_tarefa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_equipe_tarefa_tb_equipe1`
    FOREIGN KEY (`idtb_equipe`)
    REFERENCES `forza`.`tb_equipe` (`idtb_equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forza`.`tb_trab_tarefa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forza`.`tb_trab_tarefa` (
  `dia` DATE NOT NULL,
  `idtb_trab` INT NOT NULL,
  `idtb_tarefa` INT NOT NULL,
  PRIMARY KEY (`dia`, `idtb_trab`, `idtb_tarefa`),
  INDEX `fk_tb_trab_tarefa_tb_trab_idx` (`idtb_trab` ASC),
  INDEX `fk_tb_trab_tarefa_tb_tarefa1_idx` (`idtb_tarefa` ASC),
  CONSTRAINT `fk_tb_trab_tarefa_tb_trab`
    FOREIGN KEY (`idtb_trab`)
    REFERENCES `forza`.`tb_trab` (`idtb_trab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_trab_tarefa_tb_tarefa1`
    FOREIGN KEY (`idtb_tarefa`)
    REFERENCES `forza`.`tb_tarefa` (`idtb_tarefa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
