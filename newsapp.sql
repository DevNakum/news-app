-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 07:52 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsapp`
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
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add post', 9, 'add_post'),
(34, 'Can change post', 9, 'change_post'),
(35, 'Can delete post', 9, 'delete_post'),
(36, 'Can view post', 9, 'view_post');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$6VZlFNgrR9d9Z0ekaqgNvN$PMD/MYsAWkFAQSvlRbhkAN40Dg7TjnH7Y0a3U4e6uOw=', '2023-06-08 10:31:14.870822', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2023-06-08 10:30:53.081597');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-06-08 10:32:23.138119', '1', 'Bussiness', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-06-08 10:32:54.957066', '2', 'Entertainment', 1, '[{\"added\": {}}]', 7, 1),
(3, '2023-06-08 10:33:05.193962', '3', 'Sports', 1, '[{\"added\": {}}]', 7, 1),
(4, '2023-06-08 10:33:11.826681', '4', 'Politics', 1, '[{\"added\": {}}]', 7, 1),
(5, '2023-06-08 10:33:49.645755', '1', 'User object (1)', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-06-08 10:34:25.385389', '2', 'User object (2)', 1, '[{\"added\": {}}]', 8, 1),
(7, '2023-06-08 10:34:34.208907', '2', 'User object (2)', 2, '[{\"changed\": {\"fields\": [\"Role\"]}}]', 8, 1),
(8, '2023-06-08 10:37:40.108240', '1', 'Post object (1)', 1, '[{\"added\": {}}]', 9, 1),
(9, '2023-06-08 10:41:59.868020', '2', 'Post object (2)', 1, '[{\"added\": {}}]', 9, 1),
(10, '2023-06-08 14:45:10.194018', '3', 'Post object (3)', 1, '[{\"added\": {}}]', 9, 1),
(11, '2023-06-09 05:42:36.292896', '2', 'Entertainment', 2, '[{\"changed\": {\"fields\": [\"NoOfPost\"]}}]', 7, 1),
(12, '2023-06-09 05:42:42.775585', '1', 'Bussiness', 2, '[{\"changed\": {\"fields\": [\"NoOfPost\"]}}]', 7, 1),
(13, '2023-06-09 05:45:29.237740', '3', 'Sports', 2, '[{\"changed\": {\"fields\": [\"NoOfPost\"]}}]', 7, 1),
(14, '2023-06-09 17:19:35.538690', '1', 'Bussiness', 2, '[{\"changed\": {\"fields\": [\"NoOfPost\"]}}]', 7, 1),
(15, '2023-06-09 17:28:39.711506', '1', 'Bussiness', 2, '[{\"changed\": {\"fields\": [\"NoOfPost\"]}}]', 7, 1),
(16, '2023-06-09 17:35:18.393976', '1', 'Bussiness', 2, '[{\"changed\": {\"fields\": [\"NoOfPost\"]}}]', 7, 1),
(17, '2023-06-12 13:42:41.220141', '4', 'Politics', 2, '[{\"changed\": {\"fields\": [\"NoOfPost\"]}}]', 7, 1),
(18, '2023-06-12 13:44:05.306615', '2', 'Entertainment', 2, '[{\"changed\": {\"fields\": [\"NoOfPost\"]}}]', 7, 1),
(19, '2023-06-12 13:45:14.726714', '5', 'Sports', 2, '[{\"changed\": {\"fields\": [\"NoOfPost\"]}}]', 7, 1),
(20, '2023-06-12 13:46:49.088100', '2', 'Entertainment', 2, '[{\"changed\": {\"fields\": [\"NoOfPost\"]}}]', 7, 1),
(21, '2023-06-12 13:55:15.172310', '5', 'Sport', 2, '[{\"changed\": {\"fields\": [\"Categoryname\"]}}]', 7, 1),
(22, '2023-06-12 13:55:47.882085', '5', 'Sports', 2, '[{\"changed\": {\"fields\": [\"Categoryname\"]}}]', 7, 1);

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
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'news1', 'category'),
(9, 'news1', 'post'),
(8, 'news1', 'user'),
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
(1, 'news1', '0001_initial', '2023-06-08 10:26:02.839624'),
(2, 'news1', '0002_alter_category_noofpost', '2023-06-08 10:26:02.854627'),
(3, 'contenttypes', '0001_initial', '2023-06-08 10:29:51.881771'),
(4, 'auth', '0001_initial', '2023-06-08 10:29:52.630827'),
(5, 'admin', '0001_initial', '2023-06-08 10:29:52.776839'),
(6, 'admin', '0002_logentry_remove_auto_add', '2023-06-08 10:29:52.793842'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-08 10:29:52.810844'),
(8, 'contenttypes', '0002_remove_content_type_name', '2023-06-08 10:29:52.901848'),
(9, 'auth', '0002_alter_permission_name_max_length', '2023-06-08 10:29:52.969855'),
(10, 'auth', '0003_alter_user_email_max_length', '2023-06-08 10:29:53.004858'),
(11, 'auth', '0004_alter_user_username_opts', '2023-06-08 10:29:53.017861'),
(12, 'auth', '0005_alter_user_last_login_null', '2023-06-08 10:29:53.083862'),
(13, 'auth', '0006_require_contenttypes_0002', '2023-06-08 10:29:53.088865'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2023-06-08 10:29:53.102867'),
(15, 'auth', '0008_alter_user_username_max_length', '2023-06-08 10:29:53.132866'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2023-06-08 10:29:53.163867'),
(17, 'auth', '0010_alter_group_name_max_length', '2023-06-08 10:29:53.193874'),
(18, 'auth', '0011_update_proxy_permissions', '2023-06-08 10:29:53.209871'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2023-06-08 10:29:53.244875'),
(20, 'sessions', '0001_initial', '2023-06-08 10:29:53.298878');

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
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7z8labtx5306wqc1nuy73gdneet4wdu5', 'eyJ1c2VyaWQiOjIsInJvbGUiOnRydWUsInVzZXJuYW1lIjoia2lzaGFuIn0:1q7gKW:eKlNoFweIwIScGsKHW9TgGj_yX5cnD2P3oCsjKB0Tho', '2023-06-23 17:55:20.255682'),
('lcvt729vozrkrr5w7fkpzuopjsuzfnef', 'eyJyb2xlIjp0cnVlLCJ1c2VybmFtZSI6Imtpc2hhbiIsInVzZXJpZCI6Mn0:1q8hzE:5vpL2caiDJ0Z603V4I9PdPnL8MgaW7tZRqpDVGA7lbU', '2023-06-26 13:53:36.354182'),
('oi5wx6g6gcxxcpdp0xp3ozyy3to5cfro', 'eyJ1c2VyaWQiOjIsInJvbGUiOnRydWUsInVzZXJuYW1lIjoia2lzaGFuIn0:1q7fsC:QXnO4wkhUHgp84cbTIXEqlPqM1Y4p918AMtwYW9-1uw', '2023-06-23 17:26:04.629217'),
('s6mxck5r48ly5lbdiql6qbmb2fb1iypb', '.eJxVjs0OgjAQhN9lz6TpDxbq0bvPQLbdraDYJhS8GN9dmnDQ63wzX-YNA27rOGyFl2EiOIOC5jfzGB6cKqA7plsWIad1mbyoFXHQIq6ZeL4c3T_BiGXc16eO0NqWkTiqwOiDJhkMdSzJSatNayUGr8ko7YyUfTSxU6Ri35NziLt0yTPDOeJcuIHqTvjkeoxfnODzBcVXQ0c:1q9Ig9:TXmWJrM3BbNjS9sH5EOgtBgEZbPY7_RIfBHYomCPcPI', '2023-06-28 05:04:21.746135');

-- --------------------------------------------------------

--
-- Table structure for table `news1_category`
--

CREATE TABLE `news1_category` (
  `id` bigint(20) NOT NULL,
  `categoryname` varchar(200) NOT NULL,
  `noOfPost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news1_category`
--

INSERT INTO `news1_category` (`id`, `categoryname`, `noOfPost`) VALUES
(1, 'Bussiness', 1),
(2, 'Entertainment', 1),
(4, 'Politics', 1),
(5, 'Sports', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news1_post`
--

CREATE TABLE `news1_post` (
  `date` datetime(6) NOT NULL,
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `img` varchar(100) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news1_post`
--

INSERT INTO `news1_post` (`date`, `id`, `title`, `description`, `img`, `author_id`, `category_id`) VALUES
('2023-06-14 05:04:15.927927', 1, 'Jindal may take 48% MG Motor India stake from China\'s SAIC', 'A private company owned by Sajjan Jindal, chairman of JSW Group, aims to buy into MG Motor India, a wholly owned arm of Shanghai-headquartered SAIC Motor, said people with knowledge of the matter.', 'post/jindal-may-take-48-mg-motor-india-stake-from-chinas-saic.jpg', 1, 1),
('2023-06-14 04:58:07.584104', 2, 'Disney delays Avatar sequels, reshuffles multiple Marvel movies including Deadpool 3 and Fantastic Four reboot', 'theatres in 2026 but said it would postpone the release of the next three installments in James Cameron‘s blockbuster Avatar series. The studio also pushed back the scheduled release dates for Thunder', 'post/Star-Wars-and-Avatar.jpg', 2, 2),
('2023-06-14 04:55:03.388193', 7, 'India has pace-bowling depth but where are the backup bowlers?', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consectetur nihil vel, ab accusantium quo libero! Odit omnis quod vitae voluptatibus iste aliquam ea non, nisi dolores cumque veniam inventore', 'post/indian-pace-bowling.jpg', 2, 5),
('2023-06-14 04:53:45.623920', 14, ' Ministers with two Rajya Sabha terms may be fielded as Lok Sabha candidates', 'Union ministers who have been Rajya Sabha MPs for two terms are believed to have been told to prepare for the 2024 polls as they may be fielded as Lok Sabha candidates, sources said on Tuesday.', 'post/parliament-1.webp', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `news1_user`
--

CREATE TABLE `news1_user` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news1_user`
--

INSERT INTO `news1_user` (`id`, `fname`, `lname`, `username`, `password`, `role`) VALUES
(1, 'dev', 'nakum', 'deven', '123', 0),
(2, 'kishan', 'nakum', 'kishan', '123', 1),
(8, 'safm', 'n jhjjjj', 'test', '123', 0);

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
-- Indexes for table `news1_category`
--
ALTER TABLE `news1_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news1_post`
--
ALTER TABLE `news1_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news1_post_author_id_fed06add_fk_news1_user_id` (`author_id`),
  ADD KEY `news1_post_category_id_1582771d_fk_news1_category_id` (`category_id`);

--
-- Indexes for table `news1_user`
--
ALTER TABLE `news1_user`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `news1_category`
--
ALTER TABLE `news1_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `news1_post`
--
ALTER TABLE `news1_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `news1_user`
--
ALTER TABLE `news1_user`
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
-- Constraints for table `news1_post`
--
ALTER TABLE `news1_post`
  ADD CONSTRAINT `news1_post_author_id_fed06add_fk_news1_user_id` FOREIGN KEY (`author_id`) REFERENCES `news1_user` (`id`),
  ADD CONSTRAINT `news1_post_category_id_1582771d_fk_news1_category_id` FOREIGN KEY (`category_id`) REFERENCES `news1_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
