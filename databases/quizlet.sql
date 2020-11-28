-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 27, 2020 lúc 06:00 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quizlet`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activity`
--

CREATE TABLE `activity` (
  `user_id` int(11) NOT NULL,
  `set_id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `date_happen` datetime DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `application`
--

CREATE TABLE `application` (
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_free_add_user` tinyint(4) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class_has_folder`
--

CREATE TABLE `class_has_folder` (
  `class_class_id` int(11) NOT NULL,
  `folder_folder_id` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class_has_set`
--

CREATE TABLE `class_has_set` (
  `class_class_id` int(11) NOT NULL,
  `set_set_id` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class_has_user`
--

CREATE TABLE `class_has_user` (
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_manager` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `folder`
--

CREATE TABLE `folder` (
  `folder_id` int(11) NOT NULL,
  `folder_name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `folder_has_set`
--

CREATE TABLE `folder_has_set` (
  `folder_id` int(11) NOT NULL,
  `set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invitation`
--

CREATE TABLE `invitation` (
  `user_sent_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `user_received_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `privacy_set`
--

CREATE TABLE `privacy_set` (
  `privacy_set_id` int(11) NOT NULL,
  `privacy_status` varchar(45) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_class`
--

CREATE TABLE `report_class` (
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `report_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_user`
--

CREATE TABLE `report_user` (
  `user_sent_id` int(11) NOT NULL,
  `user_received_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `report_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `set`
--

CREATE TABLE `set` (
  `set_id` int(11) NOT NULL,
  `set_name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `set`
--

INSERT INTO `set` (`set_id`, `set_name`, `description`, `image_url`, `owner_id`, `date_created`) VALUES
(1, 'IT', 'demo', 'img', 1, '2020-11-24 07:46:23'),
(2, 'set2', 'demo', 'img', 1, '2020-11-06 21:34:42'),
(3, 'set2', 'dfdsf', 'dfdf', 1, '2020-11-06 21:34:42'),
(4, 'set5', 'dfdf', 'dfdf', 1, '2020-11-09 21:26:12'),
(5, 'for test', 'only for test', 'abc', 1, '2020-11-24 22:56:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag`
--

CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `term` varchar(45) DEFAULT NULL,
  `definition` varchar(45) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `set_id` int(11) NOT NULL,
  `is_marked` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tag`
--

INSERT INTO `tag` (`tag_id`, `term`, `definition`, `image_url`, `set_id`, `is_marked`) VALUES
(1, 'key', 'khóa', 'img', 1, 1),
(2, 'a', 'a', 'dsdsd', 2, 1),
(3, 'b', 'b', 'b', 3, 1),
(4, 'c', 'c', 'c', 4, 1),
(5, 'bag', 'Cặp', NULL, 1, NULL),
(6, 'eat', 'ăn', NULL, 1, NULL),
(7, 'learn', 'học', NULL, 1, NULL),
(8, 'sing', 'hát', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `avatar_url` text DEFAULT NULL,
  `type_account` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `first_name`, `last_name`, `password`, `email`, `date_of_birth`, `avatar_url`, `type_account`) VALUES
(1, 'Nambigboi', 'Bùi', 'Nam', '1', 'b@gmail.com', '2020-11-18 17:03:07', 'ava', NULL),
(2, 'shido', 'Nghia', 'Dao', '1', NULL, NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`user_id`,`set_id`),
  ADD KEY `fk_user_has_set_set1_idx` (`set_id`),
  ADD KEY `fk_user_has_set_user1_idx` (`user_id`);

--
-- Chỉ mục cho bảng `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`user_id`,`class_id`),
  ADD KEY `fk_user_has_class_class2_idx` (`class_id`),
  ADD KEY `fk_user_has_class_user2_idx` (`user_id`);

--
-- Chỉ mục cho bảng `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Chỉ mục cho bảng `class_has_folder`
--
ALTER TABLE `class_has_folder`
  ADD PRIMARY KEY (`class_class_id`,`folder_folder_id`),
  ADD KEY `fk_class_has_folder_folder1_idx` (`folder_folder_id`),
  ADD KEY `fk_class_has_folder_class1_idx` (`class_class_id`);

--
-- Chỉ mục cho bảng `class_has_set`
--
ALTER TABLE `class_has_set`
  ADD PRIMARY KEY (`class_class_id`,`set_set_id`),
  ADD KEY `fk_class_has_set_set1_idx` (`set_set_id`),
  ADD KEY `fk_class_has_set_class1_idx` (`class_class_id`);

--
-- Chỉ mục cho bảng `class_has_user`
--
ALTER TABLE `class_has_user`
  ADD PRIMARY KEY (`class_id`,`user_id`),
  ADD KEY `fk_class_has_user_user1_idx` (`user_id`),
  ADD KEY `fk_class_has_user_class_idx` (`class_id`);

--
-- Chỉ mục cho bảng `folder`
--
ALTER TABLE `folder`
  ADD PRIMARY KEY (`folder_id`),
  ADD KEY `fk_folder_user1_idx` (`owner_id`);

--
-- Chỉ mục cho bảng `folder_has_set`
--
ALTER TABLE `folder_has_set`
  ADD PRIMARY KEY (`folder_id`,`set_id`),
  ADD KEY `fk_folder_has_set_set1_idx` (`set_id`),
  ADD KEY `fk_folder_has_set_folder1_idx` (`folder_id`);

--
-- Chỉ mục cho bảng `invitation`
--
ALTER TABLE `invitation`
  ADD PRIMARY KEY (`user_sent_id`,`class_id`,`user_received_id`),
  ADD KEY `fk_user_has_class_class1_idx` (`class_id`),
  ADD KEY `fk_user_has_class_user1_idx` (`user_sent_id`),
  ADD KEY `fk_invitation_user1_idx` (`user_received_id`);

--
-- Chỉ mục cho bảng `privacy_set`
--
ALTER TABLE `privacy_set`
  ADD PRIMARY KEY (`privacy_set_id`,`set_id`),
  ADD KEY `fk_privacy_set_set1_idx` (`set_id`);

--
-- Chỉ mục cho bảng `report_class`
--
ALTER TABLE `report_class`
  ADD PRIMARY KEY (`user_id`,`class_id`),
  ADD KEY `fk_user_has_class_class3_idx` (`class_id`),
  ADD KEY `fk_user_has_class_user3_idx` (`user_id`);

--
-- Chỉ mục cho bảng `report_user`
--
ALTER TABLE `report_user`
  ADD PRIMARY KEY (`user_sent_id`,`user_received_id`),
  ADD KEY `fk_user_has_user_user2_idx` (`user_received_id`),
  ADD KEY `fk_user_has_user_user1_idx` (`user_sent_id`);

--
-- Chỉ mục cho bảng `set`
--
ALTER TABLE `set`
  ADD PRIMARY KEY (`set_id`),
  ADD KEY `fk_set_user1_idx` (`owner_id`);

--
-- Chỉ mục cho bảng `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`,`set_id`),
  ADD KEY `fk_tag_set1_idx` (`set_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `folder`
--
ALTER TABLE `folder`
  MODIFY `folder_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `privacy_set`
--
ALTER TABLE `privacy_set`
  MODIFY `privacy_set_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `set`
--
ALTER TABLE `set`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tag`
--
ALTER TABLE `tag`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `fk_user_has_set_set1` FOREIGN KEY (`set_id`) REFERENCES `set` (`set_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_set_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `fk_user_has_class_class2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_class_user2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `class_has_folder`
--
ALTER TABLE `class_has_folder`
  ADD CONSTRAINT `fk_class_has_folder_class1` FOREIGN KEY (`class_class_id`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_class_has_folder_folder1` FOREIGN KEY (`folder_folder_id`) REFERENCES `folder` (`folder_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `class_has_set`
--
ALTER TABLE `class_has_set`
  ADD CONSTRAINT `fk_class_has_set_class1` FOREIGN KEY (`class_class_id`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_class_has_set_set1` FOREIGN KEY (`set_set_id`) REFERENCES `set` (`set_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `class_has_user`
--
ALTER TABLE `class_has_user`
  ADD CONSTRAINT `fk_class_has_user_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_class_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `folder`
--
ALTER TABLE `folder`
  ADD CONSTRAINT `fk_folder_user1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `folder_has_set`
--
ALTER TABLE `folder_has_set`
  ADD CONSTRAINT `fk_folder_has_set_folder1` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`folder_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_folder_has_set_set1` FOREIGN KEY (`set_id`) REFERENCES `set` (`set_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `invitation`
--
ALTER TABLE `invitation`
  ADD CONSTRAINT `fk_invitation_user1` FOREIGN KEY (`user_received_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_class_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_class_user1` FOREIGN KEY (`user_sent_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `privacy_set`
--
ALTER TABLE `privacy_set`
  ADD CONSTRAINT `fk_privacy_set_set1` FOREIGN KEY (`set_id`) REFERENCES `set` (`set_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `report_class`
--
ALTER TABLE `report_class`
  ADD CONSTRAINT `fk_user_has_class_class3` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_class_user3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `report_user`
--
ALTER TABLE `report_user`
  ADD CONSTRAINT `fk_user_has_user_user1` FOREIGN KEY (`user_sent_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_user_user2` FOREIGN KEY (`user_received_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `set`
--
ALTER TABLE `set`
  ADD CONSTRAINT `fk_set_user1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `fk_tag_set1` FOREIGN KEY (`set_id`) REFERENCES `set` (`set_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
