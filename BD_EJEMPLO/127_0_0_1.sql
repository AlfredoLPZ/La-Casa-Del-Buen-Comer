-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2024 a las 22:05:18
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
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `comentario`, `fecha`, `hora`) VALUES
(1, '¡Los desayunos son increíbles! La auténtica comida mexicana que sirven aquí me hace sentir como si estuviera en casa. ¡Definitivamente volveré por más!', '2024-04-23', '00:00:00'),
(2, 'La comida es deliciosa y auténtica. ¡Me encanta venir aquí para disfrutar de un buen platillo mexicano con un delicioso jugo fresco!', '2024-04-23', '00:00:00'),
(3, 'El ambiente es acogedor y el servicio es excelente. Siempre que vengo aquí, me siento como en familia. ¡Recomiendo este lugar para cualquiera que busque una experiencia culinaria mexicana genuina!', '2024-04-23', '00:00:00'),
(4, 'Probé el café y quedé impresionado. ¡Definitivamente uno de los mejores que he probado! ¡Gracias por brindar una experiencia tan deliciosa y auténtica!', '2024-04-23', '00:00:00'),
(5, '¡Las comidas son espectaculares! La variedad en el menú es excelente y todo lo que he probado hasta ahora ha sido simplemente delicioso. ¡No puedo esperar para probar más platillos!', '2024-04-23', '00:00:00'),
(6, '¡Los jugos frescos son una verdadera delicia! Refrescantes y llenos de sabor, son el complemento perfecto para cualquier comida. ¡Altamente recomendados!', '2024-04-23', '00:00:00'),
(7, 'La comida mexicana tradicional nunca decepciona, y esta fonda lo demuestra. Desde los chilaquiles hasta los tacos, todo es simplemente delicioso. ¡Volveré pronto!', '2024-04-23', '00:00:00'),
(8, '¡Excelente lugar para disfrutar de auténtica comida mexicana! Los sabores son auténticos y la atención es inmejorable. Definitivamente, mi nuevo lugar favorito para comer en la ciudad.', '2024-04-23', '00:00:00'),
(9, '¡Los desayunos aquí son una maravilla! Desde los huevos rancheros hasta las enchiladas, todo está preparado con amor y se nota en cada bocado. ¡Muy recomendado para empezar el día con energía!', '2024-04-23', '00:00:00'),
(10, '¡La mejor fonda de comida mexicana que he probado! La calidad de los ingredientes es excepcional y el personal siempre amable. ¡No puedo esperar para volver y probar más platillos!', '2024-04-23', '00:00:00'),
(11, '¡Los jugos frescos son una revelación! Me encanta la variedad de sabores disponibles y lo refrescantes que son, especialmente en un día caluroso. ¡Definitivamente volveré por más!', '2024-04-23', '00:00:00'),
(12, '¡Un rincón de México en cada plato! Cada bocado me transporta de vuelta a las calles de México. La comida aquí es una verdadera obra maestra culinaria. ¡No puedo esperar para regresar y probar algo nuevo!', '2024-04-23', '00:00:00'),
(13, 'Este comentario es para las pruebas de la pagina web', '2024-05-08', '08:40:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `pedido_id` varchar(5) NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `nota` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `pedido_id`, `fecha`, `total`, `status`, `nota`) VALUES
(1, '00001', '2024-06-05', 245.00, 'Listo', 'nota temporal'),
(2, '00002', '2024-06-05', 200.00, 'Listo', 'nota temporal'),
(3, '00003', '2024-06-05', 200.00, 'Listo', 'nota temporal'),
(4, '00004', '2024-06-05', 200.00, 'Listo', 'nota temporal'),
(5, '00005', '2024-06-05', 200.00, 'Listo', 'nota temporal'),
(6, '00006', '2024-06-05', 115.00, 'Listo', 'nota temporal'),
(7, '00007', '2024-06-05', 200.00, 'Listo', 'nota temporal'),
(8, '00008', '2024-06-05', 85.00, 'Listo', 'nota temporal'),
(9, '00009', '2024-06-05', 115.00, 'Listo', 'nota temporal'),
(10, '00010', '2024-06-05', 160.00, 'Listo', 'nota temporal'),
(11, '00011', '2024-06-05', 45.00, 'Listo', 'nota temporal'),
(12, '00012', '2024-06-05', 165.00, 'Listo', 'nota temporal'),
(13, '00013', '2024-06-05', 335.00, 'Listo', 'nota temporal'),
(14, '00014', '2024-06-16', 115.00, 'Listo', 'nota temporal'),
(15, '00015', '2024-06-16', 165.00, 'Listo', 'los molletes van sin cebolla'),
(16, '00016', '2024-06-16', 120.00, '', 'Uno de los pozoles no lleva lechuga'),
(17, '00017', '2024-06-16', 65.00, '', 'El café va sin azúcar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalles`
--

CREATE TABLE `pedido_detalles` (
  `id` int(11) NOT NULL,
  `pedido_id` varchar(5) NOT NULL,
  `platillo_id` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido_detalles`
--

INSERT INTO `pedido_detalles` (`id`, `pedido_id`, `platillo_id`, `nombre`, `precio`, `cantidad`) VALUES
(1, '00001', 1, 'Huevos Rancheros', 45.00, 3),
(2, '00001', 2, 'Chilaquiles Verdes', 40.00, 2),
(3, '00001', 3, 'Molletes', 30.00, 1),
(4, '00002', 1, 'Huevos Rancheros', 45.00, 2),
(5, '00002', 2, 'Chilaquiles Verdes', 40.00, 2),
(6, '00002', 3, 'Molletes', 30.00, 1),
(7, '00003', 1, 'Huevos Rancheros', 45.00, 2),
(8, '00003', 2, 'Chilaquiles Verdes', 40.00, 2),
(9, '00003', 3, 'Molletes', 30.00, 1),
(10, '00004', 1, 'Huevos Rancheros', 45.00, 2),
(11, '00004', 2, 'Chilaquiles Verdes', 40.00, 2),
(12, '00004', 3, 'Molletes', 30.00, 1),
(13, '00005', 1, 'Huevos Rancheros', 45.00, 2),
(14, '00005', 2, 'Chilaquiles Verdes', 40.00, 2),
(15, '00005', 3, 'Molletes', 30.00, 1),
(16, '00006', 1, 'Huevos Rancheros', 45.00, 1),
(17, '00006', 2, 'Chilaquiles Verdes', 40.00, 1),
(18, '00006', 3, 'Molletes', 30.00, 1),
(19, '00007', 1, 'Huevos Rancheros', 45.00, 2),
(20, '00007', 2, 'Chilaquiles Verdes', 40.00, 2),
(21, '00007', 3, 'Molletes', 30.00, 1),
(22, '00008', 1, 'Huevos Rancheros', 45.00, 1),
(23, '00008', 2, 'Chilaquiles Verdes', 40.00, 1),
(24, '00009', 1, 'Huevos Rancheros', 45.00, 1),
(25, '00009', 2, 'Chilaquiles Verdes', 40.00, 1),
(26, '00009', 3, 'Molletes', 30.00, 1),
(27, '00010', 1, 'Huevos Rancheros', 45.00, 1),
(28, '00010', 2, 'Chilaquiles Verdes', 40.00, 1),
(29, '00010', 3, 'Molletes', 30.00, 1),
(30, '00010', 5, 'Tacos Dorados', 45.00, 1),
(31, '00011', 1, 'Huevos Rancheros', 45.00, 1),
(32, '00012', 1, 'Huevos Rancheros', 45.00, 1),
(33, '00012', 2, 'Chilaquiles Verdes', 40.00, 1),
(34, '00012', 3, 'Molletes', 30.00, 1),
(35, '00012', 4, 'Enfrijoladas', 50.00, 1),
(36, '00013', 1, 'Huevos Rancheros', 45.00, 3),
(37, '00013', 3, 'Molletes', 30.00, 2),
(38, '00013', 5, 'Tacos Dorados', 45.00, 2),
(39, '00013', 8, 'Chiles Rellenos', 50.00, 1),
(40, '00015', 1, 'Huevos Rancheros', 45.00, 1),
(41, '00015', 2, 'Chilaquiles Verdes', 40.00, 1),
(42, '00015', 3, 'Molletes', 30.00, 1),
(43, '00015', 4, 'Enfrijoladas', 50.00, 1),
(44, '00016', 6, 'Pozole', 60.00, 2),
(45, '00017', 17, 'Café de Olla', 20.00, 1),
(46, '00017', 5, 'Tacos Dorados', 45.00, 1);

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
(14, 'Jugo de Naranja', 'Jugo fresco exprimido de naranjas maduras. (1 litro)', 'BEBIDA', 20, 'resources\\uploads\\1713843037280-juego-naranja.jpg', 'SÍ'),
(15, 'Jugo Verde', 'Mezcla de jugo de naranja, piña, espinaca, apio y pepino, conocido por sus propiedades saludables. (1 litro)', 'BEBIDA', 20, 'resources\\uploads\\1713843092944-juego-verde.jpg', 'SÍ'),
(16, 'Café Americano', 'Café negro preparado al estilo americano, con agua caliente.', 'BEBIDA', 15, 'resources\\uploads\\1713843223717-cafe-americano.jpg', 'SÍ'),
(17, 'Café de Olla', 'Café endulzado y aromatizado con piloncillo (azúcar de caña no refinada) y canela, tradicionalmente preparado en olla de barro.', 'BEBIDA', 20, 'resources\\uploads\\1713843250315-cafe-de-olla.jpg', 'SÍ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `name`, `role`, `pass`) VALUES
(3, 'admin', 'alfredo lopez', 'ADMINISTRADOR', '$2a$08$/16wZHNM/X4ZTWIs0pptp.vEwwpBDkC6MqIro5BWzczaIyiALEtTy'),
(7, 'ultimo', 'el ultimo usuario creado', 'ADMINISTRADOR', '$2a$08$AwluiRcmPSLjEY.Wlg0BU.jZ2XGm21.l94oLXlEGpEGNVG9DMeboW'),
(9, 'alfredo', 'alfredo lopez segovia', 'CHEF', '$2a$08$bO7DuOaAKSIAibqA4KqVieTn4cwCVNPOHuP64LHkDRNA6CSAS1C0C'),
(11, 'CGJJ', 'Chavez Garduño Jose de Jesus', 'CHEF', '$2a$08$TTxhn3iNMlg9PAqIxA1Ar.XjNK9DgKU06ytvDpwmDCAw4qbbA/19u'),
(12, 'carlos', 'mendoza carlos', 'CHEF', '$2a$08$m0IClwTvmoJIbbw86IzkpOM0IchcqReY8T2ZaUkIiYrNkAkX62EFW'),
(15, 'juanito', 'juan garcia', 'CHEF', '$2a$08$da.4UxxHB4LqXPGCtSDDkeWy0yd7typukOyR3rEeg9GwwMjtw5JRy'),
(18, 'carlos', 'carlos mendoza', 'ADMINISTRADOR', '$2a$08$mLoEcbsnF6i4yt8FxJyqQuyKE084WaYfcxtdgmxhMEGnRum9cWIiu'),
(19, 'chef', 'nuevo  chef', 'CHEF', '$2a$08$wpqLPKGFLt3psLXOasWTrOPxfLCvooyalIxNDTJzWooYOZAXMQ56u');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `platillos`
--
ALTER TABLE `platillos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  ADD CONSTRAINT `pedido_detalles_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
