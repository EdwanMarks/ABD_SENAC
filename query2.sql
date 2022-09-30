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
-- Table `mydb`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NULL,
  `renavan` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `capacidade` INT NULL,
  PRIMARY KEY (`idVeiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`filial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`filial` (
  `idFilial` INT NOT NULL AUTO_INCREMENT,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `veiculo_idVeiculo` INT NOT NULL,
  PRIMARY KEY (`idFilial`, `veiculo_idVeiculo`),
  INDEX `fk_filial_veiculo1_idx` (`veiculo_idVeiculo` ASC) VISIBLE,
  CONSTRAINT `fk_filial_veiculo1`
    FOREIGN KEY (`veiculo_idVeiculo`)
    REFERENCES `mydb`.`veiculo` (`idVeiculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`encomenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`encomenda` (
  `idEncomenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NULL,
  `nota` INT NULL,
  `filial` VARCHAR(45) NULL,
  `descricao` INT NULL,
  `destinatario` VARCHAR(45) NULL,
  `filial_idFilial` INT NOT NULL,
  PRIMARY KEY (`idEncomenda`, `filial_idFilial`),
  INDEX `fk_encomenda_filial1_idx` (`filial_idFilial` ASC) VISIBLE,
  CONSTRAINT `fk_encomenda_filial1`
    FOREIGN KEY (`filial_idFilial`)
    REFERENCES `mydb`.`filial` (`idFilial`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `sobrenome` VARCHAR(45) NULL,
  `rg` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rota` (
  `idRota` INT NOT NULL AUTO_INCREMENT,
  `destino` VARCHAR(45) NULL,
  `origem` VARCHAR(45) NULL,
  `caminho` JSON NULL,
  `filial_idFilial` INT NOT NULL,
  PRIMARY KEY (`idRota`, `filial_idFilial`),
  INDEX `fk_rota_filial1_idx` (`filial_idFilial` ASC) VISIBLE,
  CONSTRAINT `fk_rota_filial1`
    FOREIGN KEY (`filial_idFilial`)
    REFERENCES `mydb`.`filial` (`idFilial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`veiculo_has_encomenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veiculo_has_encomenda` (
  `veiculo_idVeiculo` INT NOT NULL,
  `encomenda_idEncomenda` INT NOT NULL,
  PRIMARY KEY (`veiculo_idVeiculo`, `encomenda_idEncomenda`),
  INDEX `fk_veiculo_has_encomenda_encomenda1_idx` (`encomenda_idEncomenda` ASC) VISIBLE,
  INDEX `fk_veiculo_has_encomenda_veiculo_idx` (`veiculo_idVeiculo` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_has_encomenda_veiculo`
    FOREIGN KEY (`veiculo_idVeiculo`)
    REFERENCES `mydb`.`veiculo` (`idVeiculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_veiculo_has_encomenda_encomenda1`
    FOREIGN KEY (`encomenda_idEncomenda`)
    REFERENCES `mydb`.`encomenda` (`idEncomenda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`encomenda_has_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`encomenda_has_cliente` (
  `encomenda_idEncomenda` INT NOT NULL,
  `cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`encomenda_idEncomenda`, `cliente_idCliente`),
  INDEX `fk_encomenda_has_cliente_cliente1_idx` (`cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_encomenda_has_cliente_encomenda1_idx` (`encomenda_idEncomenda` ASC) VISIBLE,
  CONSTRAINT `fk_encomenda_has_cliente_encomenda1`
    FOREIGN KEY (`encomenda_idEncomenda`)
    REFERENCES `mydb`.`encomenda` (`idEncomenda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_encomenda_has_cliente_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `mydb`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`veiculo_has_rota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veiculo_has_rota` (
  `veiculo_idVeiculo` INT NOT NULL,
  `rota_idRota` INT NOT NULL,
  PRIMARY KEY (`veiculo_idVeiculo`, `rota_idRota`),
  INDEX `fk_veiculo_has_rota_rota1_idx` (`rota_idRota` ASC) VISIBLE,
  INDEX `fk_veiculo_has_rota_veiculo1_idx` (`veiculo_idVeiculo` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_has_rota_veiculo1`
    FOREIGN KEY (`veiculo_idVeiculo`)
    REFERENCES `mydb`.`veiculo` (`idVeiculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_veiculo_has_rota_rota1`
    FOREIGN KEY (`rota_idRota`)
    REFERENCES `mydb`.`rota` (`idRota`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `sobrenome` VARCHAR(45) NULL,
  `rg` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`carro` (
  `idCarro` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NULL,
  `renavan` VARCHAR(45) NULL,
  `fabricante` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `ano` YEAR NULL,
  `cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idCarro`, `cliente_idCliente`),
  INDEX `fk_carro_cliente1_idx` (`cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_carro_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `mydb`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ocorrencia` (
  `idOcorrencia` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NULL,
  `local` VARCHAR(45) NULL,
  `hora` TIME NULL,
  `custo` INT NULL,
  `cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idOcorrencia`, `cliente_idCliente`),
  INDEX `fk_ocorrencia_cliente1_idx` (`cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_ocorrencia_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `mydb`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`apolice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`apolice` (
  `idApolice` INT NOT NULL AUTO_INCREMENT,
  `valor` VARCHAR(45) NULL,
  `tipoEventos` VARCHAR(45) NULL,
  `cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idApolice`, `cliente_idCliente`),
  INDEX `fk_apolice_cliente1_idx` (`cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_apolice_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `mydb`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`apolice_has_carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`apolice_has_carro` (
  `apolice_idApolice` INT NOT NULL,
  `carro_idCarro` INT NOT NULL,
  `carro_cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`apolice_idApolice`, `carro_idCarro`, `carro_cliente_idCliente`),
  INDEX `fk_apolice_has_carro_carro1_idx` (`carro_idCarro` ASC, `carro_cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_apolice_has_carro_apolice1_idx` (`apolice_idApolice` ASC) VISIBLE,
  CONSTRAINT `fk_apolice_has_carro_apolice1`
    FOREIGN KEY (`apolice_idApolice`)
    REFERENCES `mydb`.`apolice` (`idApolice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apolice_has_carro_carro1`
    FOREIGN KEY (`carro_idCarro` , `carro_cliente_idCliente`)
    REFERENCES `mydb`.`carro` (`idCarro` , `cliente_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
