-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-04-2024 a las 16:18:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lcdbc`
--
CREATE DATABASE IF NOT EXISTS `lcdbc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lcdbc`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `comentario` varchar(250) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `hora` time NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `comentario`, `fecha`, `hora`) VALUES
(1, 'primer comentario', '2024-03-31', '00:00:00'),
(2, 'segundo comentario', '2024-03-31', '00:00:00'),
(3, 'tercer comentario', '2024-03-31', '00:00:00'),
(4, 'cuarto comentario', '2024-03-31', '00:00:00'),
(5, 'quinto comentario', '2024-03-31', '00:00:00'),
(6, 'sexto comentatio', '2024-03-31', '00:00:00'),
(7, 'septimo comentario', '2024-03-31', '00:00:00'),
(8, 'comentario con fecha y hora', '2024-04-02', '16:03:48'),
(9, 'comentario en clase', '2024-04-03', '17:42:31'),
(10, 'hola', '2024-04-05', '15:13:28'),
(11, 'hola de nuevo', '2024-04-05', '15:16:51'),
(12, 'comentario sin recargar pagina', '2024-04-05', '15:25:33'),
(13, 'mas comentarios', '2024-04-05', '16:46:27'),
(14, 'otro comentario', '2024-04-05', '16:46:39'),
(15, 'otro', '2024-04-05', '17:01:30'),
(16, 'mas', '2024-04-05', '17:01:34'),
(17, 'nuevo', '2024-04-05', '17:01:38'),
(18, 'otro', '2024-04-05', '17:01:42'),
(19, 'jajajaja', '2024-04-05', '17:01:46'),
(20, 'frwfgwerg', '2024-04-05', '17:01:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillos`
--

CREATE TABLE `platillos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descrip` varchar(250) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `imagen` text NOT NULL,
  `visible` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `platillos`
--

INSERT INTO `platillos` (`id`, `nombre`, `descrip`, `categoria`, `precio`, `imagen`, `visible`) VALUES
(24, 'Sopa', 'NUEVA DESCRIPCION', 'DESAYUNO', 5000, 'resources\\uploads\\1704591005382-Ramen.jpg', 'SÍ'),
(25, 'Donburi', 'Cuencos de arroz cubiertos con ingredientes como teriyaki de pollo, katsu de cerdo o sashimi.', 'COMIDA', 100, 'resources\\uploads\\1704591730771-Donburi.jpg', 'SÍ'),
(26, 'Bento', 'Cajas de almuerzo japonesas con porciones de arroz, carne (teriyaki, yakitori), pescado y verduras.', 'CENA', 200, 'resources\\uploads\\1704591757710-Bento.jpg', 'SÍ'),
(27, 'Tamago Sando', 'Un sándwich japonés con tortilla dulce y esponjosa.', 'COMIDA', 100, 'resources\\uploads\\1704591783471-Tamago Sando.jpeg', 'SÍ'),
(28, 'Okonomiyaki', 'Una especie de panqueque japonés que puede incluir ingredientes como repollo, carne y mariscos.', 'CENA', 100, 'resources\\uploads\\1704591812367-Okonomiyaki.jpg', 'SÍ'),
(29, 'Ochazuke', 'Arroz con té verde caliente y diversos toppings como alga nori, umeboshi y pescado.', 'DESAYUNO', 100, 'resources\\uploads\\1704591835483-Ochazuke.jpg', 'SÍ'),
(31, 'Sushi', 'Una amplia gama de rollos de sushi, sashimi y nigiri preparados con pescado crudo, mariscos, vegetales y arroz avinagrado.', 'DESAYUNO', 200, 'resources\\uploads\\1705333797638-Sushi.jpg', 'NO'),
(32, 'El que sea', 'ver si esta visible', 'DESAYUNO', 600, 'resources\\uploads\\1711991660769-Donburi.jpg', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `name`, `rol`, `pass`) VALUES
(3, 'admin', 'admin', 'ADMINISTRADOR', '$2a$08$/16wZHNM/X4ZTWIs0pptp.vEwwpBDkC6MqIro5BWzczaIyiALEtTy'),
(7, 'ultimo', 'el ultimo usuario creado', 'REPARTIDOR', '$2a$08$AwluiRcmPSLjEY.Wlg0BU.jZ2XGm21.l94oLXlEGpEGNVG9DMeboW'),
(9, 'alfredo', 'alfredo lopez segovia', 'REPARTIDOR', '$2a$08$bO7DuOaAKSIAibqA4KqVieTn4cwCVNPOHuP64LHkDRNA6CSAS1C0C');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `platillos`
--
ALTER TABLE `platillos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `platillos`
--
ALTER TABLE `platillos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
