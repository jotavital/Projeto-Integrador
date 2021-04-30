-- MySQL Script generated by MySQL Workbench
-- Fri Apr 30 15:17:15 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema easylize_financas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema easylize_financas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `easylize_financas` DEFAULT CHARACTER SET utf8mb4 ;
USE `easylize_financas` ;

-- -----------------------------------------------------
-- Table `easylize_financas`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easylize_financas`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `sobrenome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easylize_financas`.`tipo_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easylize_financas`.`tipo_categoria` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easylize_financas`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easylize_financas`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_categoria` VARCHAR(255) NOT NULL,
  `fk_tipo` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tipo_categoria_idx` (`fk_tipo` ASC),
  CONSTRAINT `fk_tipo_categoria`
    FOREIGN KEY (`fk_tipo`)
    REFERENCES `easylize_financas`.`tipo_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `easylize_financas`.`conta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easylize_financas`.`conta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_conta` VARCHAR(45) NOT NULL,
  `saldo_atual` DECIMAL(11,7) NOT NULL,
  `fk_usuario` INT NOT NULL,
  `fk_categoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_conta_idx` (`fk_usuario` ASC),
  INDEX `fk_catetgoria_idx` (`fk_categoria` ASC),
  CONSTRAINT `fk_usuario_conta`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `easylize_financas`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catetgoria`
    FOREIGN KEY (`fk_categoria`)
    REFERENCES `easylize_financas`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easylize_financas`.`despesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easylize_financas`.`despesa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao_despesa` VARCHAR(255) NOT NULL,
  `imagem` BLOB NULL,
  `data_despesa` DATE NOT NULL,
  `data_vencimento` DATE NULL,
  `valor` DECIMAL(11,7) NOT NULL,
  `data_inclusao` DATETIME NOT NULL,
  `fk_conta` INT NOT NULL,
  `fk_usuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_conta_despesa_idx` (`fk_conta` ASC),
  INDEX `fk_usuario_despesa_idx` (`fk_usuario` ASC),
  CONSTRAINT `fk_conta_despesa`
    FOREIGN KEY (`fk_conta`)
    REFERENCES `easylize_financas`.`conta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_despesa`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `easylize_financas`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easylize_financas`.`categoria_despesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easylize_financas`.`categoria_despesa` (
  `fk_categoria` INT NOT NULL,
  `fk_despesa` INT NOT NULL,
  INDEX `categoria_despesa_fk1` (`fk_despesa` ASC),
  CONSTRAINT `categoria_despesa_fk0`
    FOREIGN KEY (`fk_categoria`)
    REFERENCES `easylize_financas`.`categoria` (`id`),
  CONSTRAINT `categoria_despesa_fk1`
    FOREIGN KEY (`fk_despesa`)
    REFERENCES `easylize_financas`.`despesa` (`id`));


-- -----------------------------------------------------
-- Table `easylize_financas`.`receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easylize_financas`.`receita` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao_receita` VARCHAR(255) NOT NULL,
  `data_receita` DATE NULL,
  `valor` DECIMAL(11,7) NOT NULL,
  `data_inclusao` DATETIME NULL,
  `fk_usuario` INT NOT NULL,
  `fk_conta` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario` (`fk_usuario` ASC),
  INDEX `fk_conta_receita_idx` (`fk_conta` ASC),
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `easylize_financas`.`usuario` (`id`),
  CONSTRAINT `fk_conta_receita`
    FOREIGN KEY (`fk_conta`)
    REFERENCES `easylize_financas`.`conta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `easylize_financas`.`meta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easylize_financas`.`meta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_meta` VARCHAR(255) NOT NULL,
  `descricao_meta` VARCHAR(255) NOT NULL,
  `prazo_meta` DATE NOT NULL,
  `valor_total` DECIMAL(11,7) NOT NULL,
  `valor_atingido` DECIMAL(11,7) NOT NULL,
  `fk_usuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_meta` (`fk_usuario` ASC),
  CONSTRAINT `fk_usuario_meta`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `easylize_financas`.`usuario` (`id`));


-- -----------------------------------------------------
-- Table `easylize_financas`.`categoria_receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easylize_financas`.`categoria_receita` (
  `fk_categoria` INT NOT NULL,
  `fk_receita` INT NOT NULL,
  INDEX `categoria_receita_fk1` (`fk_receita` ASC),
  CONSTRAINT `categoria_receita_fk0`
    FOREIGN KEY (`fk_categoria`)
    REFERENCES `easylize_financas`.`categoria` (`id`),
  CONSTRAINT `categoria_receita_fk1`
    FOREIGN KEY (`fk_receita`)
    REFERENCES `easylize_financas`.`receita` (`id`));


-- -----------------------------------------------------
-- Table `easylize_financas`.`categoria_meta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easylize_financas`.`categoria_meta` (
  `fk_categoria` INT NOT NULL,
  `fk_meta` INT NOT NULL,
  INDEX `categoria_meta_fk1` (`fk_meta` ASC),
  CONSTRAINT `categoria_meta_fk0`
    FOREIGN KEY (`fk_categoria`)
    REFERENCES `easylize_financas`.`categoria` (`id`),
  CONSTRAINT `categoria_meta_fk1`
    FOREIGN KEY (`fk_meta`)
    REFERENCES `easylize_financas`.`meta` (`id`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `easylize_financas`.`tipo_categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `easylize_financas`;
INSERT INTO `easylize_financas`.`tipo_categoria` (`id`, `descricao`) VALUES (1, 'Economia');
INSERT INTO `easylize_financas`.`tipo_categoria` (`id`, `descricao`) VALUES (2, 'Meta');
INSERT INTO `easylize_financas`.`tipo_categoria` (`id`, `descricao`) VALUES (3, 'Despesa');
INSERT INTO `easylize_financas`.`tipo_categoria` (`id`, `descricao`) VALUES (4, 'Receita');
INSERT INTO `easylize_financas`.`tipo_categoria` (`id`, `descricao`) VALUES (5, 'Conta');

COMMIT;


-- -----------------------------------------------------
-- Data for table `easylize_financas`.`categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `easylize_financas`;
INSERT INTO `easylize_financas`.`categoria` (`id`, `nome_categoria`, `fk_tipo`) VALUES (1, 'Conta corrente', 5);
INSERT INTO `easylize_financas`.`categoria` (`id`, `nome_categoria`, `fk_tipo`) VALUES (2, 'Poupança', 5);
INSERT INTO `easylize_financas`.`categoria` (`id`, `nome_categoria`, `fk_tipo`) VALUES (3, 'Carteira', 5);
INSERT INTO `easylize_financas`.`categoria` (`id`, `nome_categoria`, `fk_tipo`) VALUES (4, 'Outros', 5);

COMMIT;

