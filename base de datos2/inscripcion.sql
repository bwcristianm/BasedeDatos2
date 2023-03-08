-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2023 a las 14:53:42
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inscripcion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `COD_CARRERA` decimal(3,0) NOT NULL,
  `NOMBRE_CARRERA` varchar(30) DEFAULT NULL,
  `MODALIDAD` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`COD_CARRERA`, `NOMBRE_CARRERA`, `MODALIDAD`) VALUES
('1', 'Ing de Sistemas', 'Semestral'),
('2', 'Medicina General', 'Se'),
('3', 'Derecho', 'Semestral'),
('4', 'Contaduria Publica', 'Anual'),
('5', 'Diseño Grafico', 'Anual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `CEDULA` decimal(9,0) NOT NULL,
  `COD_USR` decimal(3,0) NOT NULL,
  `PATERNO` varchar(30) DEFAULT NULL,
  `MATERNO` varchar(30) DEFAULT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `FNACIMIENTO` date DEFAULT NULL,
  `EXPEDIDO` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`CEDULA`, `COD_USR`, `PATERNO`, `MATERNO`, `NOMBRE`, `FNACIMIENTO`, `EXPEDIDO`) VALUES
('3333', '1', 'Hightower', 'Flores', 'Margo', '2000-03-13', 'LP'),
('4444', '1', 'Tully', 'Masquez', 'Marta', '2001-10-30', 'CBBA'),
('5555', '2', 'Lanister', 'Torres', 'Jorge', '2000-02-01', 'CBBA'),
('6666', '2', 'Lanister', 'Torres', 'Adalid', '2000-09-04', 'CBBA'),
('7777', '2', 'Targerian', 'Dragon', 'Reyna', '2002-07-20', 'TJA'),
('8888', '2', 'Targerian', 'Dragon', 'Damian', '2000-06-15', 'TJA'),
('9999', '2', 'Valirio', 'Black', 'Oto', '2001-08-12', 'SC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `COD_INS` decimal(5,0) NOT NULL,
  `COD_MATERIA` decimal(3,0) NOT NULL,
  `CEDULA` decimal(9,0) NOT NULL,
  `FECHA_INS` date DEFAULT NULL,
  `GESTION` decimal(5,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `COD_MATERIA` decimal(3,0) NOT NULL,
  `COD_CARRERA` decimal(3,0) NOT NULL,
  `NOMBRE_MATERIA` varchar(30) DEFAULT NULL,
  `NIVEL` decimal(2,0) DEFAULT NULL,
  `GESTION` decimal(5,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`COD_MATERIA`, `COD_CARRERA`, `NOMBRE_MATERIA`, `NIVEL`, `GESTION`) VALUES
('1', '1', 'Programacion', '1', '2023'),
('2', '1', 'Electronica', '1', '2023');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE `recursos` (
  `COD_REC` decimal(3,0) NOT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `NOMBRE_ENLACE` varchar(100) DEFAULT NULL,
  `ESTADO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `COD_ROL` decimal(3,0) NOT NULL,
  `NOMBRE_ROL` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`COD_ROL`, `NOMBRE_ROL`) VALUES
('1', 'Administrador'),
('2', 'Academico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_recurso`
--

CREATE TABLE `rol_recurso` (
  `COD_RREC` decimal(3,0) NOT NULL,
  `COD_REC` decimal(3,0) NOT NULL,
  `COD_ROL` decimal(3,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `COD_USR` decimal(3,0) NOT NULL,
  `COD_ROL` decimal(3,0) NOT NULL,
  `NOMBRE_USR` varchar(30) DEFAULT NULL,
  `PATERNO_USR` varchar(30) DEFAULT NULL,
  `MATERNO_USR` varchar(30) DEFAULT NULL,
  `CEDULA_USR` decimal(8,0) DEFAULT NULL,
  `EXPEDIDO_USR` varchar(10) DEFAULT NULL,
  `CODIGO` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`COD_USR`, `COD_ROL`, `NOMBRE_USR`, `PATERNO_USR`, `MATERNO_USR`, `CEDULA_USR`, `EXPEDIDO_USR`, `CODIGO`, `PASSWORD`) VALUES
('1', '1', 'Roberth', 'Baratheon', 'Tito', '1111', 'LP', 'SIS00001111', 'Ouristhefury'),
('2', '2', 'Ned', 'Stark', 'Nieves', '2222', 'OR', 'MED00002222', 'Winteriscoming');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`COD_CARRERA`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`CEDULA`),
  ADD KEY `FK_REGISTRA` (`COD_USR`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`COD_INS`),
  ADD KEY `FK_INSCRIPCION` (`COD_MATERIA`),
  ADD KEY `FK_INSCRIPCION2` (`CEDULA`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`COD_MATERIA`),
  ADD KEY `FK_PERTENECE` (`COD_CARRERA`);

--
-- Indices de la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`COD_REC`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`COD_ROL`);

--
-- Indices de la tabla `rol_recurso`
--
ALTER TABLE `rol_recurso`
  ADD PRIMARY KEY (`COD_RREC`),
  ADD KEY `FK_ROL_RECURSO` (`COD_REC`),
  ADD KEY `FK_ROL_RECURSO2` (`COD_ROL`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`COD_USR`),
  ADD KEY `FK_TIENE` (`COD_ROL`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `FK_REGISTRA` FOREIGN KEY (`COD_USR`) REFERENCES `usuario` (`COD_USR`);

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `FK_INSCRIPCION` FOREIGN KEY (`COD_MATERIA`) REFERENCES `materia` (`COD_MATERIA`),
  ADD CONSTRAINT `FK_INSCRIPCION2` FOREIGN KEY (`CEDULA`) REFERENCES `estudiante` (`CEDULA`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `FK_PERTENECE` FOREIGN KEY (`COD_CARRERA`) REFERENCES `carrera` (`COD_CARRERA`);

--
-- Filtros para la tabla `rol_recurso`
--
ALTER TABLE `rol_recurso`
  ADD CONSTRAINT `FK_ROL_RECURSO` FOREIGN KEY (`COD_REC`) REFERENCES `recursos` (`COD_REC`),
  ADD CONSTRAINT `FK_ROL_RECURSO2` FOREIGN KEY (`COD_ROL`) REFERENCES `rol` (`COD_ROL`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_TIENE` FOREIGN KEY (`COD_ROL`) REFERENCES `rol` (`COD_ROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
