--------- DAY 8 DT-----------

--tekrar 
--NOT LIKE: verilen karakter desenine benzemeyenleri getirir.
--   !~  :verilen regexi içermeyen kayıtları getirir.

--ilk harfi h veya H olmayan kelimelerin tüm bilgilerini  yazdıran QUERY yazınız

select * 
from words
where word NOT ILIKE 'h%'

select * 
from words
where word !~* '^h'

----39---String Fonksiyonlar

CREATE TABLE teachers (
id int,
firstname varchar(50),
lastname varchar(50),
age int,
city varchar(20),
course_name varchar(20),
salary real
);

INSERT INTO teachers VALUES (111, 'Ahmet', 'Han', 35, 'Istanbul', 'SpringMVC', 5000);
INSERT INTO teachers VALUES (112, 'Mehmet', 'Ran', 33, 'Van', 'HTML', 4000);
INSERT INTO teachers VALUES (113, 'Bilal', 'Fan', 34, 'Bursa', 'SQL', 3000);
INSERT INTO teachers VALUES (114, 'Celal', 'San', 30, 'Bursa', 'Java', 3000);
INSERT INTO teachers VALUES (115, 'Deniz', 'Can', 30, 'Istanbul', 'SQL', 3500);
INSERT INTO teachers VALUES (116, 'ekreM', 'Demir', 36, 'Istanbul', 'Java', 4000.5);
INSERT INTO teachers VALUES (117, 'Fatma', 'Celik', 38, 'Van', 'SpringB00T', 5550);
INSERT INTO teachers VALUES (118, 'Hakan', 'Cetin', 44, 'Izmir', 'Java', 3999.5);
INSERT INTO teachers VALUES (119, 'mert', 'Cetin', 32, 'Izmir', 'HTML', 2999.5);
INSERT INTO teachers VALUES (120, 'Nilay', 'Cetin', 32, 'Izmir', 'CSS', 2999.5);
INSERT INTO teachers VALUES (121, 'Selma', 'Celik', 40, 'Ankara', 'SpringB00T', 5550);
INSERT INTO teachers VALUES (122, 'fatiH', 'Can', 32, 'Ankara', 'HTML', 2550.22);
INSERT INTO teachers VALUES (123, 'Nihat', 'Keskin', 32, 'Izmir', 'CSS', 3000.5);
INSERT INTO teachers VALUES (124, 'Hasan', 'Temel', 37, 'Istanbul', 'S. Security', 3000.5);

--teachers tablosundaki tüm kayıtların
--first name değerleini büyük harfe
--lastname değerleinin küçük harfe çevirerek
--uzunlukları ile birlikte listeleyiniz.

select UPPER(firstname), LENGTH(firstname),LOWER(lastname),LENGTH(lastname)
from teachers

--teachers tablosunda firstname ve lastname değerlerindeki
--başlangıc ve sondaki boşlukları kaldırınız

UPDATE teachers
SET firstname=TRIM(firstname), lastname=TRIM(lastname)

--teachers tablosunda tüm kayıtların firstname değerlerini
--ilk harfini büyük diğerleri küçük harfe çevirerek görüntüleyiniz.

SELECT INITCAP(firstname)
FROM teachers;

--teachers tablosunda firstname değerlerinde 'Celal' kelimeini 'Cemal' ile değiştiriniz.

UPDATE teachers
SET firstname=REPLACE(firstname,'Celal','Cemal')


--calisanlar3 tablosunda isyeri='Pierre Cardin' olan kayıtlarda
--isyeri 'Cardin' ifadesini siliniz
select * from calisanlar3

UPDATE calisanlar3
SET isyeri=SUBSTRING(isyeri,1,LENGTH(isyeri)-7)
where isyeri='Pierre Cardin'

--words tablosunda tüm kelimeleri ve tüm kelimelerin(word) ilk 2 harfini görüntüleyiniz
SELECT word,SUBSTRING(word,1,2)
FROM words

--words tablosunda tüm kelimeleri ve tüm kelimelerin(word) 2.indeksten itibaren kalanını görüntüleyiniz
SELECT word, SUBSTRING(word,2)
FROM words

--40-FETCH NEXT n ROW ONLY: sadece sıradaki ilk n Satırı getirir
--                 LIMIT n: sadece sıradaki ilk n satırı getirir
--                OFFSET n: n satırı atlayıp sonrakileri getirir.

--developers tablosundan ekleme sırasına göre ilk 3 kaydı getiriniz.
select*
from developers
FETCH NEXT 3 ROW ONLY; -- SQL standardı
--veya

select * 
from developers
LIMIT 3; --PostgreSQL ve bazı DBMS

--developers tablosundan ekleme sırasına göre ilk 2 kayıttan sonraki ilk 3 kaydı getiriniz.
select *
from developers
offset 2 row --row zorunlu değil
limit 3;

--developers tablosundan maaşı en düşük olan 3 kaydı getiriniz.
select *
from developers
order by salary -- artan olarak sıralar default
limit 3;

--developers tablosundan maaşı en yüksek olan 2. developerın tüm bilgilerini getiriniz.

select *
from developers
order by salary desc 
offset 1
limit 1

--41-ALTER TABLE: tabloyu güncellemek için kullanılır: DDL
/*
add column ==>yeni sutun ekler
drop column ==> mevcut olan sutunu siler
rename column.. to..==> sutunun ismini değiştirir
rename.. to.. ==>tablonun ismini değiştirir.*/

select * from calisanlar3;

--calisanlar3 tablosuna yas(int) seklinde yeni sutun ekleyiniz.

Alter table calisanlar3
ADD COLUMN yas INTEGER

--calisanlar4 tablosuna remote(boolean) seklinde yeni sutun ekleyiniz
--varsayılan olarak remote değeri TRUE olsun

Alter table calisanlar3
ADD column remote BOOLEAN DEFAULT TRUE

SELECT * from employees

--calisanlar3 tablosunda yas sutunu siliniz.
alter table calisanlar3
drop column yas

--calisanlar3 tablosundaki maas sutununun data tipini real olarak güncelleyiniz
alter table calisanlar3
alter column maas type real--ondalık değerler de artık ekleyebilirim

--calisanlar3 tablosundaki maas sutununun gelir güncelleyiniz

alter table calisanlar3
rename column maas to gelir;

--calisanlar3 tablosunun ismini employees olarak güncelleyiniz.
alter table calisanlar3
rename to employees --calisanlar3 tablosunu employees olarak değiştirdik 

--employees tablosunda id sütunun data tipini varchar olarak güncelleyiniz.
alter table employees
alter column id type varchar(20)

--employees tablosunda id sütunun data tipini int olarak güncelleyiniz.

alter table employees
alter column id type int using id :: int --id sütunu nun ismin ni int olarak değiştirdik ilk başta hata verdi sonra eminim değiştir dedik sonra kabul etti 

--employees tablosunda isim sütununa not null constrainti ekleyiniz.
alter table employees
alter column isim set not null;

--NOT:içinde kayıtlar bulunan bir tabloyu güncellerken bir sütuna 
--NOT NULL,PK,FK,UNIQUE vs constraintleri ekleyebilmek için önce
--bu sütunların değerleri ilgili const.  sağlıyor olmalı.
--Not null uniuqe(Tekrarsız) == primary key
--subquary ile sadece getirme (Select) işlemi yapılır ve join ile de aynı şekilde

select * from sirketler
select * from siparis

--sirketler tablosunda sirket_id sütununa primary key constrainti ekleyiniz.

Alter table sirketler
add /*constraint sir_pk*/primary key (sirket_id) 


--sirketler tablosunda sirket_isim sütununa pUNIQUE constrainti ekleyiniz.

ALTER TABLE sirketler
add unique(sirket_isim)

--siparis tablosunda sirket_id sütununa pUNIQUE constrainti ekleyiniz.

ALTER TABLE siparis
add foreign key(sirket_id) references sirketler(sirket_id)
delete from siparis where sirket_id in (104,105)

--siparis tablosundaki FK constrainti kaldırınız.
ALTER TABLE siparis
DROP CONSTRAINT siparis_sirket_id_fkey--Foreign constraintini kaldıkdık

--employees tablosunda isim sütununa not null constraintini kaldırınız

ALTER TABLE employees
ALTER COLUMN isim drop not null

--42-Transsaction: Database deki en küçük işlem birimi 		
--       BEGIN:transactionı başlatır
--       COMMIT:transactionı onaylar ve sonlandırır
--       SAVEPOINT: kayıt noktası oluşturur
--       ROLLBACK:değişikleri mevcut duruma geri döndürür,transactionı sonlandırır

CREATE TABLE hesaplar
(
hesap_no int UNIQUE,
isim VARCHAR(50),
bakiye real       
);

INSERT INTO hesaplar VALUES(1234,'Harry Potter',10000.3);
INSERT INTO hesaplar VALUES(5678,'Jack Sparrow',5000.5);


SELECT * FROM hesaplar;

UPDATE hesaplar SET bakiye=bakiye-1000 WHERE hesap_no=1234;
--sistemde hata oluştu
UPDATE hesaplar SET bakiye=bakiye+1000 WHERE hesap_no=5678;
--veriler tutarsız

SELECT * FROM hesaplar;

-------------------------------------------------

BEGIN;
CREATE TABLE hesaplar
(
hesap_no int UNIQUE,
isim VARCHAR(50),
bakiye real       
);
COMMIT;

BEGIN;
INSERT INTO hesaplar VALUES(1234,'Harry Potter',10000.3);
INSERT INTO hesaplar VALUES(5678,'Jack Sparrow',5000.5);

SAVEPOINT x;

SELECT * FROM hesaplar;

--try{
UPDATE hesaplar SET bakiye=bakiye-1000 WHERE hesap_no=1234;

--sistemde hata oluştu, catch bloğundan devam

UPDATE hesaplar SET bakiye=bakiye+1000 WHERE hesap_no=5678;--bu işlem başarısız
--veriler tutarsız

COMMIT;
--}catch(hata){
ROLLBACK TO x;
ROLLBACK;--en son commitlenmiş haline geri döner
--}









































