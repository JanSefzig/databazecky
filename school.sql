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