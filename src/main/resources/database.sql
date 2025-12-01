-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 10-11-2025 a las 11:28:03
-- Versión del servidor: 8.4.5
-- Versión de PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `persutildb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `id` bigint NOT NULL,
  `titulo` varchar(1024) COLLATE utf32_unicode_ci NOT NULL,
  `contenido` longtext COLLATE utf32_unicode_ci NOT NULL,
  `etiquetas` varchar(1024) COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zanon`
--

CREATE TABLE `zanon` (
  `id` bigint NOT NULL,
  `titulo` varchar(1024) COLLATE utf32_unicode_ci NOT NULL,
  `contenido` longtext COLLATE utf32_unicode_ci NOT NULL,
  `etiquetas` varchar(1024) COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `duracion` int NOT NULL,
  `dificultad` enum('baja','media','alta') CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `publico` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `zanon`
--

INSERT INTO `zanon` (`id`, `titulo`, `contenido`, `etiquetas`, `fecha_creacion`, `fecha_modificacion`, `duracion`, `dificultad`, `imagen`, `publico`) VALUES
(113, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-28 10:22:44', '2025-11-28 11:37:52', 18, 'media', '/img/piernas.avif', 1),
(114, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-28 10:23:02', NULL, 36, 'alta', '/img/brazos.avif', 1),
(115, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-28 10:23:02', NULL, 5, 'media', '/img/pecho.jpg', 1),
(116, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-28 10:23:02', NULL, 7, 'baja', '/img/hombro.jpg', 1),
(117, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-28 10:23:02', NULL, 22, 'alta', '/img/espalda.jpg', 1),
(118, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-28 10:23:02', NULL, 52, 'baja', '/img/pecho.jpg', 0),
(119, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-28 10:23:02', NULL, 17, 'alta', '/img/hombro.jpg', 0),
(120, 'full body', 'Sentadilla 3x10, Press banca 3x10, Remo 3x10', 'sentadilla, press, banca', '2025-11-28 10:23:02', NULL, 52, 'baja', '/img/fullbody.jpeg', 1),
(121, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-28 10:23:02', NULL, 16, 'media', '/img/espalda.jpg', 0),
(122, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-28 10:23:02', NULL, 32, 'alta', '/img/espalda.jpg', 0),
(123, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-28 11:34:26', NULL, 45, 'alta', '/img/hombro.jpg', 0),
(124, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-28 11:34:26', NULL, 6, 'baja', '/img/brazos.avif', 1),
(125, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-28 11:34:27', NULL, 49, 'baja', '/img/espalda.jpg', 1),
(126, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-28 11:34:27', NULL, 21, 'media', '/img/piernas.avif', 1),
(127, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-28 11:34:27', NULL, 42, 'alta', '/img/hombro.jpg', 0),
(128, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-28 11:34:27', NULL, 23, 'media', '/img/hombro.jpg', 0),
(129, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-28 11:34:27', NULL, 28, 'alta', '/img/brazos.avif', 1),
(130, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-28 11:34:27', NULL, 11, 'media', '/img/piernas.avif', 0),
(131, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-28 11:34:27', NULL, 11, 'baja', '/img/pecho.jpg', 0),
(132, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-28 11:34:27', NULL, 40, 'baja', '/img/pecho.jpg', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `zanon`
--
ALTER TABLE `zanon`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `zanon`
--
ALTER TABLE `zanon`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;