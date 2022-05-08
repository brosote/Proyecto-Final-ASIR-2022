-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-05-2022 a las 16:08:18
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
CREATE SCHEMA IF NOT EXISTS velez;
USE velez;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `dni` varchar(9) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `primer_apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `segundo_apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo_electronico` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ciclo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `curso` int(1) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos`
--

DROP TABLE IF EXISTS `ciclos`;
CREATE TABLE IF NOT EXISTS `ciclos` (
  `id_ciclos` int(2) NOT NULL AUTO_INCREMENT,
  `grado` enum('medio','superior') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_ciclos`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ciclos`
--

INSERT INTO `ciclos` (`id_ciclos`, `grado`, `nombre`) VALUES
(1, 'medio', 'Atención a Personas en Situación de Dependencia (APSD)'),
(2, 'medio', 'Gestión Administrativa (GA)'),
(3, 'medio', 'Sistemas Microinformáticos y Redes (SMR)'),
(4, 'superior', 'Administración y Finanzas (AF)'),
(5, 'superior', 'Administración de Sistemas Informáticos en Red (ASIR)'),
(6, 'superior', 'Desarrollo de Aplicaciones Web (DAW)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_users`
--

DROP TABLE IF EXISTS `login_users`;
CREATE TABLE IF NOT EXISTS `login_users` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `passwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `login_users`
--

INSERT INTO `login_users` (`id`, `usuario`, `passwd`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
CREATE TABLE IF NOT EXISTS `matriculas` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `primer_apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `segundo_apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dni` varchar(9) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nacionalidad` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `situacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `localidad` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `provincia` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo_postal` int(5) NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo_electronico` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grado` int(2) NOT NULL,
  `ciclo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `curso` int(1) NOT NULL,
  `fecha_matricula` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jornada` varchar(8) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado_mat` enum('en espera','matriculado') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'en espera',
  `id_ciclos` int(2),
  PRIMARY KEY (`dni`),
  UNIQUE KEY `unica` (`id`),
  FOREIGN KEY (id_ciclos) REFERENCES ciclos(id_ciclos)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`id`, `nombre`, `primer_apellido`, `segundo_apellido`, `sexo`, `dni`, `nacionalidad`, `situacion`, `fecha_nacimiento`, `localidad`, `provincia`, `codigo_postal`, `direccion`, `correo_electronico`, `grado`, `ciclo`, `curso`, `fecha_matricula`, `jornada`, `estado_mat`) VALUES
(3, 'LucÃ­a', 'Montes', 'Flores', 'Mujer', '22222222B', 'EspaÃ±ola', 'Trabajadora', '1996-07-06', 'Lantejuela', 'Sevilla', 41630, 'Calle probando, 1, 1ÂºN', 'lumofl@hotmail.es', 2, 'Desarrollo de Aplicaciones Web (DAW)(FP Dual)', 2, '2022-04-11 20:39:49', 'Parcial', 'matriculado'),
(4, 'Paco', 'Ponce', 'Romero', 'Hombre', '11111111A', 'EspaÃ±ola', 'En paro', '1997-02-27', 'Estepa', 'Sevilla', 41560, 'Calle ejemplo, 7, 4ÂºD', 'paporo@hotmail.es', 1, 'AtenciÃ³n a Personas en SituaciÃ³n de Dependencia (APSD)', 1, '2022-04-13 19:54:05', 'Completa', 'en espera'),
(6, 'AdriÃ¡n', 'VÃ©lez', 'Rubio', 'Hombre', '45812721D', 'EspaÃ±ol', 'Estudiante', '2000-03-12', 'AlmerÃ­a', 'AlmerÃ­a', 4005, 'C/ferromotor nÂº12 1ÂºA', 'AVRcomun@gmail.com', 2, 'AdministraciÃ³n de Sistemas InformÃ¡ticos en Red (ASIR)', 2, '2022-04-14 17:29:03', 'Completa', 'en espera'),
(8, 'Borja', 'Rosa', 'Oterino', 'Hombre', '17481083W', 'EspaÃ±ola', 'Estudiante', '1998-07-27', 'Ã‰cija', 'Sevilla', 41400, 'Calle Cartuja, 17, Bloque 1, 2ÂºB', 'broterino@gmail.com', 2, 'AdministraciÃ³n de Sistemas InformÃ¡ticos en Red (ASIR)', 2, '2022-05-05 16:04:01', 'Completa', 'en espera');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
