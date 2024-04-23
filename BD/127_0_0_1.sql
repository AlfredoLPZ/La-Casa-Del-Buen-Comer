-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2024 a las 21:40:59
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
  `fecha` date NOT NULL,
  `hora` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `comentario`, `fecha`, `hora`) VALUES
(1, '¡Los desayunos son increíbles! La auténtica comida mexicana que sirven aquí me hace sentir como si estuviera en casa. ¡Definitivamente volveré por más!', '2024-04-23', '0000-00-00'),
(2, 'La comida es deliciosa y auténtica. ¡Me encanta venir aquí para disfrutar de un buen platillo mexicano con un delicioso jugo fresco!', '2024-04-23', '0000-00-00'),
(3, 'El ambiente es acogedor y el servicio es excelente. Siempre que vengo aquí, me siento como en familia. ¡Recomiendo este lugar para cualquiera que busque una experiencia culinaria mexicana genuina!', '2024-04-23', '0000-00-00'),
(4, 'Probé el café y quedé impresionado. ¡Definitivamente uno de los mejores que he probado! ¡Gracias por brindar una experiencia tan deliciosa y auténtica!', '2024-04-23', '0000-00-00'),
(5, '¡Las comidas son espectaculares! La variedad en el menú es excelente y todo lo que he probado hasta ahora ha sido simplemente delicioso. ¡No puedo esperar para probar más platillos!', '2024-04-23', '0000-00-00'),
(6, '¡Los jugos frescos son una verdadera delicia! Refrescantes y llenos de sabor, son el complemento perfecto para cualquier comida. ¡Altamente recomendados!', '2024-04-23', '0000-00-00'),
(7, 'La comida mexicana tradicional nunca decepciona, y esta fonda lo demuestra. Desde los chilaquiles hasta los tacos, todo es simplemente delicioso. ¡Volveré pronto!', '2024-04-23', '0000-00-00'),
(8, '¡Excelente lugar para disfrutar de auténtica comida mexicana! Los sabores son auténticos y la atención es inmejorable. Definitivamente, mi nuevo lugar favorito para comer en la ciudad.', '2024-04-23', '0000-00-00'),
(9, '¡Los desayunos aquí son una maravilla! Desde los huevos rancheros hasta las enchiladas, todo está preparado con amor y se nota en cada bocado. ¡Muy recomendado para empezar el día con energía!', '2024-04-23', '0000-00-00'),
(10, '¡La mejor fonda de comida mexicana que he probado! La calidad de los ingredientes es excepcional y el personal siempre amable. ¡No puedo esperar para volver y probar más platillos!', '2024-04-23', '0000-00-00'),
(11, '¡Los jugos frescos son una revelación! Me encanta la variedad de sabores disponibles y lo refrescantes que son, especialmente en un día caluroso. ¡Definitivamente volveré por más!', '2024-04-23', '0000-00-00'),
(12, '¡Un rincón de México en cada plato! Cada bocado me transporta de vuelta a las calles de México. La comida aquí es una verdadera obra maestra culinaria. ¡No puedo esperar para regresar y probar algo nuevo!', '2024-04-23', '0000-00-00');

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
(1, 'Huevos Rancheros', 'Dos huevos fritos sobre tortillas de maíz bañadas en salsa ranchera, acompañados de frijoles refritos y aguacate.', 'DESAYUNO', 45, 'resources\\uploads\\1713841589051-D1-huevos-rancheros.jpg', 'SÍ'),
(2, 'Chilaquiles Verdes', 'Tortillas de maíz cortadas en triángulos y fritas, bañadas en salsa verde y acompañadas de crema, queso fresco y cebolla.', 'DESAYUNO', 40, 'resources\\uploads\\1713841641383-D2-chilaquiles-verdes.jpg', 'SÍ'),
(3, 'Molletes', 'Pan bolillo abierto y tostado, untado con frijoles refritos, queso gratinado y salsa pico de gallo.', 'DESAYUNO', 30, 'resources\\uploads\\1713841673263-D3-molletes.jpg', 'SÍ'),
(4, 'Enfrijoladas', 'Tortillas de maíz bañadas en salsa de frijoles refritos, rellenas de queso panela y servidas con crema y cebolla.', 'DESAYUNO', 50, 'resources\\uploads\\1713841725567-D4-enfrijoladas.jpg', 'SÍ'),
(5, 'Tacos Dorados', 'Tortillas de maíz rellenas de pollo o queso, doradas y servidas con salsa verde, crema y queso.', 'DESAYUNO', 45, 'resources\\uploads\\1713841810990-D5-tacos-dorados.jpg', 'SÍ'),
(6, 'Pozole', 'Sopa de maíz con carne de cerdo o pollo, servida con lechuga, rábano, cebolla, orégano y limón.', 'COMIDA', 60, 'resources\\uploads\\1713841844305-C1-pozole.jpg', 'SÍ'),
(7, 'Mole Poblano', 'Pollo en salsa de mole poblano, acompañado de arroz rojo y frijoles refritos.', 'COMIDA', 70, 'resources\\uploads\\1713841877107-C2-mole-poblano.jpg', 'SÍ'),
(8, 'Chiles Rellenos', 'Chile poblano relleno de queso o picadillo, empanizado y frito, bañado en salsa de jitomate.', 'COMIDA', 50, 'resources\\uploads\\1713841919421-C3-chiles-rellenos.jpg', 'SÍ'),
(9, 'Tostadas de Tinga', 'Tostadas de tortilla crujiente cubiertas con pollo deshebrado en salsa de chipotle, lechuga, crema y queso fresco.', 'COMIDA', 40, 'resources\\uploads\\1713841962033-C4-tostadas-de-tinga.jpg', 'SÍ'),
(10, 'Sopes de Chorizo', 'Sopes de masa de maíz fritos y cubiertos con chorizo, frijoles, lechuga, crema y queso fresco.', 'COMIDA', 70, 'resources\\uploads\\1713842029953-C5-sopes-de-chorizo.jpg', 'SÍ'),
(11, 'Agua de Horchata', 'Bebida refrescante hecha a base de arroz, leche, canela y azúcar. (Jarra de 1 litro)', 'BEBIDA', 20, 'resources\\uploads\\1713842803611-agua-horchata.jpg', 'SÍ'),
(12, 'Agua de Tamarindo', 'Bebida dulce y ácida hecha a partir de pulpa de tamarindo, azúcar y agua. (Jarra de 1 litro)', 'BEBIDA', 20, 'resources\\uploads\\1713842842505-agua-tamarindo.jpg', 'SÍ'),
(13, 'Agua de Limón', 'Refrescante bebida de limón endulzada con azúcar y agua. (Jarra de 1 litro)', 'BEBIDA', 15, 'resources\\uploads\\1713842900596-agua-limon.jpg', 'SÍ'),
(14, 'Jugo de Naranja Natural', 'Jugo fresco exprimido de naranjas maduras. (1 litro)', 'BEBIDA', 20, 'resources\\uploads\\1713843037280-juego-naranja.jpg', 'SÍ'),
(15, 'Jugo Verde', 'Mezcla de jugo de naranja, piña, espinaca, apio y pepino, conocido por sus propiedades saludables. (1 litro)', 'BEBIDA', 20, 'resources\\uploads\\1713843092944-juego-verde.jpg', 'SÍ'),
(16, 'Café Americano', 'Café negro preparado al estilo americano, con agua caliente.', 'BEBIDA', 15, 'resources\\uploads\\1713843223717-cafe-americano.jpg', 'SÍ'),
(17, 'Café de Olla', 'Café endulzado y aromatizado con piloncillo (azúcar de caña no refinada) y canela, tradicionalmente preparado en olla de barro.', 'BEBIDA', 20, 'resources\\uploads\\1713843250315-cafe-de-olla.jpg', 'SÍ'),
(18, 'Café con Leche', 'Café negro mezclado con leche caliente.', 'BEBIDA', 20, 'resources\\uploads\\1713843286700-cafe-con-leche.jpg', 'SÍ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `name`, `pass`) VALUES
(3, 'admin', 'alfredo lopez', '$2a$08$/16wZHNM/X4ZTWIs0pptp.vEwwpBDkC6MqIro5BWzczaIyiALEtTy'),
(7, 'ultimo', 'el ultimo usuario creado', '$2a$08$AwluiRcmPSLjEY.Wlg0BU.jZ2XGm21.l94oLXlEGpEGNVG9DMeboW'),
(9, 'alfredo', 'alfredo lopez segovia', '$2a$08$bO7DuOaAKSIAibqA4KqVieTn4cwCVNPOHuP64LHkDRNA6CSAS1C0C');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `platillos`
--
ALTER TABLE `platillos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
