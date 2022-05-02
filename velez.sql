-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 25-04-2022 a las 15:47:05
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos`
--

DROP TABLE IF EXISTS `ciclos`;
CREATE TABLE IF NOT EXISTS `ciclos` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `grado` enum('medio','superior') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciclos`
--

INSERT INTO `ciclos` (`id`, `grado`, `nombre`) VALUES
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `primer_apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `dni` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `nacionalidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `situacion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `localidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `provincia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_postal` int(5) NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `correo_electronico` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `grado` int(2) NOT NULL,
  `ciclo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `curso` int(1) NOT NULL,
  `fecha_matricula` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jornada` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `estado_mat` enum('en espera','matriculado') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'en espera',
  PRIMARY KEY (`dni`),
  UNIQUE KEY `unica` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`id`, `nombre`, `primer_apellido`, `segundo_apellido`, `sexo`, `dni`, `nacionalidad`, `situacion`, `fecha_nacimiento`, `localidad`, `provincia`, `codigo_postal`, `direccion`, `correo_electronico`, `grado`, `ciclo`, `curso`, `fecha_matricula`, `jornada`, `estado_mat`) VALUES
(1, 'Borja', 'Rosa', 'Oterino', 'Hombre', '17481083W', 'Española', 'Estudiante', '1998-07-27', 'Écija', 'Sevilla', 41400, 'Calle Cartuja, 17, Bloque 1, 2ºB', 'broterino@gmail.com', 1, 'Administración de Sistemas Informáticos en Red', 2, '2022-03-17 20:18:44', 'Completa', 'matriculado'),
(3, 'LucÃ­a', 'Montes', 'Flores', 'Mujer', '22222222B', 'EspaÃ±ola', 'Trabajadora', '1996-07-06', 'Lantejuela', 'Sevilla', 41630, 'Calle probando, 1, 1ÂºN', 'lumofl@hotmail.es', 2, 'Desarrollo de Aplicaciones Web (DAW)(FP Dual)', 2, '2022-04-11 20:39:49', 'Parcial', 'en espera'),
(4, 'Paco', 'Ponce', 'Romero', 'Hombre', '11111111A', 'EspaÃ±ola', 'En paro', '1997-02-27', 'Estepa', 'Sevilla', 41560, 'Calle ejemplo, 7, 4ÂºD', 'paporo@hotmail.es', 1, 'AtenciÃ³n a Personas en SituaciÃ³n de Dependencia (APSD)', 1, '2022-04-13 19:54:05', 'Completa', 'matriculado'),
(6, 'AdriÃ¡n', 'VÃ©lez', 'Rubio', 'Hombre', '45812721D', 'EspaÃ±ol', 'Estudiante', '2000-03-12', 'AlmerÃ­a', 'AlmerÃ­a', 4005, 'C/ferromotor nÂº12 1ÂºA', 'AVRcomun@gmail.com', 2, 'AdministraciÃ³n de Sistemas InformÃ¡ticos en Red (ASIR)', 2, '2022-04-14 17:29:03', 'Completa', 'matriculado');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
