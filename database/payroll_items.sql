-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-05-2023 a las 01:42:18
-- Versión del servidor: 8.0.33
-- Versión de PHP: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `l267221_payroll`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll_items`
--

CREATE TABLE `payroll_items` (
  `id` int NOT NULL,
  `payroll_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `present` int NOT NULL,
  `absent` decimal(10,2) NOT NULL,
  `late` decimal(10,2) NOT NULL,
  `salary` double NOT NULL,
  `allowance_amount` double NOT NULL,
  `allowances` text NOT NULL,
  `deduction_amount` double NOT NULL,
  `deductions` text NOT NULL,
  `net` decimal(10,2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `payroll_items`
--

INSERT INTO `payroll_items` (`id`, `payroll_id`, `employee_id`, `present`, `absent`, `late`, `salary`, `allowance_amount`, `allowances`, `deduction_amount`, `deductions`, `net`, `date_created`) VALUES
(105, 11, 11, 0, 36.25, 15.00, 500, 0, '[]', 37.5, '[{\"did\":\"1\",\"amount\":\"10.72\"}]', 448.75, '2023-05-24 00:13:01'),
(106, 11, 12, 0, 39.88, 16.50, 550, 19.8325, '[]', 41.25, '[{\"did\":\"3\",\"amount\":\"0\"},{\"did\":\"1\",\"amount\":\"10.72\"}]', 473.79, '2023-05-24 00:13:01'),
(107, 11, 13, 0, 58.00, 24.00, 800, 42.27, '[]', 60, '[]', 675.73, '2023-05-24 00:13:01'),
(108, 12, 11, 0, 36.25, 15.00, 500, 0, '[]', 37.5, '[{\"did\":\"1\",\"amount\":\"10.72\"}]', 448.75, '2023-05-24 00:14:16'),
(109, 12, 12, 0, 39.88, 16.50, 550, 19.8325, '[]', 41.25, '[{\"did\":\"3\",\"amount\":\"0\"},{\"did\":\"1\",\"amount\":\"10.72\"}]', 473.79, '2023-05-24 00:14:16'),
(110, 12, 13, 0, 58.00, 24.00, 800, 42.27, '[]', 60, '[]', 675.73, '2023-05-24 00:14:16'),
(111, 13, 11, 0, 36.25, 15.00, 500, 0, '[]', 37.5, '[{\"did\":\"1\",\"amount\":\"10.72\"}]', 448.75, '2023-05-24 00:46:13'),
(112, 13, 12, 0, 39.88, 16.50, 550, 19.8325, '[]', 41.25, '[{\"did\":\"3\",\"amount\":\"0\"},{\"did\":\"1\",\"amount\":\"10.72\"}]', 473.79, '2023-05-24 00:46:13'),
(113, 13, 13, 0, 58.00, 24.00, 800, 42.27, '[]', 60, '[]', 675.73, '2023-05-24 00:46:13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `payroll_items`
--
ALTER TABLE `payroll_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
