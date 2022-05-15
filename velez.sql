-- DROP SCHEMA velez;
CREATE SCHEMA IF NOT EXISTS velez DEFAULT CHARACTER SET utf8 ;
USE velez;

-- -----------------------------------------------------
-- Table `velez`.`Localidad`: Catálogo
-- -----------------------------------------------------
DROP TABLE IF EXISTS `velez`.`Localidad` ;

CREATE TABLE IF NOT EXISTS `velez`.`Localidad` (
  `cp` INT NOT NULL,
  `Localidad` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`cp`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `velez`.`Ciclos`: Catálogo
-- -----------------------------------------------------
DROP TABLE IF EXISTS `velez`.`Ciclos` ;

CREATE TABLE IF NOT EXISTS `velez`.`Ciclos` (
  `idCiclo` VARCHAR(4) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idCiclo`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `velez`.`Asignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `velez`.`Asignatura` ;

CREATE TABLE IF NOT EXISTS `velez`.`Asignatura` (
  `idAsignatura` INT NOT NULL,
  nombreAsignatura VARCHAR(45) NOT NULL,
  `curso` VARCHAR(45) NULL,
  `idCiclo` VARCHAR(4) NULL,
  PRIMARY KEY (`idAsignatura`),
  CONSTRAINT FK_asignatura_ciclo FOREIGN KEY (idCiclo)
    REFERENCES ciclos(idCiclo))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `velez`.`Alumno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `velez`.`alumno` ;

CREATE TABLE IF NOT EXISTS `velez`.`alumno` (
  `idAlumno` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  `fecNacimiento` DATE NULL,
  `sexo` VARCHAR(6) NULL,
  `correo` VARCHAR(45) NULL,
  `nacionalidad` VARCHAR(45) NULL,
  `cp` INT NULL,
  `direccion` VARCHAR(100) NULL,
  PRIMARY KEY (`idAlumno`),
  CONSTRAINT FK_alumno_localidad FOREIGN KEY (cp)
    REFERENCES localidad(cp))
ENGINE = InnoDB;

ALTER TABLE alumno ADD CONSTRAINT chk_correo CHECK (correo LIKE '%@%.%');

-- -----------------------------------------------------
-- Table `velez`.`alumno_asinatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `velez`.`alumno_asignatura` (
  `idAlumno` VARCHAR(20) NOT NULL,
  `idAsignatura` INT NOT NULL,
  PRIMARY KEY (idAlumno, idAsignatura),
  CONSTRAINT FK_alumnoid FOREIGN KEY (idAlumno)
    REFERENCES alumno(idAlumno) ON DELETE CASCADE,
  CONSTRAINT FK_asignatura_id FOREIGN KEY (idAsignatura)
    REFERENCES asignatura(idAsignatura))
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `velez`.`Matricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `velez`.`Matricula` ;

CREATE TABLE IF NOT EXISTS `velez`.`Matricula` (
  `idMatricula` INT NOT NULL AUTO_INCREMENT,
  `idAlumno` VARCHAR(20) NULL,
  `fecMatricula` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` ENUM("Aceptada", "En espera") NULL DEFAULT 'En espera',
  PRIMARY KEY (`idMatricula`),
  CONSTRAINT FK_matricula_alumno FOREIGN KEY (idAlumno)
    REFERENCES alumno(idAlumno) ON DELETE CASCADE
)ENGINE = InnoDB;

DROP TABLE IF EXISTS `velez`.`login_users` ;

CREATE TABLE IF NOT EXISTS `login_users` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `passwd` varchar(50) NULL,
  PRIMARY KEY (`id`)
)ENGINE = InnoDB;