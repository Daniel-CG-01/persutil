-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database:3306
-- Generation Time: Dec 01, 2025 at 07:22 AM
-- Server version: 8.1.0
-- PHP Version: 8.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `contante`
--

-- --------------------------------------------------------

--
-- Table structure for table `alcalde`
--

CREATE TABLE `alcalde` (
  `id` bigint NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `autor` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `genero` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `reseña` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `valoracion` int NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `destacado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_lectura` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alfonso_respuesta`
--

CREATE TABLE `alfonso_respuesta` (
  `id` bigint NOT NULL,
  `autor` varchar(128) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `contenido` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` bigint NOT NULL,
  `titulo` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `contenido` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `etiquetas` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calinesculistacompra`
--

CREATE TABLE `calinesculistacompra` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `contenido` longtext NOT NULL,
  `fecha_compra_esperada` datetime DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `castanyera`
--

CREATE TABLE `castanyera` (
  `id` bigint NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` longtext CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `publico` tinyint(1) NOT NULL,
  `etiquetas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `garcia`
--

CREATE TABLE `garcia` (
  `id` bigint NOT NULL,
  `titulo` varchar(1000) COLLATE utf32_unicode_ci NOT NULL,
  `objetivo` varchar(1000) COLLATE utf32_unicode_ci NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL,
  `progreso` varchar(1000) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ideas`
--

CREATE TABLE `ideas` (
  `id` bigint NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `comentario` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `categoria` enum('IDEA','MEJORA','BUG') CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `publico` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pallas`
--

CREATE TABLE `pallas` (
  `id` bigint NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `contenido` longtext,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publicado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receta`
--

CREATE TABLE `receta` (
  `id` bigint NOT NULL,
  `nombre` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `ingredientes` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `preparacion` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recurso`
--

CREATE TABLE `recurso` (
  `id` bigint NOT NULL,
  `nombre` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publico` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sempertegui_pelicula`
--

CREATE TABLE `sempertegui_pelicula` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `genero` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `director` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `puntuacion` int NOT NULL,
  `anyo` year NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soares`
--

CREATE TABLE `soares` (
  `id` bigint NOT NULL,
  `preguntas` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publicacion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tarea`
--

CREATE TABLE `tarea` (
  `id` bigint NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf32 COLLATE utf32_unicode_ci,
  `categoria` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `completada` tinyint(1) NOT NULL DEFAULT '0',
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alcalde`
--
ALTER TABLE `alcalde`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alfonso_respuesta`
--
ALTER TABLE `alfonso_respuesta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calinesculistacompra`
--
ALTER TABLE `calinesculistacompra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `castanyera`
--
ALTER TABLE `castanyera`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `garcia`
--
ALTER TABLE `garcia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ideas`
--
ALTER TABLE `ideas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pallas`
--
ALTER TABLE `pallas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sempertegui_pelicula`
--
ALTER TABLE `sempertegui_pelicula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `soares`
--
ALTER TABLE `soares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alcalde`
--
ALTER TABLE `alcalde`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alfonso_respuesta`
--
ALTER TABLE `alfonso_respuesta`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calinesculistacompra`
--
ALTER TABLE `calinesculistacompra`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `castanyera`
--
ALTER TABLE `castanyera`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `garcia`
--
ALTER TABLE `garcia`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ideas`
--
ALTER TABLE `ideas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pallas`
--
ALTER TABLE `pallas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receta`
--
ALTER TABLE `receta`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recurso`
--
ALTER TABLE `recurso`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sempertegui_pelicula`
--
ALTER TABLE `sempertegui_pelicula`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soares`
--
ALTER TABLE `soares`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tarea`
--
ALTER TABLE `tarea`
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
COMMIT;