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
  `imagen` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `zanon`
--

INSERT INTO `zanon` (`id`, `titulo`, `contenido`, `etiquetas`, `fecha_creacion`, `fecha_modificacion`, `duracion`, `dificultad`, `imagen`) VALUES
(43, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-27 12:33:24', NULL, 10, 'alta', '/img/hombro.jpg'),
(44, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-27 12:33:50', '2025-11-27 13:01:36', 49, 'media', '/img/hombro.jpg'),
(45, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 12:33:50', NULL, 15, 'media', '/img/piernas.avif'),
(46, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-27 12:33:50', NULL, 55, 'baja', '/img/pecho.jpg'),
(47, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-27 12:33:50', NULL, 23, 'baja', '/img/brazos.avif'),
(48, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-27 12:33:50', NULL, 8, 'baja', '/img/hombro.jpg'),
(49, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-27 12:33:50', NULL, 26, 'baja', '/img/pecho.jpg'),
(50, 'full body', 'Sentadilla 3x10, Press banca 3x10, Remo 3x10', 'sentadilla, press, banca', '2025-11-27 12:33:50', NULL, 46, 'baja', '/img/fullbody.jpeg'),
(51, 'full body', 'Sentadilla 3x10, Press banca 3x10, Remo 3x10', 'sentadilla, press, banca', '2025-11-27 12:33:51', NULL, 36, 'alta', '/img/fullbody.jpeg'),
(52, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-27 12:33:51', NULL, 38, 'baja', '/img/brazos.avif'),
(53, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 13:02:00', NULL, 52, 'alta', '/img/piernas.avif'),
(54, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 13:02:00', NULL, 31, 'baja', '/img/piernas.avif'),
(55, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-27 13:02:00', NULL, 31, 'baja', '/img/hombro.jpg'),
(56, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 13:02:00', NULL, 42, 'media', '/img/piernas.avif'),
(57, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-27 13:02:00', NULL, 47, 'baja', '/img/hombro.jpg'),
(58, 'full body', 'Sentadilla 3x10, Press banca 3x10, Remo 3x10', 'sentadilla, press, banca', '2025-11-27 13:02:00', NULL, 8, 'alta', '/img/fullbody.jpeg'),
(59, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-27 13:02:00', NULL, 32, 'media', '/img/pecho.jpg'),
(60, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-27 13:02:01', NULL, 51, 'alta', '/img/espalda.jpg'),
(61, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-27 13:02:01', NULL, 24, 'baja', '/img/brazos.avif'),
(62, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-27 13:02:01', NULL, 45, 'baja', '/img/pecho.jpg'),
(63, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-27 13:02:01', NULL, 28, 'media', '/img/espalda.jpg'),
(64, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 13:02:01', NULL, 44, 'baja', '/img/piernas.avif'),
(65, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-27 13:02:01', NULL, 25, 'baja', '/img/brazos.avif'),
(66, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-27 13:02:01', NULL, 28, 'baja', '/img/espalda.jpg'),
(67, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-27 13:02:01', NULL, 18, 'baja', '/img/hombro.jpg'),
(68, 'hombro', 'Press militar 4x8, Elevaciones laterales 3x12', 'press, militar, elevaciones, laterales', '2025-11-27 13:02:01', NULL, 13, 'alta', '/img/hombro.jpg'),
(69, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-27 13:02:01', NULL, 35, 'alta', '/img/brazos.avif'),
(70, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-27 13:02:01', NULL, 47, 'media', '/img/espalda.jpg'),
(71, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-27 13:02:01', NULL, 33, 'media', '/img/espalda.jpg'),
(72, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-27 13:02:01', NULL, 41, 'media', '/img/brazos.avif'),
(73, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-27 13:02:01', NULL, 41, 'baja', '/img/espalda.jpg'),
(74, 'full body', 'Sentadilla 3x10, Press banca 3x10, Remo 3x10', 'sentadilla, press, banca', '2025-11-27 13:02:01', NULL, 40, 'alta', '/img/fullbody.jpeg'),
(75, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-27 13:02:02', NULL, 31, 'baja', '/img/brazos.avif'),
(76, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 13:02:02', NULL, 14, 'media', '/img/piernas.avif'),
(77, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-27 13:02:02', NULL, 18, 'alta', '/img/pecho.jpg'),
(78, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-27 13:02:02', NULL, 60, 'media', '/img/brazos.avif'),
(79, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-27 13:02:02', NULL, 36, 'alta', '/img/pecho.jpg'),
(80, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-27 13:02:02', NULL, 29, 'baja', '/img/brazos.avif'),
(81, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-27 13:02:02', NULL, 47, 'baja', '/img/espalda.jpg'),
(82, 'full body', 'Sentadilla 3x10, Press banca 3x10, Remo 3x10', 'sentadilla, press, banca', '2025-11-27 13:02:02', NULL, 59, 'baja', '/img/fullbody.jpeg'),
(83, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-27 13:02:02', NULL, 27, 'baja', '/img/pecho.jpg'),
(84, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 13:02:02', NULL, 32, 'baja', '/img/piernas.avif'),
(85, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-27 13:02:02', NULL, 48, 'alta', '/img/brazos.avif'),
(86, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 13:02:02', NULL, 50, 'baja', '/img/piernas.avif'),
(87, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 13:02:02', NULL, 58, 'baja', '/img/piernas.avif'),
(88, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 13:02:02', NULL, 47, 'media', '/img/piernas.avif'),
(89, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-27 13:02:02', NULL, 33, 'baja', '/img/pecho.jpg'),
(90, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-27 13:02:02', NULL, 18, 'baja', '/img/espalda.jpg'),
(91, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-27 13:02:03', NULL, 22, 'media', '/img/piernas.avif'),
(92, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-27 13:02:03', NULL, 18, 'media', '/img/espalda.jpg');

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

COMMIT;