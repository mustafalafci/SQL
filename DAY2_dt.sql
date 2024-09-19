------------ DAY 2 DT-------------
--tekrar
CREATE TABLE IF NOT EXISTS sairler(
id INTEGER,
name VARCHAR(30),
email VARCHAR(50)
);

INSERT INTO sairler VALUES(1001,'Cahit Zarifoglu','sair@mail.com');
INSERT INTO sairler VALUES(1002,'Atilla İlhan','sair@mail.com');

INSERT INTO sairler(name) VALUES('Özdemir Asaf');

SELECT * FROM sairler;

--9-tabloya UNIQUE constrainti ekleme
CREATE TABLE programmers(
id SERIAL, --bir data tipi olmamak birlikte 1'den başlayarak her kayıt eklendiğinde değerleri bir bir otamatik sayısal değerler üretir.
name VARCHAR(30),
email VARCHAR(50) UNIQUE,
salary REAL,
prog_lang VARCHAR(20)
);

INSERT INTO programmers(name,email,salary,prog_lang) VALUES('Tom','tom@mail.com',5000,'Java');
INSERT INTO programmers(name,email,salary,prog_lang) VALUES('Jerry','tom@mail.com',6000,'JavaScript');
--email tekrarsız olmalıydı. Key (email)=(tom@mail.com) already exists.duplicate key value violates unique constraint "programmers_email_key" 
INSERT INTO programmers(name,email,salary,prog_lang) VALUES('Jerry','jerry@mail.com',6000,'JavaScript');

INSERT INTO programmers(email,salary,prog_lang) VALUES('null@mail.com',6000,'Phyton');


SELECT * FROM programmers;

--10-tabloya NOT NULL constrainti ekleme
CREATE TABLE doctors(
id SERIAL,
name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
salary REAL
);

INSERT INTO doctors(name,email,salary) VALUES('Dr.Gregory House','dr@mail.com',5000);
INSERT INTO doctors(email,salary) VALUES('Dr.Green',6000);
--name null olamaz. ERROR:  Failing row contains (2, null, Dr.Green, 6000).null value in column "name" of relation "doctors" violates not-null constraint 
INSERT INTO doctors(name,email,salary) VALUES('','email@mail.com',6000);
-- '' yani empty null değildir.

SELECT * FROM doctors;