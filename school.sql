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