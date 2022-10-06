-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-10-2022 a las 22:02:06
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `catdog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `Id_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Categoria` varchar(30) NOT NULL,
  `Id_Mascota` int(11) NOT NULL,
  PRIMARY KEY (`Id_Categoria`),
  KEY `FK_Mascota` (`Id_Mascota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE IF NOT EXISTS `facturas` (
  `Id_Factura` int(11) NOT NULL AUTO_INCREMENT,
  `Estado_Pago` int(3) NOT NULL,
  `Fecha` date NOT NULL,
  `Id_Pro_Pedido` int(10) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_Factura`),
  KEY `Nombres` (`Nombres`),
  KEY `Apellidos` (`Apellidos`),
  KEY `Nombres_2` (`Nombres`),
  KEY `Apellidos_2` (`Apellidos`),
  KEY `factura_1` (`Id_Pro_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

DROP TABLE IF EXISTS `mascota`;
CREATE TABLE IF NOT EXISTS `mascota` (
  `Id_Mascota` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Mascota` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Mascota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `Id_Pedido` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Id_Producto` int(11) NOT NULL,
  `Cantidad` int(5) NOT NULL,
  `Valor_Total` decimal(50,0) NOT NULL,
  PRIMARY KEY (`Id_Pedido`),
  KEY `Id_Producto` (`Id_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `Id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `Telefono` int(15) NOT NULL,
  `Direccion` varchar(40) NOT NULL,
  `Ciudad` varchar(20) NOT NULL,
  `Departamento` varchar(30) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Id_tipousuario` int(12) NOT NULL,
  PRIMARY KEY (`Id_persona`),
  KEY `Id_tipousuario` (`Id_tipousuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto/pedido`
--

DROP TABLE IF EXISTS `producto/pedido`;
CREATE TABLE IF NOT EXISTS `producto/pedido` (
  `Id_Pro_Pedido` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Producto` int(20) NOT NULL,
  `Id_Pedido` int(20) NOT NULL,
  PRIMARY KEY (`Id_Pro_Pedido`),
  KEY `Id_Producto` (`Id_Producto`),
  KEY `Id_Pedido` (`Id_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `Id_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Producto` varchar(30) NOT NULL,
  `Precio_Producto` decimal(20,0) NOT NULL,
  `Id_Categoria` int(10) NOT NULL,
  PRIMARY KEY (`Id_Producto`),
  KEY `Id_Categoria` (`Id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Cliente` varchar(30) NOT NULL,
  `Administrador` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_1` FOREIGN KEY (`Id_Mascota`) REFERENCES `mascota` (`Id_Mascota`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `factura_1` FOREIGN KEY (`Id_Pro_Pedido`) REFERENCES `producto/pedido` (`Id_Pro_Pedido`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `Pedido_1` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_1` FOREIGN KEY (`Id_tipousuario`) REFERENCES `tipo_usuario` (`Id_Usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto/pedido`
--
ALTER TABLE `producto/pedido`
  ADD CONSTRAINT `producto/pedido_1` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto/pedido_2` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`Id_Pedido`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `Productos_1` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
