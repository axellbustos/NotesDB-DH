-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema notasDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema notasDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `notasDB` DEFAULT CHARACTER SET utf8 ;
USE `notasDB` ;

-- -----------------------------------------------------
-- Table `notasDB`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notasDB`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notasDB`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notasDB`.`note` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `date-creation` DATE NOT NULL,
  `date-modification` DATE NOT NULL,
  `description` TEXT NOT NULL,
  `delete` TINYINT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `note_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `note_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `notasDB`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notasDB`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notasDB`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notasDB`.`note_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notasDB`.`note_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `note_category` INT NULL,
  `category_note` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `category_note_idx` (`category_note` ASC) VISIBLE,
  CONSTRAINT `category_note`
    FOREIGN KEY (`category_note`)
    REFERENCES `notasDB`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `note_category`
    FOREIGN KEY (`category_note`)
    REFERENCES `notasDB`.`note` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
