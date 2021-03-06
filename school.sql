--VYTVO5ENÍ DATABÁZE-- 
CREATE DATABASE School;

--CREATE TABLE--
CREATE TABLE student (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR (255),
  lastname VARCHAR (255),
  class VARCHAR (255),
  email VARCHAR (255)
); 

CREATE TABLE teacher (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR (255),
  lastname VARCHAR (255),
  email VARCHAR (255),
  description VARCHAR (255)
); 

CREATE TABLE subject (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR (255),
  description VARCHAR (255)
); 

CREATE TABLE classroom (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  number VARCHAR (255),
  description VARCHAR (255),
  building VARCHAR (255),
  seats_count INT ,
  is_computer_lab INT
); 



--INSERT INTO--
INSERT INTO student ( firstname, lastname, class, email) 
VALUES ( 'Jan' , 'Sefzig' , '2.C' , 'nicolas.jan.sefzig@student.ossp.cz' ),
       ( 'Lukáš' , 'Gremlica', '2.C' , 'lukas.gremlica@student.ossp.cz' ),
       ( 'Ondřej' , 'Čábelka', '2.C' , 'ondrej.cabelka@student.ossp.cz' ),
       ( 'Filip' , 'Dubček', '2.C' , 'filip.dubcek@student.ossp.cz' ),
       ( 'Jaroslav' , 'Kašák', '2.C' , 'jaroslav.kasak@student.ossp.cz' ),
       ( 'Daniel' , 'Šuman', '2.C' , 'daniel.suman@student.ossp.cz' ),
       ( 'Jaroslav' , 'Melichar', '2.C' , 'jaroslav.melichar@student.ossp.cz' ),
       ( 'Matěj' , 'Pošík', '2.C' , 'matej.posik@student.ossp.cz' ),
       ( 'Martin' , 'Hruška', '2.C' , 'martin.hruska@student.ossp.cz' ),
       ( 'Alexandr' , 'Důlovec', '2.C' , 'alexandr.dulovec@student.ossp.cz' ), 
       ( 'Zuzana' , 'Sahulková', '2.C' , 'zuzana.sahulková@student.ossp.cz' );

INSERT INTO teacher ( firstname, lastname, email, description) 
VALUES ( 'Martin' , 'Kokeš' , 'martin.kokes@ossp.cz' , 'IT' ),
       ( 'Lenka' , 'Sklenářová', 'lenka.sklenarova@ossp.cz' , 'M, IT' ),
       ( 'Milan' , 'Hála', 'milan.hala@ossp.cz' , 'CH, F, TV' ),
       ( 'Anna' , 'Říhová', 'anna.rihova@ossp.cz' , 'ČJ' ),
       ( 'Barbora' , 'Kulhánková', 'barboba.kulhankova@ossp.cz' , 'L, N' );

INSERT INTO subject ( name, description) 
VALUES ( 'Matematika' , 'Rovnice a počítání'  ),
       ( 'Český Jazyk' , 'Mateřský jazyk' ),
       ( 'Fyzika' , 'Vesmír' ),
       ( 'Chemie' , 'Prvky' ),
       ( 'Technické vybavení' , 'Hardware' ),
       ( 'Webové programování' , 'PHP'  ),
       ( 'Značkovací jazyky' , 'CSS' ),
       ( 'Tělesná výchova' , 'Joga' ),
       ( 'Angličtina' , 'AJ jazyk, slovíčka' ),
       ( 'Algoritmizace' , 'Databáze' );

INSERT INTO classroom( number, description, building, seats_count, is_computer_lab) 
VALUES ( '9' , 'V' , '2' , '30','0'),
       ( '6.A' , 'V' , '1' , '30','0'),
       ( '2' , 'V' , '1' , '30','0'),
       ( '13' , 'V' , '2' , '30','0'),
       ( '15' , 'M' , '2' , '15','0'),
       ( '19' , 'M' , '1' , '15','1'),
       ( '1' , 'M' , '1' , '15','1'),
       ( '99' , 'V' , '2' , '3000','0'),
       ( '6.B' , 'V' , '1' , '30','0'),
       ( '19' , 'M' , '1' , '15','1');

--PŘIDÁNÍ SLOUPCE--
ALTER TABLE subjects ADD shortname varchar(10);

--UPDATE shortname--
UPDATE subject SET shortname = 'AG' WHERE ID = 10;
UPDATE subject SET shortname = 'AJ' WHERE ID = 9;
UPDATE subject SET shortname = 'TV' WHERE ID = 8;
UPDATE subject SET shortname = 'ZJ' WHERE ID = 7;
UPDATE subject SET shortname = 'WP' WHERE ID = 6;
UPDATE subject SET shortname = 'TeV' WHERE ID = 5;
UPDATE subject SET shortname = 'CH' WHERE ID = 4;
UPDATE subject SET shortname = 'F' WHERE ID = 3;
UPDATE subject SET shortname = 'ČJ' WHERE ID = 2;
UPDATE subject SET shortname = 'M' WHERE ID = 1;

--UNIQUE--Nemůžeme přidat stejné data do jedné tabulky--
ALTER TABLE classroom
ADD UNIQUE (number);

ALTER TABLE student
ADD UNIQUE (email);

ALTER TABLE teacher
ADD UNIQUE (email);

--Schedule tabulka--
CREATE TABLE schedule (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  classroom_id INT,
  teacher_id INT,
  subject_id INT,
  lesson_number INT ,
  day_of_week tinyint
); 

INSERT INTO schedule ( classroom_id, teacher_id, subject_id, lesson_number, day_of_week) 
VALUES ( '1' , '1' , '6' , '1' ,'2'),
       ( '2' , '2', '1' , '1','3'),
       ( '3' , '3', '3' , '1','1'),
       ( '4' , '3', '4' , '2','1' ),
       ( '5' , '3', '5' , '3','1' ),
       ( '6' , '1', '6' , '2','2' ),
       ( '7' , '2', '7' , '2','3' ),
       ( '8' , '4', '8' , '1' ,'4'),
       ( '9' , '5', '9' , '1','5' ),
       ( '10' , '1', '10' , '3','2' );

--tabulka class--
CREATE TABLE class (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255)
); 

INSERT INTO class ( name, description) 
VALUES ( '2.C' , 'it' ),
       ( '2.H' , 'hasiči' ),
       ( '2.B' , 'ekonomika' ),
       ( '2.G' , 'grafici' ),
       ( '2.A' , 'obaláři' );

ALTER TABLE schedule ADD class_id INT;

ALTER TABLE schedule
ADD FOREIGN KEY (class_id) REFERENCES class(id);

UPDATE schedule
SET class_id = '1'
WHERE id = 1;

ALTER TABLE student
DROP COLUMN class;

ALTER TABLE student
ADD FOREIGN KEY (class_id) REFERENCES class(id);

--Propojení tabulky schedule pomocí JOIN-ů--
SELECT t.lastname, c.name, s.name, n.number
FROM schedule f
JOIN teacher t ON f.teacher_id = t.id
JOIN class c ON f.class_id = c.id
JOIN subject s ON f.subject_id = s.id
JOIN classroom n ON f.classroom_id = n.id ;

SELECT f.lesson_number_id FROM schedule f;
SELECT f.day_of_week_id FROM schedule f;

--SELECT day_of_week--
SELECT s.shortname, t.firstname,t.lastname,day_of_week 
FROM schedule f
JOIN teacher t ON f.teacher_id = t.id
JOIN subject s ON f.subject_id = s.id
WHERE day_of_week='1';

--Tabulka classification--
CREATE TABLE classification (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  grade tinyint,
  student_id INT UNSIGNED,
  subject_id INT UNSIGNED,
  teacher_id INT UNSIGNED,
  description  text,
  created_at datetime
); 

INSERT INTO classification ( grade, student_id, subject_id, teacher_id, description, created_at ) 
VALUES ( '11' , '1', '1', '2', 'výborný žák', '2021-04-22 08:17:31' ),
 ( '2' , '2', '1', '2', 'ok ', '2021-04-22 08:18:11' ),
 ( '3' , '3', '1', '2', 'jde to ', '2021-04-22 08:19:11' ),
 ( '4' , '4', '1', '2', 'uč se', '2021-04-22 08:20:21' ),
 ( '5' , '5', '1', '2', 'tragédie', '2021-04-22 08:21:31' ),
 ( '1' , '6', '1', '2', 'výborný žák', '2021-04-22 08:22:11' ),
 ( '2' , '7', '1', '2', 'ok', '2021-04-22 08:23:31' ),
 ( '3' , '8', '1', '2', 'jde to', '2021-04-22 08:24:11' ),
 ( '4' , '9', '1', '2', 'uč se', '2021-04-22 08:25:31' ),
 ( '5' , '10', '1', '2', 'tragédie', '2021-04-22 08:26:41' );

SELECT teacher_id
FROM classification cc
JOIN teacher t ON cc.teacher_id = t.id;

ALTER TABLE classification
ADD FOREIGN KEY (teacher_id) REFERENCES teacher(id);

ALTER TABLE classification
ADD FOREIGN KEY (student_id) REFERENCES student(id);

ALTER TABLE classification
ADD FOREIGN KEY (subject_id) REFERENCES subject(id);

SELECT c.lastname AS 'Příjmení studenta', t.lastname AS 'Příjmení učitele', s.id AS 'Předmět', cc.grade AS 'Známka', cc.description AS 'Popis'
FROM classification cc
JOIN teacher t ON cc.teacher_id = t.id
JOIN student c ON cc.student_id = c.id
JOIN subject s ON cc.subject_id = s.id ;

--prumerna znamka--
SELECT AVG(grade)
FROM classification
WHERE 1;
--nejhorsi znamka--
SELECT s.shortname, MAX(grade)
FROM subject s
JOIN classification c ON c.subject_id = s.id

GROUP BY s.shortname;
--nejlepsi znamka--
SELECT s.shortname, MIN(grade)
FROM subject s
JOIN classification c ON c.subject_id = s.id

GROUP BY s.shortname;

INSERT INTO classification ( firstname, lastname, sex, nation, description ) 
VALUES ( 'Altaïr' , 'Ibn-LaʼAhad', 'Male', 'Syrian', 'Legend' ),
 ( 'Ezio' , 'Auditore da Firenze', 'Male', 'Italian', 'Master' ),
 ( 'Connor ' , 'Kenway', 'Male', 'Irish', 'Soldier' ),
 ( 'Edward' , 'Kenway', 'Male', 'Welsh', 'Captian' ),
 ( 'Shay Patrick' , 'Cormac', 'Male', 'Irish-American', 'Traitor' ),
 ( 'Arno' , 'Dorian', 'Male', 'French', 'Revolutionary' ),
 ( 'Jacob' , 'Frye', 'Male', 'English', 'Liberator' ),
 ( 'Evie' , 'Frye', 'Female', 'English', 'Liberator' ),
 ( 'Bayek' , 'from Siwa', 'Male', 'Egyptian', 'Protector' ),
 ( 'Alexios' , 'from Sparta', 'Male', 'Greek', 'Warrior' ),
 ( 'Eivor' , 'Wise Gift', 'Female', 'Nordic', 'Viking' ),
 ( 'François Thomas' , 'Germain', 'Male', 'French', 'Blacksmith' ),
 ( 'Cesare' , 'Borgia', 'Male', 'Italian', 'Prince' ),
 ( 'Haytham' , 'Kenway', 'Male', 'British', 'Father' ),
 ( 'Deimos' , '', 'Female', 'Greek', 'Warrior' ),
 ( 'Crawford' , 'Starrick', 'Male', 'England', 'Grand Master' ),
 ( ' Robert' , 'de Sablé', 'Male', 'French', 'Templar' );

INSERT INTO games ( name, year ) 
VALUES ( 'Assassins Creed', '2007 '),
 ( 'Assassins Creed II' , '2009'),
 ( 'Assassins Creed III' , '2012'),
 ( 'Asssassins Creed IV Black Flag' , '2013'),
 ( 'Asssassins Creed Rogue' , '2014'),
 ( 'Asssassins Creed Unity' , '2014'),
 ( 'Asssassins Creed Syndicate' , '2015'),
 ( 'Asssassins Creed Origins' , '2017'),
 ( 'Asssassins Creed Odyssey' , '2018'),
 ( 'Asssassins Creed Valhalla' , '2020');

 INSERT INTO location ( location ) 
VALUES ( 'Jerusalem'),
 ( 'Firenze'),
 ( 'Boston'),
 ( 'Caribic'),
 ( ' New York'),
 ( 'Paris'),
 ( 'London'),
 ( 'Egypt'),
 ( 'Greece'),
 ( 'England');

 INSERT INTO age ( age ) 
VALUES ( 'antiquity'),
( 'medieval'),
( 'modern age'),
( 'renaissance');


 


