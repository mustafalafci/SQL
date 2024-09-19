----------DAY 3 DT-------------------
---------TEKRAR------------
--NOT: unıque null kabul eder.
CREATE TABLE calisanlar(
    id char(5) PRIMARY KEY, --not null, unique, satırları tanımlamak ve başka bir tablo ile ilişkilendirmek için
    isim varchar(50) UNIQUE,
    maas int NOT NULL,
    ise_baslama date
); --parent/referenced(referans alınan)

CREATE TABLE adresler(
    adres_id char(5), --null,dublicate kabul eder.
    sokak varchar(30),
    cadde varchar(30),
    sehir varchar(20),
    FOREIGN KEY(adres_id) REFERENCES calisanlar(id)
);--child table

select * from calisanlar;
select * from adresler;

INSERT INTO calisanlar VALUES('10002', 'Donatello', 12000, '2018-04-14'); --başarılı
INSERT INTO calisanlar VALUES('10003', null, 5000, '2018-04-14'); ----başarılı unique null kabul eder.
INSERT INTO calisanlar VALUES('10004', 'Donatello', 5000, '2018-04-14');--name:unique
INSERT INTO calisanlar VALUES('10005', 'Michelangelo', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Leonardo', null, '2019-04-12');--salary not null
INSERT INTO calisanlar VALUES('10007', 'Raphael', '', '2018-04-14');--maas : INT
INSERT INTO calisanlar VALUES('', 'April', 2000, '2018-04-14');--id:char empty kabul eder
INSERT INTO calisanlar VALUES('', 'Ms.April', 2000, '2018-04-14');--pk olduğu için uniquetir
INSERT INTO calisanlar VALUES('10002', 'Splinter', 12000, '2018-04-14');--pk unique oldugu içindir
INSERT INTO calisanlar VALUES(null, 'Fred', 12000, '2018-04-14');--pk nut null
INSERT INTO calisanlar VALUES('10008', 'Barnie', 10000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'Wilma', 11000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Betty', 12000, '2018-04-14');

INSERT INTO adresler VALUES('10003', 'Ninja Sok', '40.Cad.', 'IST');--başarılı
INSERT INTO adresler VALUES('10003', 'Kaya Sok', '50.Cad.', 'Ankara');--başarılı
INSERT INTO adresler VALUES('10002', 'Taş Sok', '30.Cad.', 'Konya');--pkde 10012 yok

INSERT INTO adresler VALUES(NULL, 'Taş Sok', '23.Cad.', 'Konya');
INSERT INTO adresler VALUES(NULL, 'Taş Sok', '33.Cad.', 'Bursa');

--14-where condition(koşulu)

select * from calisanlar where isim='Donatello';

--calisanlar tablosundan maaşı 5000den fazla olanların tüm bilgilerini listeleyelim

select * from calisanlar where maas>5000;

--calisanlar tablosundan maaşı 5000den fazla olanların isim ve maaşlarını listeleyelim

select isim,maas from calisanlar where maas>5000;

--adresler tablosundan sehiri 'konya' ve 
--adres_idsi 10002 olan kaydın tüm verilerini getirelim.

select * from adresler where sehir='Konya' AND adres_id='10002';
select * from adresler where sehir='Konya' AND adres_id='10003'; -- false

--sehiri 'Konya' veya 'Bursa' olan adreslerin cadde ve sehir bilgilerini getirelim.
select cadde,sehir from adresler where sehir='Konya' or sehir='Bursa';

--15-tablodan kayıt silme - DELETE .... FROM komutu : DML filtreleme yapabilirsin,satır satır siler,geri alınabilir(rollback)

CREATE TABLE ogrenciler1
(
    id int,
    isim VARCHAR(50),
    veli_isim VARCHAR(50),
    yazili_notu int
);

INSERT INTO ogrenciler1 VALUES
(122, 'Kerem Can', 'Fatma', 75),
(123, 'Ali Can', 'Hasan', 75),
(124, 'Veli Han', 'Ayse', 85),
(125, 'Kemal Tan', 'Hasan', 85),
(126, 'Ahmet Ran', 'Ayse', 95),
(127, 'Mustafa Bak', 'Can', 99),
(128, 'Mustafa Bak', 'Ali', 99),
(129, 'Mehmet Bak', 'Alihan', 89);

select * from ogrenciler1;

--id-123 olan kaydı silelim

DELETE FROM ogrenciler1 where id=123;

--ismi Kemal Tan olan kaydı silelim.

DELETE FROM ogrenciler1 where isim='Kemal Tan';

--ismi Ahmet ran veya veli han olan kayıtları silelim

DELETE From ogrenciler1 where isim='Ahmet Ran' or isim='Veli Han';

--16-tablodaki tüm kayıtları silme
select * from students;

DELETE FROM students;
--tüm satıları siler ancak tablo kalır.

--16-b tablodaki tüm kayıtları silme : TRUNCATE TABLE: DDL,daha hızlı,filtreleme yapamazsın,önce her şeyi siler sonra tablo başlıklarını oluşturur,geri alınamaz
select * from doctors;

TRUNCATE TABLE doctors; --where kullanılamaz

--17-parent-child ilişkisi olan tablolardan kayıt silme 

select * from calisanlar;--parent
select * from adresler;--child

--calisanlar tablosundan tüm kayıtları silelim.
DELETE FROM calisanlar;--calisanlar tablosunda adresler tarafından referans alınan kayıtlar oldugu için silmeye izin yok
delete from calisanlar where id='10002';--id='10002' olan kayıt calisanlar tablosunda adresler tarafından referans alınan kayıtlar oldugu için silmeye izin yok

delete from adresler where adres_id='10002';--referans alınan kayıt silindi,ilişki koparıldı.
delete from calisanlar where id='10002';

delete from adresler; -- tüm ilişki koparıldı
delete from calisanlar;--artık ref alınmadığı için başarılı

--18-ON DELETE CASCADE aşamalı olarak silme
CREATE TABLE talebeler
(
    id int primary key,
    isim VARCHAR(50),
    veli_isim VARCHAR(50),
    yazili_notu int
);

CREATE TABLE notlar
(
    talebe_id int,
    ders_adi varchar(30),
    yazili_notu int,

    CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler (id) on delete cascade
);
INSERT INTO talebeler VALUES
(122, 'Kerem Can', 'Fatma', 75),
(123, 'Ali Can', 'Hasan', 75),
(124, 'Veli Han', 'Ayşe', 85),
(125, 'Kemal Tan', 'Hasan', 85),
(126, 'Ahmet Ran', 'Ayşe', 95),
(127, 'Mustafa Bak', 'Can', 99),
(128, 'Mustafa Bak', 'Ali', 99),
(129, 'Mehmet Bak', 'Alihan', 89);

INSERT INTO notlar VALUES
(123, 'kimya', 75),
(124, 'fizik', 65),
(125, 'tarih', 90),
(126, 'Matematik', 90),
(127, 'Matematik', 90),
(null, 'tarih', 90);

SELECT * FROM talebeler;--parent
SELECT * FROM notlar;--child

delete from notlar where talebe_id=123;
delete from talebeler where id=126; 

delete from talebeler;
--notlar tablosundan tüm referans alan kayıtları siler
--önce siler ardından tüm talebeleri siler

--19-tabloyu tamamen silme
DROP TABLE talebeler;--error
--ilişki tanımlı(fk ile referans alınıyor) oldugu için silinmez.
DROP TABLE talebeler cascade ;

DROP TABLE IF EXISTS talebeler1;

--20- IN Condition 
CREATE TABLE musteriler (
    urun_id INT,
    musteri_isim VARCHAR(50),
    urun_isim VARCHAR(50)
);
INSERT INTO musteriler VALUES
(10, 'Mark', 'Orange'),
(10, 'Mark', 'Orange'),
(20, 'John', 'Apple'),
(30, 'Amy', 'Palm'),
(20, 'Mark', 'Apple'),
(10, 'Adem', 'Orange'),
(40, 'John', 'Apricot'),
(20, 'Eddie', 'Apple');

--müşteriler tablosundan ürün ismi 'orange','apple' veya 'apricot' olan verileri listeleyiniz.
select * from musteriler where urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot';
--2.Yol
Select *
From musteriler
Where urun_isim IN('Orange','Apple','Apricot');

--Müşteriler tablosunda ürün ismi 'Orange','Apple' ve 'Apricot' olmayan verileri listeleyiniz.
Select *
from musteriler
where urun_isim NOT IN('Orange','Apple','Apricot');

--21-Between .. and ..
--müşteriler tablosunda urun_id 20 ile 300(dahil) arasında olan ürünlerin tüm bilgilerini listeleyiniz.
select *
from musteriler
where urun_id>=20 and urun_id<=30;
--2.yol
select *
from musteriler
where urun_id between 20 and 30;

--müşteriler tablosunda urun_idsi 20 den küçük veya 30(dahil değil) dan büyük olan urunlerin tum bilerini listeleyiniz.
select *
from musteriler
where urun_id not between 20 and 30; --20 ve 30 dahil değil

/*
özel bir durum ezberlemeye gerek yok
1. Tablo Yapısını Kontrol Etme
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'talebeler';
-- notlar tablosunun yapısı
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'notlar';

2. Mevcut Foreign Key Kısıtlamalarını Görüntüleme
SELECT
    tc.constraint_name, 
    tc.table_name, 
    kcu.column_name, 
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name,
    rc.delete_rule
FROM 
    information_schema.table_constraints AS tc 
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
    JOIN information_schema.constraint_column_usage AS ccu
      ON ccu.constraint_name = tc.constraint_name
    JOIN information_schema.referential_constraints AS rc
      ON tc.constraint_name = rc.constraint_name
WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='notlar';
Bu sorgu, notlar tablosundaki foreign key kısıtlamasını ve kaskad silme kuralını gösterecektir.
3. Kısıtlamayı Düzeltme
ALTER TABLE notlar DROP CONSTRAINT notlar_fk;
Kısıtlamayı Tekrar Ekleme:
ALTER TABLE notlar
ADD CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler (id) ON DELETE CASCADE;
*/


