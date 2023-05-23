-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-05-2023 a las 22:13:44
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
CREATE DATABASE IF NOT EXISTS `l267221_payroll` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `l267221_payroll`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `allowances`
--

DROP TABLE IF EXISTS `allowances`;
CREATE TABLE `allowances` (
  `id` int NOT NULL,
  `allowance` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `allowances`
--

INSERT INTO `allowances` (`id`, `allowance`, `description`) VALUES
(1, 'Aguinaldo', 'Aguinaldo'),
(2, 'Bono', 'Compensacion'),
(3, 'Educacion', 'capacitaciones'),
(5, 'Canasta basica', 'canasta basica empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `log_type` tinyint(1) NOT NULL COMMENT '1 = AM IN,2 = AM out, 3= PM IN, 4= PM out\r\n',
  `datetime_log` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `log_type`, `datetime_log`, `date_updated`) VALUES
(21, 10, 1, '2023-05-17 07:00:00', '2023-05-18 07:10:18'),
(27, 10, 1, '2023-05-18 05:00:00', '2023-05-19 08:17:06'),
(28, 10, 4, '2023-05-18 17:00:00', '2023-05-19 08:17:07'),
(29, 10, 1, '2023-05-17 05:00:00', '2023-05-19 08:18:11'),
(30, 12, 1, '2023-05-22 05:00:00', '2023-05-23 04:30:52'),
(31, 12, 2, '2023-05-22 19:00:00', '2023-05-23 04:43:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ausencia`
--

DROP TABLE IF EXISTS `ausencia`;
CREATE TABLE `ausencia` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `log_type` tinyint(1) NOT NULL COMMENT '1 = AM IN,2 = AM out, 3= PM IN, 4= PM out\r\n',
  `datetime_log` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ausencia`
--

INSERT INTO `ausencia` (`id`, `employee_id`, `log_type`, `datetime_log`, `date_updated`) VALUES
(0, 11, 3, '2023-05-21 20:31:00', '2023-05-23 04:31:56'),
(0, 12, 3, '2023-05-22 20:41:00', '2023-05-23 04:41:42'),
(0, 12, 4, '2023-05-25 20:41:00', '2023-05-23 04:41:53'),
(0, 12, 1, '2023-05-30 20:42:00', '2023-05-23 04:42:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deductions`
--

DROP TABLE IF EXISTS `deductions`;
CREATE TABLE `deductions` (
  `id` int NOT NULL,
  `deduction` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `deductions`
--

INSERT INTO `deductions` (`id`, `deduction`, `description`) VALUES
(1, 'ISSS', 'Seguro Social'),
(3, 'AFP', 'afp'),
(4, 'Renta', 'mh');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(4, 'Finanzas'),
(5, 'Logistica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int NOT NULL,
  `employee_no` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(20) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `department_id` int NOT NULL,
  `position_id` int NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`id`, `employee_no`, `firstname`, `middlename`, `lastname`, `department_id`, `position_id`, `salary`) VALUES
(11, '2023-5484', 'Arturo', '02345879-0', 'Mendoza', 5, 6, 500),
(12, '2023-478', 'Rogelia', '09876789-8', 'Rodriguez', 4, 5, 550),
(13, '2023-3373', 'Benito', '01254825-8', 'Salazar', 5, 6, 800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_allowances`
--

DROP TABLE IF EXISTS `employee_allowances`;
CREATE TABLE `employee_allowances` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `allowance_id` int NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `employee_allowances`
--

INSERT INTO `employee_allowances` (`id`, `employee_id`, `allowance_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(1, 9, 4, 1, 365, '0000-00-00', '2020-09-29 11:20:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_deductions`
--

DROP TABLE IF EXISTS `employee_deductions`;
CREATE TABLE `employee_deductions` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `deduction_id` int NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `employee_deductions`
--

INSERT INTO `employee_deductions` (`id`, `employee_id`, `deduction_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(5, 9, 1, 1, 10.95, '0000-00-00', '2023-05-18 07:00:53'),
(6, 9, 3, 1, 26.46, '0000-00-00', '2023-05-18 07:00:53'),
(7, 10, 1, 1, 10.72, '2023-05-18', '2023-05-19 20:55:25'),
(8, 11, 1, 1, 10.72, '0000-00-00', '2023-05-19 20:57:53'),
(9, 12, 3, 1, 0, '0000-00-00', '2023-05-19 22:25:06'),
(10, 12, 0, 0, 500, '0000-00-00', '2023-05-19 22:25:06'),
(11, 12, 1, 1, 10.72, '0000-00-00', '2023-05-23 13:22:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll`
--

DROP TABLE IF EXISTS `payroll`;
CREATE TABLE `payroll` (
  `id` int NOT NULL,
  `ref_no` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = monthly ,2 semi-monthly',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 =New,1 = computed',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `payroll`
--

INSERT INTO `payroll` (`id`, `ref_no`, `date_from`, `date_to`, `type`, `status`, `date_created`) VALUES
(11, '2023-2577', '2023-05-01', '2023-05-31', 1, 1, '2023-05-23 21:02:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll_items`
--

DROP TABLE IF EXISTS `payroll_items`;
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
(102, 11, 11, 0, 36.25, 15.00, 500, 0, '[]', 37.5, '[{\"did\":\"1\",\"amount\":\"10.72\"}]', 448.75, '2023-05-23 22:02:35'),
(103, 11, 12, 0, 39.88, 16.50, 550, 19.8325, '[]', 41.25, '[{\"did\":\"3\",\"amount\":\"0\"},{\"did\":\"1\",\"amount\":\"10.72\"}]', 473.79, '2023-05-23 22:02:35'),
(104, 11, 13, 0, 58.00, 24.00, 800, 42.27, '[]', 60, '[]', 675.73, '2023-05-23 22:02:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int NOT NULL,
  `department_id` int NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `position`
--

INSERT INTO `position` (`id`, `department_id`, `name`) VALUES
(5, 4, 'Contador'),
(6, 5, 'conductor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrador', '', '', 'admin', 'Recursos', 1),
(2, 0, 'Usuario', '', '', 'user', 'user', 2),
(3, 0, 'empleado', '', '', 'Empleado1', 'empleado', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `employee_allowances`
--
ALTER TABLE `employee_allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `employee_deductions`
--
ALTER TABLE `employee_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `department`
--
ALTER TABLE `department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `employee_allowances`
--
ALTER TABLE `employee_allowances`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `employee_deductions`
--
ALTER TABLE `employee_deductions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `payroll_items`
--
ALTER TABLE `payroll_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `position`
--
ALTER TABLE `position`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
