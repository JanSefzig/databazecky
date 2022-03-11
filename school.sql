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