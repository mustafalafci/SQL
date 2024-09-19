--yorum satırı
/*
çoklu yorum satırı
*/

-------------------DAY'1 DT---------------------
--1-database oluşturma-DDL
CREATE DATABASE deneme;
--SQL komutlarında küçük/büyük harf duyarlılığı yoktur 
create database deneme2;

--2-database silme
DROP DATABASE deneme;

--3-tablo oluşturma
CREATE TABLE students(
id CHAR(4),
name VARCHAR(20),
grade REAL,
register_date DATE
);

--4-mevcut bir tablodan yeni bir tablo oluşturma
CREATE TABLE grades AS SELECT  name,grade FROM students;

--5-tabloyu silme
DROP TABLE grades;

--6-tabloya tüm fieldlarıyla data ekleme
INSERT INTO students VALUES('1001','Sherlock Holmes',99.8,'2023-11-12');
INSERT INTO students VALUES('1002','Harry Potter',98,now());

--7-data okuma/çekme
--a-tablodan tüm kayıtları tüm fieldlarıyla okuma
SELECT * FROM students;

--b-tablodan tüm kayıtları belirli fieldlarıyla okuma
SELECT name,grade FROM students;

--8-tabloya belirli fieldlarıyla data ekleme
INSERT INTO students(name,grade) VALUES('Jack Sparrow',99.9);


