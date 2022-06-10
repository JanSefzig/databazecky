CREATE TABLE `age` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `age` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `age` (`id`, `age`) VALUES
(1,	'antiquity'),
(2,	'medieval'),
(3,	'modern age'),
(4,	'renaissance');

DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `characters_category_id` int unsigned DEFAULT NULL,
  `weapons_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `characters_category_id` (`characters_category_id`),
  KEY `weapons_id` (`weapons_id`),
  CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`characters_category_id`) REFERENCES `characters_category` (`id`),
  CONSTRAINT `characters_ibfk_2` FOREIGN KEY (`weapons_id`) REFERENCES `weapons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `characters` (`id`, `firstname`, `lastname`, `sex`, `nation`, `description`, `characters_category_id`, `weapons_id`) VALUES
(1,	'Altaïr',	'Ibn-LaʼAhad',	'Male',	'Syrian',	'Legend',	1,	1),
(2,	'Ezio',	'Auditore da Firenze',	'Male',	'Italian',	'Master',	1,	1),
(3,	'Connor ',	'Kenway',	'Male',	'Irish',	'Soldier',	1,	2),
(4,	'Edward',	'Kenway',	'Male',	'Welsh',	'Captian',	1,	3),
(5,	'Shay Patrick',	'Cormac',	'Male',	'Irish-American',	'Traitor',	2,	3),
(6,	'Arno',	'Dorian',	'Male',	'French',	'Revolutionary',	1,	1),
(7,	'Jacob',	'Frye',	'Male',	'English',	'Liberator',	1,	5),
(8,	'Evie',	'Frye',	'Female',	'English',	'Liberator',	1,	6),
(9,	'Bayek',	'from Siwa',	'Male',	'Egyptian',	'Protector',	5,	2),
(10,	'Alexios',	'from Sparta',	'Male',	'Greek',	'Warrior',	5,	2),
(11,	'Eivor',	'Wise Gift',	'Female',	'Nordic',	'Viking',	1,	7),
(12,	'François Thomas',	'Germain',	'Male',	'French',	'Blacksmith',	2,	1),
(13,	'Cesare',	'Borgia',	'Male',	'Italian',	'Prince',	2,	1),
(14,	'Haytham',	'Kenway',	'Male',	'British',	'Father',	2,	3),
(15,	'Deimos',	'',	'Female',	'Greek',	'Warrior',	4,	1),
(16,	'Crawford',	'Starrick',	'Male',	'England',	'Grand Master',	2,	3),
(17,	' Robert',	'de Sablé',	'Male',	'French',	'Templar',	2,	1);

DROP TABLE IF EXISTS `characters_category`;
CREATE TABLE `characters_category` (
  `name` varchar(255) NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `characters_category` (`name`, `id`) VALUES
('assassin',	1),
('templar',	2),
('friendly',	3),
('enemy',	4),
('other',	5);

DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `age_id` int unsigned DEFAULT NULL,
  `location_id` int unsigned DEFAULT NULL,
  `characters_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `age_id` (`age_id`),
  KEY `location_id` (`location_id`),
  KEY `characters_id` (`characters_id`),
  CONSTRAINT `games_ibfk_1` FOREIGN KEY (`age_id`) REFERENCES `age` (`id`),
  CONSTRAINT `games_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `games_ibfk_3` FOREIGN KEY (`characters_id`) REFERENCES `characters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `games` (`id`, `name`, `year`, `age_id`, `location_id`, `characters_id`) VALUES
(1,	'Assassins Creed',	2007,	2,	1,	1),
(2,	'Assassins Creed II',	2009,	2,	2,	2),
(3,	'Assassins Creed III',	2012,	2,	3,	3),
(4,	'Asssassins Creed IV Black Flag',	2013,	2,	4,	4),
(5,	'Asssassins Creed Rogue',	2014,	4,	5,	5),
(6,	'Asssassins Creed Unity',	2014,	4,	6,	6),
(7,	'Asssassins Creed Syndicate',	2015,	3,	7,	8),
(8,	'Asssassins Creed Origins',	2017,	1,	8,	9),
(9,	'Asssassins Creed Odyssey',	2018,	1,	9,	10),
(10,	'Asssassins Creed Valhalla',	2020,	2,	10,	11);

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `location` (`id`, `location`) VALUES
(1,	'Jerusalem'),
(2,	'Firenze'),
(3,	'Boston'),
(4,	'Caribic'),
(5,	' New York'),
(6,	'Paris'),
(7,	'London'),
(8,	'Egypt'),
(9,	'Greece'),
(10,	'England');

DROP TABLE IF EXISTS `weapons`;
CREATE TABLE `weapons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `weapons` (`id`, `name`, `type`, `description`) VALUES
(1,	'Sword',	'One-Handed',	'Basic'),
(2,	'Bow',	'Range',	'Stealth'),
(3,	'Firearm',	'Range',	'Modern'),
(4,	'Short Blade',	'One-Handed',	'Stealth'),
(5,	'Brass knuckles',	'Hand',	'Gangsta'),
(6,	'Kukri',	'Two-Handed',	'Fast'),
(7,	'Shield',	'One-Handed',	'Protect');

--SELECT--
SELECT c.firstname, c.lastname
FROM characters c
JOIN characters_category r ON r.id = c.id;

--GROUP BY--
SELECT COUNT(id), firstname
FROM characters
GROUP BY firstname;

--LIKE--
SELECT firstname
FROM characters
WHERE firstname LIKE 'E%' ;

--WHERE--
SELECT firstname
FROM characters
WHERE 2;

