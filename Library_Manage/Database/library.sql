-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2022 at 02:28 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add content type', 3, 'add_contenttype'),
(10, 'Can change content type', 3, 'change_contenttype'),
(11, 'Can delete content type', 3, 'delete_contenttype'),
(12, 'Can view content type', 3, 'view_contenttype'),
(13, 'Can add book', 4, 'add_book'),
(14, 'Can change book', 4, 'change_book'),
(15, 'Can delete book', 4, 'delete_book'),
(16, 'Can view book', 4, 'view_book'),
(17, 'Can add user', 5, 'add_customuser'),
(18, 'Can change user', 5, 'change_customuser'),
(19, 'Can delete user', 5, 'delete_customuser'),
(20, 'Can view user', 5, 'view_customuser'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` bigint(20) NOT NULL,
  `bname` varchar(100) NOT NULL,
  `bauthor` varchar(100) NOT NULL,
  `bsubject` varchar(100) NOT NULL,
  `bprice` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `bname`, `bauthor`, `bsubject`, `bprice`) VALUES
(5, 'Making India Awesome', 'Chetan Bhagat', 'knowledge books', '500'),
(6, 'The Intelligent Investor', 'Benjamin Graham', 'finance books', '600');

-- --------------------------------------------------------

--
-- Table structure for table `books_customuser`
--

CREATE TABLE `books_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `age` int(10) UNSIGNED DEFAULT NULL CHECK (`age` >= 0),
  `email` varchar(254) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books_customuser`
--

INSERT INTO `books_customuser` (`id`, `password`, `last_login`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `full_name`, `age`, `email`, `is_superuser`) VALUES
(1, 'pbkdf2_sha256$320000$DFZ5O5QUqVO5K2erAw5Yac$jtmRUPDpXVAYQ4hz5VtOU4A0Af9gtJwCvOiJgc1rY8o=', '2022-09-18 11:52:13.841192', '', '', 0, 1, '2022-09-18 05:49:15.149190', 'tirth', NULL, 'tirthmakadia23@gmail.com', 1),
(2, 'pbkdf2_sha256$320000$GHpOntytutVheSLWgDPNO6$xVbIjrGLGUwypOG5UuP4BGh0777BQwlCfa/v274yfyw=', '2022-09-18 09:54:28.904040', '', '', 0, 1, '2022-09-18 08:09:11.922295', 'tirth', NULL, 'tirth@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `books_customuser_groups`
--

CREATE TABLE `books_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `books_customuser_user_permissions`
--

CREATE TABLE `books_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(4, 'books', 'book'),
(5, 'books', 'customuser'),
(3, 'contenttypes', 'contenttype'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-09-17 13:00:11.672402'),
(2, 'books', '0001_initial', '2022-09-17 13:00:11.699329'),
(3, 'contenttypes', '0002_remove_content_type_name', '2022-09-18 05:47:36.487370'),
(4, 'auth', '0001_initial', '2022-09-18 05:47:36.715831'),
(5, 'auth', '0002_alter_permission_name_max_length', '2022-09-18 05:47:36.764423'),
(6, 'auth', '0003_alter_user_email_max_length', '2022-09-18 05:47:36.771353'),
(7, 'auth', '0004_alter_user_username_opts', '2022-09-18 05:47:36.777152'),
(8, 'auth', '0005_alter_user_last_login_null', '2022-09-18 05:47:36.783871'),
(9, 'auth', '0006_require_contenttypes_0002', '2022-09-18 05:47:36.788043'),
(10, 'auth', '0007_alter_validators_add_error_messages', '2022-09-18 05:47:36.794562'),
(11, 'auth', '0008_alter_user_username_max_length', '2022-09-18 05:47:36.803002'),
(12, 'auth', '0009_alter_user_last_name_max_length', '2022-09-18 05:47:36.810520'),
(13, 'auth', '0010_alter_group_name_max_length', '2022-09-18 05:47:36.827449'),
(14, 'auth', '0011_update_proxy_permissions', '2022-09-18 05:47:36.834341'),
(15, 'auth', '0012_alter_user_first_name_max_length', '2022-09-18 05:47:36.840363'),
(16, 'books', '0002_customuser', '2022-09-18 05:47:37.149061'),
(17, 'books', '0003_auto_20220915_1337', '2022-09-18 05:47:37.198008'),
(18, 'books', '0004_auto_20220915_1348', '2022-09-18 05:47:37.241030'),
(19, 'books', '0005_auto_20220915_1410', '2022-09-18 05:47:37.284599'),
(20, 'books', '0006_auto_20220915_1428', '2022-09-18 05:47:37.322814'),
(21, 'sessions', '0001_initial', '2022-09-18 06:07:36.426458');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books_customuser`
--
ALTER TABLE `books_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `books_customuser_groups`
--
ALTER TABLE `books_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `books_customuser_groups_customuser_id_group_id_cb470f44_uniq` (`customuser_id`,`group_id`),
  ADD KEY `books_customuser_groups_group_id_34ec5ee8_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `books_customuser_user_permissions`
--
ALTER TABLE `books_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `books_customuser_user_pe_customuser_id_permission_f4b967de_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `books_customuser_use_permission_id_23a87421_fk_auth_perm` (`permission_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `books_customuser`
--
ALTER TABLE `books_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `books_customuser_groups`
--
ALTER TABLE `books_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books_customuser_user_permissions`
--
ALTER TABLE `books_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- Constraints for table `books_customuser_groups`
--
ALTER TABLE `books_customuser_groups`
  ADD CONSTRAINT `books_customuser_gro_customuser_id_d9b3d1d8_fk_books_cus` FOREIGN KEY (`customuser_id`) REFERENCES `books_customuser` (`id`),
  ADD CONSTRAINT `books_customuser_groups_group_id_34ec5ee8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `books_customuser_user_permissions`
--
ALTER TABLE `books_customuser_user_permissions`
  ADD CONSTRAINT `books_customuser_use_customuser_id_968ef107_fk_books_cus` FOREIGN KEY (`customuser_id`) REFERENCES `books_customuser` (`id`),
  ADD CONSTRAINT `books_customuser_use_permission_id_23a87421_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
