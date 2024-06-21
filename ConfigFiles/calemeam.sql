-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 21 2024 г., 09:28
-- Версия сервера: 10.1.37-MariaDB
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `calemeam`
--

-- --------------------------------------------------------

--
-- Структура таблицы `acl_group`
--

CREATE TABLE `acl_group` (
  `id` varchar(36) NOT NULL,
  `acl_group` varchar(30) DEFAULT NULL,
  `parent_group_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `acl_group`
--

INSERT INTO `acl_group` (`id`, `acl_group`, `parent_group_id`, `note`, `modified_time`, `modified_id`, `created_time`, `created_id`) VALUES
('CUSTOM_SYSTEM', 'Custom system', NULL, 'Customization/configuration shared by all other groups', '2024-06-19 05:50:50', '1000000', '2024-06-19 05:50:50', '1000000');

-- --------------------------------------------------------

--
-- Структура таблицы `asset`
--

CREATE TABLE `asset` (
  `id` varchar(36) NOT NULL,
  `asset_no` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `priority_id` varchar(36) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `template_id` varchar(36) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `location_id` varchar(36) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `weight_uom_id` varchar(36) DEFAULT NULL,
  `serial_no` varchar(30) DEFAULT NULL,
  `owner_user_id` varchar(36) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `original_cost` double DEFAULT NULL,
  `manufacturer_id` varchar(36) DEFAULT NULL,
  `vendor_id` varchar(36) DEFAULT NULL,
  `upload_id` varchar(36) DEFAULT NULL,
  `warranty_start_date` date DEFAULT NULL,
  `warranty_end_date` date DEFAULT NULL,
  `maint_labor_hours` double DEFAULT NULL,
  `maint_labor_cost` double DEFAULT NULL,
  `maint_material_cost` double DEFAULT NULL,
  `maint_cost` double DEFAULT NULL,
  `rollup_cost` tinyint(1) DEFAULT NULL,
  `costcode_id` varchar(36) DEFAULT NULL,
  `dept_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `depreciation_type_id` varchar(36) DEFAULT NULL,
  `depreciation_start` date DEFAULT NULL,
  `depreciation_time_id` varchar(36) DEFAULT NULL,
  `depreciation_rate` double DEFAULT NULL,
  `description` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `asset_comment`
--

CREATE TABLE `asset_comment` (
  `id` varchar(36) NOT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `asset_contract`
--

CREATE TABLE `asset_contract` (
  `id` varchar(36) NOT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `contract_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `asset_depreciation`
--

CREATE TABLE `asset_depreciation` (
  `id` varchar(36) NOT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `depreciation_rate` double DEFAULT NULL,
  `start_value` double DEFAULT NULL,
  `end_value` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `asset_downtime`
--

CREATE TABLE `asset_downtime` (
  `id` varchar(36) NOT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `downtime_type_id` varchar(36) DEFAULT NULL,
  `downtime_cause_id` varchar(36) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `shift_id` varchar(36) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `reported_by_id` varchar(36) DEFAULT NULL,
  `reported_time` datetime DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `asset_meter`
--

CREATE TABLE `asset_meter` (
  `id` varchar(36) NOT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `meter_no` varchar(30) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `reading_uom_id` varchar(36) DEFAULT NULL,
  `reading` double DEFAULT NULL,
  `is_rollover` tinyint(1) DEFAULT NULL,
  `time_taken` datetime DEFAULT NULL,
  `rollup_type_id` varchar(36) DEFAULT NULL,
  `rollover_reading` double DEFAULT NULL,
  `rollover_count` int(11) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `asset_part`
--

CREATE TABLE `asset_part` (
  `id` varchar(36) NOT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `uom_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `asset_seq`
--

CREATE TABLE `asset_seq` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `asset_seq`
--

INSERT INTO `asset_seq` (`id`) VALUES
(0);

-- --------------------------------------------------------

--
-- Структура таблицы `asset_service_log`
--

CREATE TABLE `asset_service_log` (
  `id` varchar(36) NOT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `from_status_id` varchar(36) DEFAULT NULL,
  `to_status_id` varchar(36) DEFAULT NULL,
  `from_location_id` varchar(36) DEFAULT NULL,
  `to_location_id` varchar(36) DEFAULT NULL,
  `from_parent_id` varchar(36) DEFAULT NULL,
  `to_parent_id` varchar(36) DEFAULT NULL,
  `from_owner_id` varchar(36) DEFAULT NULL,
  `to_owner_id` varchar(36) DEFAULT NULL,
  `changed_by_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `asset_type`
--

CREATE TABLE `asset_type` (
  `id` varchar(36) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `budget`
--

CREATE TABLE `budget` (
  `id` varchar(36) NOT NULL,
  `title_id` varchar(36) DEFAULT NULL,
  `budget` varchar(30) DEFAULT NULL,
  `state_id` varchar(36) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `budgeted` double DEFAULT NULL,
  `app` double DEFAULT NULL,
  `accounting` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `budget_status_log`
--

CREATE TABLE `budget_status_log` (
  `id` varchar(36) NOT NULL,
  `budget_id` varchar(36) DEFAULT NULL,
  `to_state_id` varchar(36) DEFAULT NULL,
  `from_state_id` varchar(36) DEFAULT NULL,
  `changed_by_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `budget_title`
--

CREATE TABLE `budget_title` (
  `id` varchar(36) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `contact`
--

CREATE TABLE `contact` (
  `id` varchar(36) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `job_title` varchar(30) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `phone_work` varchar(24) DEFAULT NULL,
  `phone_home` varchar(16) DEFAULT NULL,
  `phone_mobile` varchar(16) DEFAULT NULL,
  `email_work` varchar(50) DEFAULT NULL,
  `email_other` varchar(50) DEFAULT NULL,
  `im1_type_id` varchar(36) DEFAULT NULL,
  `im1_id` varchar(30) DEFAULT NULL,
  `im2_type_id` varchar(36) DEFAULT NULL,
  `im2_id` varchar(30) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `street1` varchar(50) DEFAULT NULL,
  `street2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(16) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `contract`
--

CREATE TABLE `contract` (
  `id` varchar(36) NOT NULL,
  `contract` varchar(30) DEFAULT NULL,
  `vendor_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `owner_user_id` varchar(36) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `contract_contact`
--

CREATE TABLE `contract_contact` (
  `id` varchar(36) NOT NULL,
  `contract_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `contract_doc`
--

CREATE TABLE `contract_doc` (
  `id` varchar(36) NOT NULL,
  `contract_id` varchar(36) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `doc_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `costcode`
--

CREATE TABLE `costcode` (
  `id` varchar(36) NOT NULL,
  `costcode` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `dept_id` varchar(36) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `rollup_cost` tinyint(1) DEFAULT NULL,
  `cost_type_id` varchar(36) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `craft`
--

CREATE TABLE `craft` (
  `id` varchar(36) NOT NULL,
  `craft` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `ot_factor` double DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `dash_wo_orig_day`
--

CREATE TABLE `dash_wo_orig_day` (
  `id` varchar(36) NOT NULL,
  `counts` varchar(1000) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `dash_wo_orig_md`
--

CREATE TABLE `dash_wo_orig_md` (
  `id` varchar(36) NOT NULL,
  `counts` varchar(1000) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `dept`
--

CREATE TABLE `dept` (
  `id` varchar(36) NOT NULL,
  `dept` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `manager_id` varchar(36) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `document`
--

CREATE TABLE `document` (
  `id` varchar(36) NOT NULL,
  `document` varchar(30) DEFAULT NULL,
  `content` text,
  `type_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `doc_attachment`
--

CREATE TABLE `doc_attachment` (
  `id` varchar(36) NOT NULL,
  `doc_id` varchar(36) DEFAULT NULL,
  `upload_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `doc_type`
--

CREATE TABLE `doc_type` (
  `id` varchar(36) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `doc_upload`
--

CREATE TABLE `doc_upload` (
  `id` varchar(36) NOT NULL,
  `file_upload` varchar(250) DEFAULT NULL,
  `access_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `downtime_unit_cost`
--

CREATE TABLE `downtime_unit_cost` (
  `id` varchar(36) NOT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `downtime_type_id` varchar(36) DEFAULT NULL,
  `hourly_rate` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `inspection`
--

CREATE TABLE `inspection` (
  `id` varchar(36) NOT NULL,
  `inspection` varchar(50) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `inspect_contact_id` varchar(36) DEFAULT NULL,
  `inspect_user_id` varchar(36) DEFAULT NULL,
  `owner_user_id` varchar(36) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ins_citation`
--

CREATE TABLE `ins_citation` (
  `id` varchar(36) NOT NULL,
  `citation` varchar(50) DEFAULT NULL,
  `inspection_id` varchar(36) DEFAULT NULL,
  `severity_id` varchar(36) DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `inventory`
--

CREATE TABLE `inventory` (
  `id` varchar(36) NOT NULL,
  `in_no` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `stock_type_id` varchar(36) DEFAULT NULL,
  `valuation_type_id` varchar(36) DEFAULT NULL,
  `abc_id` varchar(36) DEFAULT NULL,
  `abc_time` datetime DEFAULT NULL,
  `uom_id` varchar(36) DEFAULT NULL,
  `avg_unit_cost` double DEFAULT NULL,
  `rent_uom_id` varchar(36) DEFAULT NULL,
  `rent_rate` double DEFAULT NULL,
  `qty_in_stock` double DEFAULT NULL,
  `qty_on_order` double DEFAULT NULL,
  `qty_reserved` double DEFAULT NULL,
  `qty_to_order` double DEFAULT NULL,
  `order_gen_id` varchar(36) DEFAULT NULL,
  `order_type_id` varchar(36) DEFAULT NULL,
  `min_level` double DEFAULT NULL,
  `max_level` double DEFAULT NULL,
  `reorder_point` double DEFAULT NULL,
  `reorder_qty` double DEFAULT NULL,
  `owner_user_id` varchar(36) DEFAULT NULL,
  `notification_id` varchar(36) DEFAULT NULL,
  `costcode_id` varchar(36) DEFAULT NULL,
  `description` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `in_audit`
--

CREATE TABLE `in_audit` (
  `id` varchar(36) NOT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `audit_user_id` varchar(36) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `in_comment`
--

CREATE TABLE `in_comment` (
  `id` varchar(36) NOT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `in_doc`
--

CREATE TABLE `in_doc` (
  `id` varchar(36) NOT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `in_location`
--

CREATE TABLE `in_location` (
  `id` varchar(36) NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `in_reserved`
--

CREATE TABLE `in_reserved` (
  `id` varchar(36) NOT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `in_seq`
--

CREATE TABLE `in_seq` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `in_seq`
--

INSERT INTO `in_seq` (`id`) VALUES
(0);

-- --------------------------------------------------------

--
-- Структура таблицы `in_stock`
--

CREATE TABLE `in_stock` (
  `id` varchar(36) NOT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `location_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `in_tran`
--

CREATE TABLE `in_tran` (
  `id` varchar(36) NOT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `location_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `costcode_id` varchar(36) DEFAULT NULL,
  `checkout_type_id` varchar(36) DEFAULT NULL,
  `checkout_to_id` varchar(36) DEFAULT NULL,
  `receive_type_id` varchar(36) DEFAULT NULL,
  `receive_from_id` varchar(36) DEFAULT NULL,
  `qty_available` double DEFAULT NULL,
  `qty_orig` double DEFAULT NULL,
  `orig_loc_id` varchar(36) DEFAULT NULL,
  `checkout_tran_id` varchar(36) DEFAULT NULL,
  `rent_duration` double DEFAULT NULL,
  `rent_rate` double DEFAULT NULL,
  `tran_total` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `tran_time` datetime DEFAULT NULL,
  `tran_user_id` varchar(36) DEFAULT NULL,
  `store_user_id` varchar(36) DEFAULT NULL,
  `voided` tinyint(1) DEFAULT NULL,
  `authorized_by_id` varchar(36) DEFAULT NULL,
  `void_by_id` varchar(36) DEFAULT NULL,
  `void_time` datetime DEFAULT NULL,
  `void_note` varchar(76) DEFAULT NULL,
  `new_tran_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `in_tran_worksheet`
--

CREATE TABLE `in_tran_worksheet` (
  `id` varchar(36) NOT NULL,
  `in_tran_id` varchar(36) DEFAULT NULL,
  `src_tran_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `in_type`
--

CREATE TABLE `in_type` (
  `id` varchar(36) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `in_vendor`
--

CREATE TABLE `in_vendor` (
  `id` varchar(36) NOT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `vendor_id` varchar(36) DEFAULT NULL,
  `vendor_part_no` varchar(30) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT NULL,
  `uom_id` varchar(36) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `lead_time_days` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` varchar(36) NOT NULL,
  `manufacturer` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `meter_transaction`
--

CREATE TABLE `meter_transaction` (
  `id` varchar(36) NOT NULL,
  `meter_id` varchar(36) DEFAULT NULL,
  `read_by_id` varchar(36) DEFAULT NULL,
  `time_taken` datetime DEFAULT NULL,
  `reading` double DEFAULT NULL,
  `is_rollover` tinyint(1) DEFAULT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `meter_type`
--

CREATE TABLE `meter_type` (
  `id` varchar(36) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm`
--

CREATE TABLE `pm` (
  `id` varchar(36) NOT NULL,
  `pm_no` varchar(30) DEFAULT NULL,
  `description` text,
  `status_id` varchar(36) DEFAULT NULL,
  `asset_type_id` varchar(36) DEFAULT NULL,
  `rcm_action_id` varchar(36) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `priority_id` varchar(36) DEFAULT NULL,
  `origin_id` varchar(36) DEFAULT NULL,
  `origin_user_id` varchar(36) DEFAULT NULL,
  `assigned_to_id` varchar(36) DEFAULT NULL,
  `assigned_team_id` varchar(36) DEFAULT NULL,
  `duration_hours` double DEFAULT NULL,
  `release_type_id` varchar(36) DEFAULT NULL,
  `schedule_type_id` varchar(36) DEFAULT NULL,
  `release_schedule` varchar(1024) DEFAULT NULL,
  `labor_hours` double DEFAULT NULL,
  `downtime_hours` double DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_asset`
--

CREATE TABLE `pm_asset` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `last_released` date DEFAULT NULL,
  `last_closed` date DEFAULT NULL,
  `next_due_date` date DEFAULT NULL,
  `release_count` int(11) DEFAULT NULL,
  `costcode_id` varchar(36) DEFAULT NULL,
  `dept_id` varchar(36) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_audit`
--

CREATE TABLE `pm_audit` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `audit_user_id` varchar(36) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_comment`
--

CREATE TABLE `pm_comment` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_dependency`
--

CREATE TABLE `pm_dependency` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `child_pm_id` varchar(36) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `scope_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_doc`
--

CREATE TABLE `pm_doc` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `doc_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_downtime`
--

CREATE TABLE `pm_downtime` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_labor`
--

CREATE TABLE `pm_labor` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `craft_id` varchar(36) DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `crew_size` int(11) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_meter`
--

CREATE TABLE `pm_meter` (
  `id` varchar(36) NOT NULL,
  `pm_asset_id` varchar(36) DEFAULT NULL,
  `meter_id` varchar(36) DEFAULT NULL,
  `release_by_meter` tinyint(1) DEFAULT NULL,
  `reading_released` double DEFAULT NULL,
  `rollover_count` int(11) DEFAULT NULL,
  `reading_interval` double DEFAULT NULL,
  `copy_to_wo` tinyint(1) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_part`
--

CREATE TABLE `pm_part` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_safety`
--

CREATE TABLE `pm_safety` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `description` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_season`
--

CREATE TABLE `pm_season` (
  `id` varchar(36) NOT NULL,
  `pm_asset_id` varchar(36) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_step`
--

CREATE TABLE `pm_step` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `description` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pm_tool`
--

CREATE TABLE `pm_tool` (
  `id` varchar(36) NOT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `po`
--

CREATE TABLE `po` (
  `id` varchar(36) NOT NULL,
  `po_no` varchar(30) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `state_id` varchar(36) DEFAULT NULL,
  `buyer_id` varchar(36) DEFAULT NULL,
  `buyer_name` varchar(50) DEFAULT NULL,
  `buyer_phone` varchar(24) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `next_user_id` varchar(36) DEFAULT NULL,
  `next_note` varchar(76) DEFAULT NULL,
  `vendor_id` varchar(36) DEFAULT NULL,
  `vendor_addr` varchar(512) DEFAULT NULL,
  `vendor_contact_id` varchar(36) DEFAULT NULL,
  `vendor_contact_phone` varchar(24) DEFAULT NULL,
  `payment_term_id` varchar(36) DEFAULT NULL,
  `shipping_type_id` varchar(36) DEFAULT NULL,
  `shipping_term_id` varchar(36) DEFAULT NULL,
  `shipping_addr_id` varchar(36) DEFAULT NULL,
  `billing_addr_id` varchar(36) DEFAULT NULL,
  `po_item_total` double DEFAULT NULL,
  `tax_rate_total` double DEFAULT NULL,
  `tax_charge` double DEFAULT NULL,
  `total_charge` double DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `po_address`
--

CREATE TABLE `po_address` (
  `id` varchar(36) NOT NULL,
  `address` varchar(512) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `po_address`
--

INSERT INTO `po_address` (`id`, `address`, `type_id`, `note`, `modified_time`, `modified_id`, `created_time`, `created_id`) VALUES
('po_billing_addr', 'TBO Corporation\n1101 Broadway Blvd.\nAustin, TX 78701\nAttn: Billing', 'pat_billing', NULL, '2024-06-19 05:50:50', '1000000', '2024-06-19 05:50:50', '1000000'),
('po_shipping_addr', 'TBO Corporation\n1101 Broadway Blvd.\nAustin, TX 78701\nAttn: Shipping', 'pat_shipping', NULL, '2024-06-19 05:50:50', '1000000', '2024-06-19 05:50:50', '1000000');

-- --------------------------------------------------------

--
-- Структура таблицы `po_item`
--

CREATE TABLE `po_item` (
  `id` varchar(36) NOT NULL,
  `line_no` int(11) DEFAULT NULL,
  `po_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `vendor_part_no` varchar(50) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `qty_received` double DEFAULT NULL,
  `uom_id` varchar(36) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `line_cost` double DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `po_seq`
--

CREATE TABLE `po_seq` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `po_seq`
--

INSERT INTO `po_seq` (`id`) VALUES
(0);

-- --------------------------------------------------------

--
-- Структура таблицы `po_status_log`
--

CREATE TABLE `po_status_log` (
  `id` varchar(36) NOT NULL,
  `po_id` varchar(36) DEFAULT NULL,
  `from_status_id` varchar(36) DEFAULT NULL,
  `to_status_id` varchar(36) DEFAULT NULL,
  `from_state_id` varchar(36) DEFAULT NULL,
  `to_state_id` varchar(36) DEFAULT NULL,
  `changed_by_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `project`
--

CREATE TABLE `project` (
  `id` varchar(36) NOT NULL,
  `project_no` varchar(30) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `priority_id` varchar(36) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `owner_user_id` varchar(36) DEFAULT NULL,
  `sched_start_time` datetime DEFAULT NULL,
  `sched_end_time` datetime DEFAULT NULL,
  `actual_start_time` datetime DEFAULT NULL,
  `actual_end_time` datetime DEFAULT NULL,
  `sched_hours` double DEFAULT NULL,
  `actual_hours` double DEFAULT NULL,
  `percent_done` double DEFAULT NULL,
  `dept_id` varchar(36) DEFAULT NULL,
  `costcode_id` varchar(36) DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `project_type`
--

CREATE TABLE `project_type` (
  `id` varchar(36) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rcm_action`
--

CREATE TABLE `rcm_action` (
  `id` varchar(36) NOT NULL,
  `failure_id` varchar(36) DEFAULT NULL,
  `cause` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `cause_type_id` varchar(36) DEFAULT NULL,
  `description` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rcm_action_part`
--

CREATE TABLE `rcm_action_part` (
  `id` varchar(36) NOT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rcm_consequence`
--

CREATE TABLE `rcm_consequence` (
  `id` varchar(36) NOT NULL,
  `failure_id` varchar(36) DEFAULT NULL,
  `consequence` varchar(50) DEFAULT NULL,
  `type_id` varchar(36) DEFAULT NULL,
  `pm_policy_id` varchar(36) DEFAULT NULL,
  `description` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rcm_failure`
--

CREATE TABLE `rcm_failure` (
  `id` varchar(36) NOT NULL,
  `failure` varchar(50) DEFAULT NULL,
  `is_evident` tinyint(1) DEFAULT NULL,
  `function_id` varchar(36) DEFAULT NULL,
  `template_id` varchar(36) DEFAULT NULL,
  `description` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rcm_function`
--

CREATE TABLE `rcm_function` (
  `id` varchar(36) NOT NULL,
  `fn_name` varchar(50) DEFAULT NULL,
  `template_id` varchar(36) DEFAULT NULL,
  `description` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rcm_template`
--

CREATE TABLE `rcm_template` (
  `id` varchar(36) NOT NULL,
  `template` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `recycle_bin`
--

CREATE TABLE `recycle_bin` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `table_name` varchar(30) DEFAULT NULL,
  `rec_id` varchar(36) DEFAULT NULL,
  `value_deleted` text,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `requisition`
--

CREATE TABLE `requisition` (
  `id` varchar(36) NOT NULL,
  `req_no` varchar(30) DEFAULT NULL,
  `description` text,
  `priority_id` varchar(36) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `req_on_po_id` varchar(36) DEFAULT NULL,
  `source_id` varchar(36) DEFAULT NULL,
  `state_id` varchar(36) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `shipping_type_id` varchar(36) DEFAULT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `request_user_id` varchar(36) DEFAULT NULL,
  `request_time` datetime DEFAULT NULL,
  `req_total` double DEFAULT NULL,
  `costcode_id` varchar(36) DEFAULT NULL,
  `dept_id` varchar(36) DEFAULT NULL,
  `next_user_id` varchar(36) DEFAULT NULL,
  `next_note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `req_item`
--

CREATE TABLE `req_item` (
  `id` varchar(36) NOT NULL,
  `req_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `vendor_id` varchar(36) DEFAULT NULL,
  `vendor_part_no` varchar(50) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `uom_id` varchar(36) DEFAULT NULL,
  `line_cost` double DEFAULT NULL,
  `po_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `req_seq`
--

CREATE TABLE `req_seq` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `req_seq`
--

INSERT INTO `req_seq` (`id`) VALUES
(0);

-- --------------------------------------------------------

--
-- Структура таблицы `req_status_log`
--

CREATE TABLE `req_status_log` (
  `id` varchar(36) NOT NULL,
  `req_id` varchar(36) DEFAULT NULL,
  `from_status_id` varchar(36) DEFAULT NULL,
  `to_status_id` varchar(36) DEFAULT NULL,
  `from_state_id` varchar(36) DEFAULT NULL,
  `to_state_id` varchar(36) DEFAULT NULL,
  `changed_by_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `scheduler_job`
--

CREATE TABLE `scheduler_job` (
  `id` varchar(36) NOT NULL,
  `task_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `start_seq` int(11) DEFAULT '0',
  `release_time` varchar(512) DEFAULT NULL,
  `release_day` varchar(1024) DEFAULT NULL,
  `time_due` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `scheduler_job_log`
--

CREATE TABLE `scheduler_job_log` (
  `id` varchar(36) NOT NULL,
  `job_id` varchar(36) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `time_taken` double DEFAULT NULL,
  `results` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `scheduler_task`
--

CREATE TABLE `scheduler_task` (
  `id` varchar(36) NOT NULL,
  `task` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `class_name` varchar(76) DEFAULT NULL,
  `class_path` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `scheduler_task`
--

INSERT INTO `scheduler_task` (`id`, `task`, `note`, `class_name`, `class_path`, `modified_time`, `modified_id`, `created_time`, `created_id`) VALUES
('wo_gen_001', 'WO Generation', 'Process to generate workorders in the background', 'CalemWoGenTask', 'server/modules/workorder/proc', '2024-06-19 05:50:50', '1000000', '2024-06-19 05:50:50', '1000000');

-- --------------------------------------------------------

--
-- Структура таблицы `sched_shutdown`
--

CREATE TABLE `sched_shutdown` (
  `id` varchar(36) NOT NULL,
  `shutdown` varchar(30) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sched_user`
--

CREATE TABLE `sched_user` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `sched_date` date DEFAULT NULL,
  `shift_id` varchar(36) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `sched_hours` double DEFAULT NULL,
  `hours_sched` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `semaphore`
--

CREATE TABLE `semaphore` (
  `id` varchar(36) NOT NULL,
  `expire_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tax_code`
--

CREATE TABLE `tax_code` (
  `id` varchar(36) NOT NULL,
  `tax_code` varchar(30) DEFAULT NULL,
  `tax_rate_total` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tax_rate`
--

CREATE TABLE `tax_rate` (
  `id` varchar(36) NOT NULL,
  `tax_code_id` varchar(36) DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `team`
--

CREATE TABLE `team` (
  `id` varchar(36) NOT NULL,
  `team` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `training`
--

CREATE TABLE `training` (
  `id` varchar(36) NOT NULL,
  `training` varchar(50) DEFAULT NULL,
  `course_id` varchar(36) DEFAULT NULL,
  `instructor_user_id` varchar(36) DEFAULT NULL,
  `instructor_contact_id` varchar(36) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `certificate_id` varchar(36) DEFAULT NULL,
  `description` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `training_certificate`
--

CREATE TABLE `training_certificate` (
  `id` varchar(36) NOT NULL,
  `certificate` varchar(30) DEFAULT NULL,
  `description` text,
  `days_valid` int(11) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `training_course`
--

CREATE TABLE `training_course` (
  `id` varchar(36) NOT NULL,
  `course` varchar(30) DEFAULT NULL,
  `description` text,
  `type_id` varchar(36) DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `training_course_type`
--

CREATE TABLE `training_course_type` (
  `id` varchar(36) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `training_user`
--

CREATE TABLE `training_user` (
  `id` varchar(36) NOT NULL,
  `training_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `uom`
--

CREATE TABLE `uom` (
  `id` varchar(36) NOT NULL,
  `uom` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `uom_map`
--

CREATE TABLE `uom_map` (
  `id` varchar(36) NOT NULL,
  `uom_src_id` varchar(36) DEFAULT NULL,
  `uom_dst_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `user_type_id` varchar(36) DEFAULT NULL,
  `emp_no` varchar(30) DEFAULT NULL,
  `contractor_id` varchar(36) DEFAULT NULL,
  `job_role_id` varchar(36) DEFAULT NULL,
  `login_allowed` tinyint(1) DEFAULT '1',
  `full_name` varchar(50) DEFAULT NULL,
  `job_title` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `acl_group_id` varchar(36) DEFAULT NULL,
  `admin_type_id` varchar(36) DEFAULT 'search_admin_none',
  `team_id` varchar(36) DEFAULT NULL,
  `supervisor_id` varchar(36) DEFAULT NULL,
  `dept_id` varchar(36) DEFAULT NULL,
  `costcode_id` varchar(36) DEFAULT NULL,
  `req_approval_id` varchar(36) DEFAULT NULL,
  `po_approval_id` varchar(36) DEFAULT NULL,
  `craft_id` varchar(36) DEFAULT NULL,
  `phone_work` varchar(24) DEFAULT NULL,
  `phone_home` varchar(16) DEFAULT NULL,
  `phone_mobile` varchar(16) DEFAULT NULL,
  `email_work` varchar(50) DEFAULT NULL,
  `email_other` varchar(50) DEFAULT NULL,
  `im1_type_id` varchar(36) DEFAULT NULL,
  `im1_id` varchar(30) DEFAULT NULL,
  `im2_type_id` varchar(36) DEFAULT NULL,
  `im2_id` varchar(30) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `street1` varchar(50) DEFAULT NULL,
  `street2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(16) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `status_id`, `password`, `user_type_id`, `emp_no`, `contractor_id`, `job_role_id`, `login_allowed`, `full_name`, `job_title`, `note`, `acl_group_id`, `admin_type_id`, `team_id`, `supervisor_id`, `dept_id`, `costcode_id`, `req_approval_id`, `po_approval_id`, `craft_id`, `phone_work`, `phone_home`, `phone_mobile`, `email_work`, `email_other`, `im1_type_id`, `im1_id`, `im2_type_id`, `im2_id`, `fax`, `company`, `street1`, `street2`, `city`, `state`, `zip`, `country`, `modified_time`, `modified_id`, `created_time`, `created_id`) VALUES
('1000000', 'admin', NULL, 'dc3565645d8002becb5fd7977aeef3e1', NULL, NULL, NULL, NULL, 1, 'Administrator', NULL, NULL, 'CUSTOM_SYSTEM', 'search_admin_none', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-19 05:50:50', '1000000', '2024-06-19 05:50:50', '1000000');

-- --------------------------------------------------------

--
-- Структура таблицы `vendor`
--

CREATE TABLE `vendor` (
  `id` varchar(36) NOT NULL,
  `vendor` varchar(30) DEFAULT NULL,
  `tax_code_id` varchar(36) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `owner_user_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `vendor_contact`
--

CREATE TABLE `vendor_contact` (
  `id` varchar(36) NOT NULL,
  `vendor_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `version`
--

CREATE TABLE `version` (
  `id` varchar(36) NOT NULL,
  `vid` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `props` varchar(2000) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `version`
--

INSERT INTO `version` (`id`, `vid`, `note`, `props`, `modified_time`, `modified_id`, `created_time`, `created_id`) VALUES
('VERSION_ID', 'r2-1-0d', 'Calem Community Edition r2.1d', NULL, '2024-06-19 05:50:50', '1000000', '2024-06-19 05:50:50', '1000000');

-- --------------------------------------------------------

--
-- Структура таблицы `version_upgrade_log`
--

CREATE TABLE `version_upgrade_log` (
  `id` varchar(36) NOT NULL,
  `vid` varchar(30) DEFAULT NULL,
  `ver_note` varchar(76) DEFAULT NULL,
  `prev_vid` varchar(30) DEFAULT NULL,
  `prev_ver_note` varchar(76) DEFAULT NULL,
  `prev_props` varchar(2000) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `upgrade_note` varchar(76) DEFAULT NULL,
  `results` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `workorder`
--

CREATE TABLE `workorder` (
  `id` varchar(36) NOT NULL,
  `wo_no` varchar(30) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `description` text,
  `asset_id` varchar(36) DEFAULT NULL,
  `pm_id` varchar(36) DEFAULT NULL,
  `asset_note` varchar(76) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `priority_id` varchar(36) DEFAULT NULL,
  `resolution_id` varchar(36) DEFAULT NULL,
  `duplicate_wo_id` varchar(36) DEFAULT NULL,
  `rcm_action_id` varchar(36) DEFAULT NULL,
  `parent_wo_id` varchar(36) DEFAULT NULL,
  `origin_id` varchar(36) DEFAULT NULL,
  `rework_wo_id` varchar(36) DEFAULT NULL,
  `orig_contact_id` varchar(36) DEFAULT NULL,
  `orig_user_id` varchar(36) DEFAULT NULL,
  `orig_time` datetime DEFAULT NULL,
  `assigned_team_id` varchar(36) DEFAULT NULL,
  `assigned_to_id` varchar(36) DEFAULT NULL,
  `assigned_by_id` varchar(36) DEFAULT NULL,
  `assigned_time` datetime DEFAULT NULL,
  `time_needed` datetime DEFAULT NULL,
  `planned_start_time` datetime DEFAULT NULL,
  `sched_start_time` datetime DEFAULT NULL,
  `sched_start_shift_id` varchar(36) DEFAULT NULL,
  `actual_start_time` datetime DEFAULT NULL,
  `actual_start_shift_id` varchar(36) DEFAULT NULL,
  `planned_finish_time` datetime DEFAULT NULL,
  `sched_finish_time` datetime DEFAULT NULL,
  `sched_finish_shift_id` varchar(36) DEFAULT NULL,
  `actual_finish_time` datetime DEFAULT NULL,
  `actual_finish_shift_id` varchar(36) DEFAULT NULL,
  `costcode_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `dept_id` varchar(36) DEFAULT NULL,
  `planned_labor_hours` double DEFAULT NULL,
  `sched_labor_hours` double DEFAULT NULL,
  `actual_labor_hours` double DEFAULT NULL,
  `labor_cost` double DEFAULT NULL,
  `material_cost` double DEFAULT NULL,
  `total_cost` double DEFAULT NULL,
  `planned_downtime_hours` double DEFAULT NULL,
  `actual_downtime_hours` double DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_attachment`
--

CREATE TABLE `wo_attachment` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `file_url` varchar(1000) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_comment`
--

CREATE TABLE `wo_comment` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `comment` text,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_doc`
--

CREATE TABLE `wo_doc` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `doc_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_generation`
--

CREATE TABLE `wo_generation` (
  `id` varchar(36) NOT NULL,
  `status_id` varchar(36) DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `wo_count` int(11) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_labor`
--

CREATE TABLE `wo_labor` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `time_type_id` varchar(36) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `shift_id` varchar(36) DEFAULT NULL,
  `craft_id` varchar(36) DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `ot_hours` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `ot_factor` double DEFAULT NULL,
  `line_cost` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_meter`
--

CREATE TABLE `wo_meter` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `meter_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_part`
--

CREATE TABLE `wo_part` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `qty_used` double DEFAULT NULL,
  `line_cost` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_planned_downtime`
--

CREATE TABLE `wo_planned_downtime` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_planned_labor`
--

CREATE TABLE `wo_planned_labor` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `craft_id` varchar(36) DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `crew_size` int(11) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_planned_part`
--

CREATE TABLE `wo_planned_part` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_planned_tool`
--

CREATE TABLE `wo_planned_tool` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_safety`
--

CREATE TABLE `wo_safety` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `description` text,
  `followed` tinyint(1) DEFAULT NULL,
  `followed_by_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_sched_labor`
--

CREATE TABLE `wo_sched_labor` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `shift_id` varchar(36) DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_semaphore`
--

CREATE TABLE `wo_semaphore` (
  `id` varchar(36) NOT NULL,
  `expiration` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wo_semaphore`
--

INSERT INTO `wo_semaphore` (`id`, `expiration`, `modified_time`, `modified_id`, `created_time`, `created_id`) VALUES
('wo_generation', NULL, '2024-06-19 05:50:50', '1000000', '2024-06-19 05:50:50', '1000000');

-- --------------------------------------------------------

--
-- Структура таблицы `wo_seq`
--

CREATE TABLE `wo_seq` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wo_seq`
--

INSERT INTO `wo_seq` (`id`) VALUES
(0);

-- --------------------------------------------------------

--
-- Структура таблицы `wo_status_log`
--

CREATE TABLE `wo_status_log` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `to_status_id` varchar(36) DEFAULT NULL,
  `from_status_id` varchar(36) DEFAULT NULL,
  `changed_by_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_step`
--

CREATE TABLE `wo_step` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `description` text,
  `completed` tinyint(1) DEFAULT NULL,
  `completed_by_id` varchar(36) DEFAULT NULL,
  `completed_time` datetime DEFAULT NULL,
  `shift_id` varchar(36) DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wo_tool`
--

CREATE TABLE `wo_tool` (
  `id` varchar(36) NOT NULL,
  `wo_id` varchar(36) DEFAULT NULL,
  `in_id` varchar(36) DEFAULT NULL,
  `qty_checkout` double DEFAULT NULL,
  `qty_return` double DEFAULT NULL,
  `line_cost` double DEFAULT NULL,
  `note` varchar(76) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_id` varchar(36) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `acl_group`
--
ALTER TABLE `acl_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_acl_group_acl_group` (`acl_group`);

--
-- Индексы таблицы `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_asset_asset_no` (`asset_no`),
  ADD KEY `idx_asset_vendor` (`vendor_id`);

--
-- Индексы таблицы `asset_comment`
--
ALTER TABLE `asset_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_asset_comment_asset_id` (`asset_id`),
  ADD KEY `idx_asset_comment_modified_time` (`modified_time`);

--
-- Индексы таблицы `asset_contract`
--
ALTER TABLE `asset_contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_asset_contract_cr` (`contract_id`),
  ADD KEY `idx_asset_asset` (`asset_id`);

--
-- Индексы таблицы `asset_depreciation`
--
ALTER TABLE `asset_depreciation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_asset_depreciation_start` (`start_date`),
  ADD KEY `idx_asset_depreciation` (`asset_id`);

--
-- Индексы таблицы `asset_downtime`
--
ALTER TABLE `asset_downtime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_asset_downtime_start` (`start_time`),
  ADD KEY `idx_asset_downtime` (`asset_id`);

--
-- Индексы таблицы `asset_meter`
--
ALTER TABLE `asset_meter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_asset_meter_meter_no` (`meter_no`),
  ADD KEY `idx_asset_meter` (`asset_id`);

--
-- Индексы таблицы `asset_part`
--
ALTER TABLE `asset_part`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_asset_in` (`in_id`),
  ADD KEY `idx_asset_asset` (`asset_id`);

--
-- Индексы таблицы `asset_service_log`
--
ALTER TABLE `asset_service_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_asset_status_log` (`asset_id`),
  ADD KEY `idx_asset_status_time` (`created_time`);

--
-- Индексы таблицы `asset_type`
--
ALTER TABLE `asset_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_asset_type` (`type`);

--
-- Индексы таблицы `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_budget` (`budget`),
  ADD KEY `idx_budget_start_date` (`start_date`);

--
-- Индексы таблицы `budget_status_log`
--
ALTER TABLE `budget_status_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_budget_status_log` (`budget_id`),
  ADD KEY `idx_budget_status_log_time` (`created_time`);

--
-- Индексы таблицы `budget_title`
--
ALTER TABLE `budget_title`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_costcode_costcode` (`title`),
  ADD KEY `idx_budget_title_start_date` (`start_date`);

--
-- Индексы таблицы `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_contact_full_name` (`full_name`);

--
-- Индексы таблицы `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_contract` (`contract`),
  ADD KEY `idx_contract_vendor` (`vendor_id`);

--
-- Индексы таблицы `contract_contact`
--
ALTER TABLE `contract_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contract_contact_cr` (`contract_id`),
  ADD KEY `idx_contract_contact_c` (`contact_id`);

--
-- Индексы таблицы `contract_doc`
--
ALTER TABLE `contract_doc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contract_doc_cr` (`contract_id`),
  ADD KEY `idx_contract_doc` (`doc_id`);

--
-- Индексы таблицы `costcode`
--
ALTER TABLE `costcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_costcode_costcode` (`costcode`);

--
-- Индексы таблицы `craft`
--
ALTER TABLE `craft`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_craft_craft` (`craft`);

--
-- Индексы таблицы `dash_wo_orig_day`
--
ALTER TABLE `dash_wo_orig_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dash_wo_orig_day` (`modified_time`);

--
-- Индексы таблицы `dash_wo_orig_md`
--
ALTER TABLE `dash_wo_orig_md`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dash_wo_orig_md` (`modified_time`);

--
-- Индексы таблицы `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_dept_dept` (`dept`);

--
-- Индексы таблицы `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_document` (`document`);

--
-- Индексы таблицы `doc_attachment`
--
ALTER TABLE `doc_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_doc_attachment_doc` (`doc_id`),
  ADD KEY `idx_doc_attachment_attach` (`upload_id`);

--
-- Индексы таблицы `doc_type`
--
ALTER TABLE `doc_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_in_type` (`type`);

--
-- Индексы таблицы `doc_upload`
--
ALTER TABLE `doc_upload`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_doc_upload` (`file_upload`);

--
-- Индексы таблицы `downtime_unit_cost`
--
ALTER TABLE `downtime_unit_cost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_downtime_unit_cost` (`asset_id`);

--
-- Индексы таблицы `inspection`
--
ALTER TABLE `inspection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_inspection` (`inspection`),
  ADD KEY `idx_inspection_start` (`start_time`);

--
-- Индексы таблицы `ins_citation`
--
ALTER TABLE `ins_citation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_citation_citation` (`citation`),
  ADD KEY `idx_citation_inspection` (`inspection_id`);

--
-- Индексы таблицы `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_inventory` (`in_no`),
  ADD KEY `idx_inventory_costcode` (`costcode_id`);

--
-- Индексы таблицы `in_audit`
--
ALTER TABLE `in_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_in_audit` (`in_id`);

--
-- Индексы таблицы `in_comment`
--
ALTER TABLE `in_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_in_comment_in_id` (`in_id`),
  ADD KEY `idx_in_comment_modified_time` (`modified_time`);

--
-- Индексы таблицы `in_doc`
--
ALTER TABLE `in_doc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_in_doc` (`in_id`);

--
-- Индексы таблицы `in_location`
--
ALTER TABLE `in_location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_in_location` (`location`),
  ADD KEY `idx_in_location_parent` (`parent_id`);

--
-- Индексы таблицы `in_reserved`
--
ALTER TABLE `in_reserved`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_in_reserved` (`in_id`),
  ADD KEY `idx_in_reserved_wo_id` (`wo_id`);

--
-- Индексы таблицы `in_stock`
--
ALTER TABLE `in_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_in_stock` (`in_id`),
  ADD KEY `idx_in_in_location` (`location_id`);

--
-- Индексы таблицы `in_tran`
--
ALTER TABLE `in_tran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_in_tran_in` (`in_id`,`type_id`,`voided`),
  ADD KEY `idx_in_tran_checkout_to_id` (`checkout_to_id`,`checkout_type_id`,`voided`),
  ADD KEY `idx_in_tran_receive_from` (`receive_from_id`,`receive_type_id`,`voided`),
  ADD KEY `idx_in_tran_tran_time` (`tran_time`);

--
-- Индексы таблицы `in_tran_worksheet`
--
ALTER TABLE `in_tran_worksheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_in_tran_worksheet` (`in_tran_id`);

--
-- Индексы таблицы `in_type`
--
ALTER TABLE `in_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_in_type` (`type`);

--
-- Индексы таблицы `in_vendor`
--
ALTER TABLE `in_vendor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_in_vendor` (`in_id`,`vendor_id`),
  ADD KEY `idx_in_vendor_vendor` (`vendor_id`);

--
-- Индексы таблицы `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_manufacturer` (`manufacturer`);

--
-- Индексы таблицы `meter_transaction`
--
ALTER TABLE `meter_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_meter_transaction_time` (`time_taken`),
  ADD KEY `idx_meter_transaction` (`meter_id`),
  ADD KEY `idx_meter_transaction_wo` (`wo_id`);

--
-- Индексы таблицы `meter_type`
--
ALTER TABLE `meter_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_meter_type` (`type`);

--
-- Индексы таблицы `pm`
--
ALTER TABLE `pm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_pm_pm_no` (`pm_no`);

--
-- Индексы таблицы `pm_asset`
--
ALTER TABLE `pm_asset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_asset_pm` (`pm_id`),
  ADD KEY `idx_pm_asset_asset` (`asset_id`);

--
-- Индексы таблицы `pm_audit`
--
ALTER TABLE `pm_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_audit` (`pm_id`);

--
-- Индексы таблицы `pm_comment`
--
ALTER TABLE `pm_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_comment_pm_id` (`pm_id`),
  ADD KEY `idx_pm_comment_modified_time` (`modified_time`);

--
-- Индексы таблицы `pm_dependency`
--
ALTER TABLE `pm_dependency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_dependency_pm` (`pm_id`),
  ADD KEY `idx_pm_dependency_child` (`child_pm_id`);

--
-- Индексы таблицы `pm_doc`
--
ALTER TABLE `pm_doc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_doc` (`pm_id`);

--
-- Индексы таблицы `pm_downtime`
--
ALTER TABLE `pm_downtime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_downtime_pm` (`pm_id`);

--
-- Индексы таблицы `pm_labor`
--
ALTER TABLE `pm_labor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_labor_pm` (`pm_id`),
  ADD KEY `idx_pm_labor_craft` (`craft_id`);

--
-- Индексы таблицы `pm_meter`
--
ALTER TABLE `pm_meter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_meter_asset` (`pm_asset_id`),
  ADD KEY `idx_pm_meter_meter` (`meter_id`);

--
-- Индексы таблицы `pm_part`
--
ALTER TABLE `pm_part`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_part_pm` (`pm_id`),
  ADD KEY `idx_pm_part_in` (`in_id`);

--
-- Индексы таблицы `pm_safety`
--
ALTER TABLE `pm_safety`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_safety` (`pm_id`);

--
-- Индексы таблицы `pm_season`
--
ALTER TABLE `pm_season`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_season` (`pm_asset_id`);

--
-- Индексы таблицы `pm_step`
--
ALTER TABLE `pm_step`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_step` (`pm_id`);

--
-- Индексы таблицы `pm_tool`
--
ALTER TABLE `pm_tool`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pm_tool_pm` (`pm_id`),
  ADD KEY `idx_pm_tool_in` (`in_id`);

--
-- Индексы таблицы `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_po` (`po_no`);

--
-- Индексы таблицы `po_address`
--
ALTER TABLE `po_address`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `po_item`
--
ALTER TABLE `po_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_po_items_po` (`po_id`),
  ADD KEY `idx_po_items_in` (`in_id`),
  ADD KEY `idx_po_items_line_no` (`line_no`);

--
-- Индексы таблицы `po_status_log`
--
ALTER TABLE `po_status_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_po_status_log` (`po_id`);

--
-- Индексы таблицы `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_project_project_no` (`project_no`),
  ADD KEY `idx_project_start_time` (`sched_start_time`),
  ADD KEY `idx_project_parent_id` (`parent_id`);

--
-- Индексы таблицы `project_type`
--
ALTER TABLE `project_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_project_type` (`type`);

--
-- Индексы таблицы `rcm_action`
--
ALTER TABLE `rcm_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rcm_action` (`failure_id`);

--
-- Индексы таблицы `rcm_action_part`
--
ALTER TABLE `rcm_action_part`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rcm_action_part` (`action_id`);

--
-- Индексы таблицы `rcm_consequence`
--
ALTER TABLE `rcm_consequence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rcm_consequence` (`failure_id`);

--
-- Индексы таблицы `rcm_failure`
--
ALTER TABLE `rcm_failure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_rcm_failure` (`failure`);

--
-- Индексы таблицы `rcm_function`
--
ALTER TABLE `rcm_function`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_rcm_function` (`fn_name`);

--
-- Индексы таблицы `rcm_template`
--
ALTER TABLE `rcm_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_rcm_template` (`template`);

--
-- Индексы таблицы `recycle_bin`
--
ALTER TABLE `recycle_bin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_recycle_bin_table_name` (`table_name`),
  ADD KEY `idx_recycle_bin_rec_id` (`rec_id`);

--
-- Индексы таблицы `requisition`
--
ALTER TABLE `requisition`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_requisition` (`req_no`),
  ADD KEY `uidx_req_due_date` (`due_date`);

--
-- Индексы таблицы `req_item`
--
ALTER TABLE `req_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_requisition` (`req_id`,`in_id`),
  ADD KEY `idx_req_item_in` (`in_id`),
  ADD KEY `idx_req_item_vendor` (`vendor_id`),
  ADD KEY `idx_req_item_po` (`po_id`);

--
-- Индексы таблицы `req_status_log`
--
ALTER TABLE `req_status_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_req_status_log` (`req_id`),
  ADD KEY `idx_req_status_time` (`created_time`);

--
-- Индексы таблицы `scheduler_job`
--
ALTER TABLE `scheduler_job`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `scheduler_job_log`
--
ALTER TABLE `scheduler_job_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_scheduler_job_log` (`start_time`);

--
-- Индексы таблицы `scheduler_task`
--
ALTER TABLE `scheduler_task`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_scheduler_task` (`task`);

--
-- Индексы таблицы `sched_shutdown`
--
ALTER TABLE `sched_shutdown`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_sched_shutdown` (`shutdown`),
  ADD KEY `idx_sched_shutdown_start` (`start_time`);

--
-- Индексы таблицы `sched_user`
--
ALTER TABLE `sched_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_sched_user` (`user_id`,`sched_date`,`shift_id`),
  ADD KEY `idx_sched_user_date` (`sched_date`);

--
-- Индексы таблицы `semaphore`
--
ALTER TABLE `semaphore`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tax_code`
--
ALTER TABLE `tax_code`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_tax_code` (`tax_code`);

--
-- Индексы таблицы `tax_rate`
--
ALTER TABLE `tax_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tax_code` (`tax_code_id`);

--
-- Индексы таблицы `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_team_team` (`team`);

--
-- Индексы таблицы `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_training` (`training`),
  ADD KEY `idx_training_course` (`course_id`),
  ADD KEY `idx_training_start` (`start_time`);

--
-- Индексы таблицы `training_certificate`
--
ALTER TABLE `training_certificate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_certificate` (`certificate`);

--
-- Индексы таблицы `training_course`
--
ALTER TABLE `training_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_course` (`course`);

--
-- Индексы таблицы `training_course_type`
--
ALTER TABLE `training_course_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_course_type` (`type`);

--
-- Индексы таблицы `training_user`
--
ALTER TABLE `training_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_training_user_user` (`user_id`),
  ADD KEY `idx_training_user_training` (`training_id`);

--
-- Индексы таблицы `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_uom` (`uom`);

--
-- Индексы таблицы `uom_map`
--
ALTER TABLE `uom_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uom_src` (`uom_src_id`),
  ADD KEY `idx_uom_dst` (`uom_dst_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_users_username` (`username`);

--
-- Индексы таблицы `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_vendor` (`vendor`);

--
-- Индексы таблицы `vendor_contact`
--
ALTER TABLE `vendor_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vendor_contact_v` (`vendor_id`),
  ADD KEY `idx_vendor_contact_c` (`contact_id`);

--
-- Индексы таблицы `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `version_upgrade_log`
--
ALTER TABLE `version_upgrade_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `workorder`
--
ALTER TABLE `workorder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_workorder_wo_no` (`wo_no`),
  ADD KEY `idx_wo_sched_completion_time` (`sched_finish_time`),
  ADD KEY `idx_wo_asset` (`asset_id`),
  ADD KEY `idx_wo_pm` (`pm_id`),
  ADD KEY `idx_wo_costcode` (`costcode_id`),
  ADD KEY `idx_wo_orig_user` (`orig_contact_id`),
  ADD KEY `idx_wo_assigned_to` (`assigned_to_id`),
  ADD KEY `idx_wo_assigned_team` (`assigned_team_id`);

--
-- Индексы таблицы `wo_attachment`
--
ALTER TABLE `wo_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_attachment_wo_id` (`wo_id`);

--
-- Индексы таблицы `wo_comment`
--
ALTER TABLE `wo_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_comment_wo_id` (`wo_id`),
  ADD KEY `idx_wo_comment_modified_time` (`modified_time`);

--
-- Индексы таблицы `wo_doc`
--
ALTER TABLE `wo_doc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_doc_wo_id` (`wo_id`);

--
-- Индексы таблицы `wo_generation`
--
ALTER TABLE `wo_generation`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wo_labor`
--
ALTER TABLE `wo_labor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_labor_wo_id` (`wo_id`),
  ADD KEY `idx_wo_labor_user_id` (`user_id`),
  ADD KEY `idx_wo_labor_start_time` (`start_time`);

--
-- Индексы таблицы `wo_meter`
--
ALTER TABLE `wo_meter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_meter_wo_id` (`wo_id`),
  ADD KEY `idx_wo_meter_meter_id` (`meter_id`);

--
-- Индексы таблицы `wo_part`
--
ALTER TABLE `wo_part`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_wo_part` (`wo_id`,`in_id`),
  ADD KEY `idx_wo_part_in_id` (`in_id`);

--
-- Индексы таблицы `wo_planned_downtime`
--
ALTER TABLE `wo_planned_downtime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_downtime_wo` (`wo_id`);

--
-- Индексы таблицы `wo_planned_labor`
--
ALTER TABLE `wo_planned_labor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_planned_labor_wo` (`wo_id`),
  ADD KEY `idx_wo_planned_labor_craft` (`craft_id`);

--
-- Индексы таблицы `wo_planned_part`
--
ALTER TABLE `wo_planned_part`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_planned_part_wo_id` (`wo_id`),
  ADD KEY `idx_wo_planned_part_in` (`in_id`);

--
-- Индексы таблицы `wo_planned_tool`
--
ALTER TABLE `wo_planned_tool`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_planned_tool_wo_id` (`wo_id`),
  ADD KEY `idx_wo_planned_tool_in` (`in_id`);

--
-- Индексы таблицы `wo_safety`
--
ALTER TABLE `wo_safety`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_safety_wo_id` (`wo_id`);

--
-- Индексы таблицы `wo_sched_labor`
--
ALTER TABLE `wo_sched_labor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sched_labor_wo_id` (`wo_id`),
  ADD KEY `idx_sched_labor_user_id` (`user_id`),
  ADD KEY `idx_sched_labor_start` (`start_time`);

--
-- Индексы таблицы `wo_semaphore`
--
ALTER TABLE `wo_semaphore`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wo_status_log`
--
ALTER TABLE `wo_status_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_status_log_wo` (`wo_id`),
  ADD KEY `idx_wo_status_log_time` (`created_time`);

--
-- Индексы таблицы `wo_step`
--
ALTER TABLE `wo_step`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wo_step_wo_id` (`wo_id`);

--
-- Индексы таблицы `wo_tool`
--
ALTER TABLE `wo_tool`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_wo_tool` (`wo_id`,`in_id`),
  ADD KEY `idx_wo_tool_in_id` (`in_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
