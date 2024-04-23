-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2024 at 07:24 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sec`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'admins'),
(1, 'client'),
(2, 'company');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add company', 7, 'add_company'),
(26, 'Can change company', 7, 'change_company'),
(27, 'Can delete company', 7, 'delete_company'),
(28, 'Can view company', 7, 'view_company'),
(29, 'Can add service', 8, 'add_service'),
(30, 'Can change service', 8, 'change_service'),
(31, 'Can delete service', 8, 'delete_service'),
(32, 'Can view service', 8, 'view_service'),
(33, 'Can add request service', 9, 'add_requestservice'),
(34, 'Can change request service', 9, 'change_requestservice'),
(35, 'Can delete request service', 9, 'delete_requestservice'),
(36, 'Can view request service', 9, 'view_requestservice');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$Z0PwdKHzrCg21tZJr8mCiu$qL4RQsjFq1hYjz3TPXRRWwqYVPF/WXvxu/9EPGYXGGs=', '2024-04-21 19:21:45.121859', 1, 'admin', '', '', '', 1, 1, '2024-04-21 19:21:01.103002'),
(2, 'pbkdf2_sha256$720000$joEedIVz5M1ogn5TrAATo3$3TAkfeEOU16wbZTNlpCbbIgKSNsel9krOiENsKxRXts=', '2024-04-23 04:12:43.026805', 0, 'company1', '', '', '', 0, 1, '2024-04-21 19:22:27.000000'),
(3, 'pbkdf2_sha256$720000$g044apwy6Zwa3NQfuf90sH$C2hi+mJflA9n87Qy5s3GjkiyyopranmN04LoVUUQBKo=', '2024-04-23 05:09:36.469222', 0, 'client1', '', '', '', 0, 1, '2024-04-21 19:22:53.000000'),
(5, 'pbkdf2_sha256$720000$RizqiktHzJGL1dlJhNaVjN$9/tXG9ezb3rnTqGsN1GEse3KAI+xkvWI6BT746nTa7s=', '2024-04-22 13:12:57.426673', 0, 'company2', '', '', '', 0, 1, '2024-04-21 20:59:56.000000'),
(6, 'pbkdf2_sha256$720000$zkaYt22m29Q5ZfBcWxIHVJ$UhMw6FuADn2yLHP+NTSaJI6rGuLkpEflXM6HRAQ9SZw=', '2024-04-23 05:17:11.614707', 0, 'admins', '', '', '', 0, 1, '2024-04-21 21:41:01.000000'),
(7, 'pbkdf2_sha256$720000$BG9VjVThlrbAUUTAhA4y9z$tX9TwjjV8il04SGKdbO8KcWf3b+tk8mL4Yk16VtJCdY=', '2024-04-22 10:59:50.489296', 0, 'client2', '', '', 'hjk@gmail.com', 0, 1, '2024-04-21 21:54:38.198187');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 2),
(2, 3, 1),
(4, 5, 2),
(5, 6, 3),
(6, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-04-21 19:21:55.912906', '1', 'client', 1, '[{\"added\": {}}]', 3, 1),
(2, '2024-04-21 19:22:00.182599', '2', 'company', 1, '[{\"added\": {}}]', 3, 1),
(3, '2024-04-21 19:22:28.467007', '2', 'company1', 1, '[{\"added\": {}}]', 4, 1),
(4, '2024-04-21 19:22:35.712709', '2', 'company1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(5, '2024-04-21 19:22:54.450541', '3', 'client1', 1, '[{\"added\": {}}]', 4, 1),
(6, '2024-04-21 19:23:00.604150', '3', 'client1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(7, '2024-04-21 19:30:27.946834', '3', 'Financial Security', 3, '', 8, 1),
(8, '2024-04-21 19:30:28.008536', '2', 'Personal security', 3, '', 8, 1),
(9, '2024-04-21 19:30:28.058167', '1', 'Escote Security', 3, '', 8, 1),
(10, '2024-04-21 19:43:00.259949', '1', 'Johari Rotana Hotel', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 9, 1),
(11, '2024-04-21 20:59:57.733326', '5', 'company2', 1, '[{\"added\": {}}]', 4, 1),
(12, '2024-04-21 21:00:07.350927', '5', 'company2', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(13, '2024-04-21 21:40:41.405064', '3', 'admins', 1, '[{\"added\": {}}]', 3, 1),
(14, '2024-04-21 21:41:02.071850', '6', 'admins', 1, '[{\"added\": {}}]', 4, 1),
(15, '2024-04-21 21:41:51.990592', '6', 'admins', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'mainapp', 'company'),
(9, 'mainapp', 'requestservice'),
(8, 'mainapp', 'service'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-21 19:20:15.479526'),
(2, 'auth', '0001_initial', '2024-04-21 19:20:22.054774'),
(3, 'admin', '0001_initial', '2024-04-21 19:20:23.683480'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-21 19:20:23.777203'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-21 19:20:23.962925'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-21 19:20:24.502092'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-21 19:20:25.088626'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-21 19:20:25.222471'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-21 19:20:25.266631'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-21 19:20:25.700743'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-21 19:20:25.732032'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-21 19:20:25.778683'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-21 19:20:25.872614'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-21 19:20:25.980041'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-21 19:20:26.314367'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-21 19:20:26.503156'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-21 19:20:27.043154'),
(18, 'mainapp', '0001_initial', '2024-04-21 19:20:30.876773'),
(19, 'mainapp', '0002_requestservice_document', '2024-04-21 19:20:30.967716'),
(20, 'mainapp', '0003_alter_requestservice_document', '2024-04-21 19:20:30.998967'),
(21, 'mainapp', '0004_alter_requestservice_email', '2024-04-21 19:20:31.178523'),
(22, 'mainapp', '0005_requestservice_feedback_requestservice_status', '2024-04-21 19:20:31.318028'),
(23, 'mainapp', '0006_alter_requestservice_feedback', '2024-04-21 19:20:32.451785'),
(24, 'mainapp', '0007_company_user_requestservice_user_service_user', '2024-04-21 19:20:35.707300'),
(25, 'sessions', '0001_initial', '2024-04-21 19:20:36.224296');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bxvkbe71gbaooiz05r99rpcqc15oob4m', '.eJxVjMsOwiAQRf-FtSHg8Cgu3fcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mLOIvT75YwP7jtgO7YbrPMc1uXKcldkQftcpyJn9fD_Tuo2Ou3dkX5kjw4sIMyjjgUS4jBsMuQQHvUFHSiTFQsgxkgICIAMpZgihLvD_LVOMY:1rz7WN:EBB7xCjZgveOfj3Ys43JVC6NtH-iaaDmYA9UsdOirEM', '2024-05-07 04:12:43.286838');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_company`
--

CREATE TABLE `mainapp_company` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `location` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_company`
--

INSERT INTO `mainapp_company` (`id`, `company_name`, `phone_number`, `location`, `address`, `user_id`) VALUES
(2, 'Gwanzoo enterprises', '+255748234556', 'Kimara', 'P.O.Box 705', 5),
(4, 'Woliten enterprisess', '+255623425558', 'kinondoni', 'P.O.Box 8788', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_company_security_service`
--

CREATE TABLE `mainapp_company_security_service` (
  `id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `service_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_company_security_service`
--

INSERT INTO `mainapp_company_security_service` (`id`, `company_id`, `service_id`) VALUES
(4, 2, 7),
(6, 4, 4),
(7, 4, 5),
(8, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_requestservice`
--

CREATE TABLE `mainapp_requestservice` (
  `id` bigint(20) NOT NULL,
  `business_name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` datetime(6) NOT NULL,
  `country` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `Service_id` bigint(20) NOT NULL,
  `document` varchar(100) NOT NULL,
  `feedback` longtext DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_requestservice`
--

INSERT INTO `mainapp_requestservice` (`id`, `business_name`, `address`, `phone_number`, `email`, `date`, `country`, `message`, `company_id`, `Service_id`, `document`, `feedback`, `status`, `user_id`) VALUES
(7, 'New Hotel', 'P.O.Box 705', '+255748234556', 'new@gmail.com', '2024-04-22 00:00:00.000000', 'tanzania', 'heloooooooooooooooooooooooooooo', 2, 7, 'document/Application_letter.pdf', '', 'rejected', 7),
(8, 'Johari Rotana Hotel', 'P.O.Box 7066', '+255748234556', 'h@gmail.com', '2024-04-23 00:00:00.000000', 'tanzania', 'Helloooo', 4, 5, 'document/Barua_ya_Utambulisho_Mjumbe.pdf', NULL, 'pending', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_service`
--

CREATE TABLE `mainapp_service` (
  `id` bigint(20) NOT NULL,
  `service_name` varchar(200) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_service`
--

INSERT INTO `mainapp_service` (`id`, `service_name`, `user_id`) VALUES
(4, 'Escote Securityy', 2),
(5, 'Personal security', 2),
(6, 'Financial Security', 2),
(7, 'company_2 service', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `mainapp_company`
--
ALTER TABLE `mainapp_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_company_user_id_9afa3040_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_company_security_service`
--
ALTER TABLE `mainapp_company_security_service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mainapp_company_security_company_id_service_id_fa2032e7_uniq` (`company_id`,`service_id`),
  ADD KEY `mainapp_company_secu_service_id_9c487a74_fk_mainapp_s` (`service_id`);

--
-- Indexes for table `mainapp_requestservice`
--
ALTER TABLE `mainapp_requestservice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mainapp_requestservice_email_aefdf56d_uniq` (`email`),
  ADD KEY `mainapp_requestservice_company_id_f299ec31_fk_mainapp_company_id` (`company_id`),
  ADD KEY `mainapp_requestservice_Service_id_99572790_fk_mainapp_service_id` (`Service_id`),
  ADD KEY `mainapp_requestservice_user_id_f8765c25_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_service`
--
ALTER TABLE `mainapp_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_service_user_id_8e367069_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mainapp_company`
--
ALTER TABLE `mainapp_company`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mainapp_company_security_service`
--
ALTER TABLE `mainapp_company_security_service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mainapp_requestservice`
--
ALTER TABLE `mainapp_requestservice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mainapp_service`
--
ALTER TABLE `mainapp_service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_company`
--
ALTER TABLE `mainapp_company`
  ADD CONSTRAINT `mainapp_company_user_id_9afa3040_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_company_security_service`
--
ALTER TABLE `mainapp_company_security_service`
  ADD CONSTRAINT `mainapp_company_secu_company_id_84bcda80_fk_mainapp_c` FOREIGN KEY (`company_id`) REFERENCES `mainapp_company` (`id`),
  ADD CONSTRAINT `mainapp_company_secu_service_id_9c487a74_fk_mainapp_s` FOREIGN KEY (`service_id`) REFERENCES `mainapp_service` (`id`);

--
-- Constraints for table `mainapp_requestservice`
--
ALTER TABLE `mainapp_requestservice`
  ADD CONSTRAINT `mainapp_requestservice_Service_id_99572790_fk_mainapp_service_id` FOREIGN KEY (`Service_id`) REFERENCES `mainapp_service` (`id`),
  ADD CONSTRAINT `mainapp_requestservice_company_id_f299ec31_fk_mainapp_company_id` FOREIGN KEY (`company_id`) REFERENCES `mainapp_company` (`id`),
  ADD CONSTRAINT `mainapp_requestservice_user_id_f8765c25_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_service`
--
ALTER TABLE `mainapp_service`
  ADD CONSTRAINT `mainapp_service_user_id_8e367069_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
