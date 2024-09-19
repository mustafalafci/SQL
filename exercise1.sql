--PRACTICE 2
/*
SQL Queries-1

1-sqlpractice_db isminde database oluşturunuz.

2-sqlpractice_db database içinde musteri isminde tablo oluşturunuz.
      musteri_no(integer)
      isim (string,50 karakter)
      yas (int)
      cinsiyet (string 1:K/E)
      gelir(real)
      meslek(string,20 karakter)
      sehir (string,20 karakter)

constraintler:

musteri_no:primary key, otomatik olarak artırılsın

isim:not null ve not empty,yas:18 den büyük
*/
CREATE TABLE sqlpractice_db(
musteri_no SERIAL,
isim VARCHAR(50),
yas INTEGER,
cinsiyet VARCHAR CHECK(cinsiyet IN('K','E')),
gelir REAL,
meslek VARCHAR(20),
sehir VARCHAR(20),
CONSTRAINT pk_musteri_no PRIMARY KEY(musteri_no),
CONSTRAINT chk_isim CHECK (isim<>''),
CONSTRAINT chk_yas CHECK (yas>18)
);

SELECT * FROM sqlpractice_db;

/*
3-musteri tablosuna kayıt ekleyiniz.

isim:ALİ, yas:35,cinsiyet:E,gelir:2500,meslek:MÜHENDİS,sehir:İSTANBUL

3-aşağıdaki kayıtları musteri tablosuna ekleyiniz.


('BURAK',   25, 'E', 3500, 'MİMAR',       'İZMİR');
('CEYHUN',  45, 'E', 2000, 'MÜHENDİS',    'ANKARA');
('DEMET',   30, 'K', 3000, 'ÖĞRETMEN',    'ANKARA');
('FERHAT',  40, 'E', 2500, 'MİMAR',       'İZMİR');
('GALİP',   55, 'E', 4000, 'ÖĞRETMEN',    'İSTANBUL');
('KÖKSAL',  25, 'E', 2000, 'AVUKAT',      'İZMİR');
('LEYLA',   60, 'K', 2500, 'MİMAR',       'İSTANBUL');
('MELEK',   30, 'K', 2500, 'ÖĞRETMEN',    'İSTANBUL');
('JALE',    40, 'K', 6000, 'İŞLETMECİ',   'ANKARA');
('TEKİN',   45, 'E', 2000, 'AVUKAT',      'ANKARA');
('SAMET',   20, 'E', 3000, 'MİMAR',       'İSTANBUL');
('ŞULE',    20, 'K', 4500, 'ÖĞRETMEN',    'İSTANBUL');
('VELİ',    40, 'E', 2500, 'ÖĞRETMEN',    'İZMİR');
('ZEYNEP',  50, 'K', 3500, 'TESİSATÇI',   'İZMİR');
('ARDA',    55, 'E', 2000, 'KUAFÖR',      'İZMİR');
('MELİS',   30, 'K', 3000, 'KUAFÖR',      'ANKARA');
*/

INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ALİ',35,'E',2500,'MÜHENDİS','İSTANBUL');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('CEYHUN',  45, 'E', 2000, 'MÜHENDİS','ANKARA');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('DEMET',   30, 'K', 3000, 'ÖĞRETMEN',    'ANKARA');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('FERHAT',  40, 'E', 2500, 'MİMAR',       'İZMİR');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('GALİP',   55, 'E', 4000, 'ÖĞRETMEN',    'İSTANBUL');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('KÖKSAL',  25, 'E', 2000, 'AVUKAT',      'İZMİR');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('LEYLA',   60, 'K', 2500, 'MİMAR',       'İSTANBUL');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('MELEK',   30, 'K', 2500, 'ÖĞRETMEN',    'İSTANBUL');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('JALE',    40, 'K', 6000, 'İŞLETMECİ',   'ANKARA');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('TEKİN',   45, 'E', 2000, 'AVUKAT',      'ANKARA');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('SAMET',   20, 'E', 3000, 'MİMAR',       'İSTANBUL');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ŞULE',    20, 'K', 4500, 'ÖĞRETMEN',    'İSTANBUL');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('VELİ',    40, 'E', 2500, 'ÖĞRETMEN',    'İZMİR');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ZEYNEP',  50, 'K', 3500, 'TESİSATÇI',   'İZMİR');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ARDA',    55, 'E', 2000, 'KUAFÖR',      'İZMİR');
INSERT INTO sqlpractice_db(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('MELİS',   30, 'K', 3000, 'KUAFÖR',      'ANKARA');

/*
musteri tablosunda;
4-Tüm kayıtları listeleyiniz.
5-Tüm kayıtlardan isim ve meslek bilgilerini görüntüleyiniz
*/
SELECT * FROM sqlpractice_db;
SELECT isim, meslek FROM sqlpractice_db;

/*

6-sqlpractice_db databaseinde ;

“sehirler” isimli bir Table olusturun. 

Tabloda “alan_kodu”, “isim”, “nufus”  field’lari olsun.

Isim field’i null değer alamasın.

“alan_kodu” field’ini “Primary Key” yapin.
*/
CREATE TABLE sehirler(
alan_kodu CHAR(5) PRIMARY KEY,
isim VARCHAR(30) NOT NULL,
NUFUS INTEGER
);
SELECT * FROM sehirler;

/*

7-sqlpractice_db databaseinde;

a- “tedarikciler3” isimli bir tablo olusturun.

Tabloda “tedarikci_id”, “tedarikci_ismi”,  “iletisim_isim” field’lari olsun

“iletisim_isim”  fieldı tekrarsız olsun.

“tedarikci_id” yi Primary Key yapin.

b- “urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun

“tedarikci_id” yi Foreign Key yapin.
*/
CREATE TABLE tedarikciler3(
tedarikci_id CHAR(7) PRIMARY KEY,
tedarikci_isim VARCHAR(30) ,
iletisim_isim VARCHAR(30) UNIQUE
);
CREATE TABLE urunler(
tedarikci_id CHAR(7),
ürün_id CHAR(9) PRIMARY KEY,
FOREIGN KEY(tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);

SELECT * FROM tedarikciler3;
SELECT * FROM urunler;

