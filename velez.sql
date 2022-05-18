-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-05-2022 a las 18:24:53
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `velez`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE IF NOT EXISTS `alumno` (
  `idAlumno` varchar(20) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido1` varchar(45) DEFAULT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `fecNacimiento` date DEFAULT NULL,
  `sexo` varchar(6) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAlumno`),
  KEY `FK_alumno_localidad` (`cp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_asignatura`
--

DROP TABLE IF EXISTS `alumno_asignatura`;
CREATE TABLE IF NOT EXISTS `alumno_asignatura` (
  `idAlumno` varchar(20) NOT NULL,
  `idAsignatura` int(11) NOT NULL,
  PRIMARY KEY (`idAlumno`,`idAsignatura`),
  KEY `FK_asignatura_id` (`idAsignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
CREATE TABLE IF NOT EXISTS `asignatura` (
  `idAsignatura` int(11) NOT NULL,
  `nombreAsignatura` varchar(45) NOT NULL,
  `curso` varchar(45) DEFAULT NULL,
  `idCiclo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`idAsignatura`),
  KEY `FK_asignatura_ciclo` (`idCiclo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`idAsignatura`, `nombreAsignatura`, `curso`, `idCiclo`) VALUES
(1, 'Lenguajes de Marcas', 'primero', 'DAW'),
(2, 'Redes', 'primero', 'ASIR'),
(3, 'IMWEB', 'segundo', 'ASIR'),
(4, 'ADSGB', 'segundo', 'ASIR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos`
--

DROP TABLE IF EXISTS `ciclos`;
CREATE TABLE IF NOT EXISTS `ciclos` (
  `idCiclo` varchar(4) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCiclo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciclos`
--

INSERT INTO `ciclos` (`idCiclo`, `nombre`) VALUES
('ASIR', 'Administración Sistemas Informáticos en Red'),
('DAM', 'Desarrollo de Aplicaciones Multiplataforma'),
('DAW', 'Desarrollo de Aplicaciones Web'),
('SMR', 'Sistemas Microinformáticos en Red');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

DROP TABLE IF EXISTS `localidad`;
CREATE TABLE IF NOT EXISTS `localidad` (
  `cp` int(11) NOT NULL,
  `Localidad` varchar(45) DEFAULT NULL,
  `Provincia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`cp`, `Localidad`, `Provincia`) VALUES
(14140, 'La Victoria', 'Córdoba'),
(41400, 'Ecija', 'Sevilla'),
(41560, 'Estepa', 'Sevilla'),
(41630, 'Lantejuela', 'Sevilla'),
(41640, 'Osuna', 'Sevilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_users`
--

DROP TABLE IF EXISTS `login_users`;
CREATE TABLE IF NOT EXISTS `login_users` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `passwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login_users`
--

INSERT INTO `login_users` (`id`, `usuario`, `passwd`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Matricula`
--

DROP TABLE IF EXISTS `Matricula`;
CREATE TABLE IF NOT EXISTS `Matricula` (
  `idMatricula` int(11) NOT NULL AUTO_INCREMENT,
  `idAlumno` varchar(20) DEFAULT NULL,
  `fecMatricula` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('Aceptada','En espera') DEFAULT 'En espera',
  PRIMARY KEY (`idMatricula`),
  KEY `FK_Matricula_alumno` (`idAlumno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `FK_alumno_localidad` FOREIGN KEY (`cp`) REFERENCES `localidad` (`cp`);

--
-- Filtros para la tabla `alumno_asignatura`
--
ALTER TABLE `alumno_asignatura`
  ADD CONSTRAINT `FK_alumnoid` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_asignatura_id` FOREIGN KEY (`idAsignatura`) REFERENCES `asignatura` (`idAsignatura`);

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `FK_asignatura_ciclo` FOREIGN KEY (`idCiclo`) REFERENCES `ciclos` (`idCiclo`);

--
-- Filtros para la tabla `Matricula`
--
ALTER TABLE `Matricula`
  ADD CONSTRAINT `FK_Matricula_alumno` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
