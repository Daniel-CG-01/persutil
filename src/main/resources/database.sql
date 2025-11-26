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
  `publico` tinyint(1) NOT NULL,
  `categoria` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `duracion` int NOT NULL,
  `dificultad` enum('baja','media','alta') CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `zanon`
--

INSERT INTO `zanon` (`id`, `titulo`, `contenido`, `etiquetas`, `fecha_creacion`, `fecha_modificacion`, `publico`, `categoria`, `duracion`, `dificultad`, `imagen`) VALUES
(21, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-25 09:43:06', NULL, 1, 'brazos', 28, 'baja', NULL),
(22, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-25 09:43:08', NULL, 0, 'espalda', 5, 'media', NULL),
(23, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-25 09:43:08', NULL, 0, 'brazos', 5, 'baja', NULL),
(24, 'pecho', 'Press banca 4x8, Aperturas 3x12, Fondos 3x10', 'press, banca, aperturas, fondos', '2025-11-25 09:43:08', NULL, 0, 'pecho', 32, 'media', NULL),
(25, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-25 09:43:08', NULL, 1, 'brazos', 50, 'baja', NULL),
(26, 'espalda', 'Dominadas 4x6, Remo con barra 4x8, Jalón 3x12', 'dominadas, barra, jalón', '2025-11-25 09:43:08', NULL, 0, 'espalda', 24, 'baja', NULL),
(27, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-25 09:43:08', NULL, 0, 'piernas', 51, 'media', NULL),
(28, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-25 09:43:08', NULL, 0, 'piernas', 40, 'alta', NULL),
(29, 'brazos', 'Curl bíceps 4x10, Tríceps polea 4x12', 'bíceps, tríceps, polea', '2025-11-25 09:43:08', NULL, 0, 'brazos', 49, 'media', NULL),
(30, 'piernas', 'Sentadilla 4x8, Prensa 4x12, Extensiones 3x15', 'sentadilla, prensa, extensiones', '2025-11-25 09:43:08', NULL, 1, 'piernas', 36, 'alta', NULL);

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

COMMIT;