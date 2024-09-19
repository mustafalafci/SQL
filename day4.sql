--22-AGGREGATE Fonk.

CREATE TABLE calisanlar3 (
    id int,
    isim VARCHAR(50),
    sehir VARCHAR(50),
    maas int,
    isyeri VARCHAR(20)
);

INSERT INTO calisanlar3 VALUES (123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES (234567890, 'Ayse Gul', 'Istanbul', 1000, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES (345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES (456789012, 'Veli Yilmaz', 'Izmir',1800, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES (567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES (456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES (123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');   


CREATE TABLE markalar (
    marka_id int,
    marka_isim VARCHAR(20),
    calisan_sayisi int
);

INSERT INTO markalar VALUES (100, 'Vakko', 12000);
INSERT INTO markalar VALUES (101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES (102, 'Adidas', 10000);
INSERT INTO markalar VALUES (103, 'LCWaikiki', 21000);   


SELECT * FROM markalar;
SELECT * FROM calisanlar3; 

--calisanlar3 tablosundan max maaş değerini bulunuz
select MAX(maas) from calisanlar3;
--calisanlar3 tablosundan min maaş değerini bulunuz
select MIN(maas) from calisanlar3;
--calisanlar3 tablosundan toplam maaş değerini bulunuz
select sum(maas) from calisanlar3;
--calisanlar3 tablosundan ortlama maaş değerini bulunuz
select avg(maas) from calisanlar3;
select round(avg(maas),2) from calisanlar3;
--calisanlar3 tablosundaki kayıt sayısını bulunuz
select count(*) from calisanlar3; --count(id,maas...) hepsi aynı satırda oldugu için hernagi birini kullanabiliriz
--calisanlar3 tablosundaki maaşı 2500 olanların kayıt sayısını bulunuz
select count(*) from calisanlar3 where maas=2500;

--23-ALIASES:Rumuz/Etiket/takma ismi

CREATE TABLE workers (
    calisan_id char(9),
    calisan_isim varchar(50),
    calisan_dogdugu_sehir varchar(50)
);

INSERT INTO workers VALUES (123456789, 'Ali Can', 'Istanbul');
INSERT INTO workers VALUES (234567890, 'Veli Cem', 'Ankara');
INSERT INTO workers VALUES (345678901, 'Mine Bulut', 'Izmir');

select * from workers;
select * from markalar;

select calisan_id as id from workers;--geçici olarak id etiketini verdik calisan_id'ye
select calisan_isim isim from workers;--as takısı olmadan da yapılabilir tamamen aynı,genel kullanım

select calisan_isim isim from workers as w;--tablo ismine de geçici isim verilir.

--24-SUBQUERY - NESTED QUERY
--24-a- SUBQUERY : WHERE ile kullanımı

--marka_id si 100 olan markada çalışanları listeleyiniz.
select marka_isim from markalar where marka_id=100; -- Vakko
select * from calisanlar3 where isyeri='Vakko';

--alternatif
select *
from calisanlar3
where isyeri=(select marka_isim 
from markalar 
where marka_id=100)

select * from markalar;

--INTERVIEW QUESTION : calisanlar3 tablosundan max maaşı alan çalışanın tüm fieldlerini listeleyiniz.

select *
from calisanlar3
where maas=(select max(maas) 
            from calisanlar3) --dinamik bir sorgu

--INTERVIEW QUESTION : calisanlar3 tablosundan ikinci en yüksek maaşı alan çalışanın tüm fieldlerini listeleyiniz.

SELECT *
FROM calisanlar3
WHERE maas = (
    SELECT MAX(maas)
    FROM calisanlar3
    WHERE maas < (SELECT MAX(maas) FROM calisanlar3)
);

--calisanlar3 tablosundan max veya min maaşı alan çalışanların tüm fieldlerini gösteriniz

select * 
from calisanlar3 
where maas=(select max(maas) from calisanlar3) or 
      maas=(select min(maas) from calisanlar3)

--Ankara'da çalışanı olan markaların marka idlerini ve çalışan sayısını listeleyiniz

SELECT marka_id,calisan_sayisi
FROM markalar
where marka_isim IN(select isyeri from calisanlar3 where sehir='Ankara'); 

--marka_id'si 101'den büyük olan marka çalisanlarinin tüm bilgilerini listeleyiniz.

Select *
from calisanlar3 where isyeri IN(select marka_isim from markalar where marka_id>101);

--calisan sayisi 15.000'den cok olan markalarin isimlerini ve bu markada calisanların isimlerini ve maaşlarını listeleyiniz

select isim,maas,isyeri
from calisanlar3
where isyeri IN(select marka_isim from markalar where calisan_sayisi>15000)

--24-b subquery: select komutundan sonra kullanımı
--her markanin id'sini ismini ve toplam kaç şehirde bulunduğunu listeleyen bir sorgu yazınız

select marka_id,marka_isim,(select count(sehir) from calisanlar3 where isyeri=marka_isim)
from markalar;

--DISTINCT:sadece farklı degerler alır
-- her markanın ismi calisan sayisini ve o markaya ait calisanlarin maksimum ve min maaşını listeleyen bir sorgu yazınız
select marka_isim,calisan_sayisi,(select max(maas) from calisanlar3 where isyeri=marka_isim),--correlated
                                 (select min(maas) from calisanlar3 where isyeri=marka_isim)
from markalar;

--25-EXISTS Koşulu.               
-- =,!=,<>, <, >, >=, <=, AND, OR..
--IN, BETWEEN .. AND
--Bir SQL sorgusunda alt sorgunun sonucunun boş olup olmadığını kontrol etmek için kullanılır.
--Eğer alt sorgu sonucu boş değilse, koşul sağlanmış sayılır ve sorgunun geri kalanı işletilir.
--Alt sorgu en az bir satır döndürürse sonucu EXISTS doğrudur.
--Alt sorgunun satır döndürmemesi durumunda, sonuç EXISTS yanlıştır.

CREATE TABLE mart (
    urun_id int,
    musteri_isim varchar(50),
    urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart  VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan (
    urun_id int,
    musteri_isim varchar(50),
    urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota'); 

select * from mart;
select * from nisan;

--mart ayında toyota satışı yapılmış ise nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz

select *
from nisan
where exists(select * from mart where urun_isim='Toyota'); --exists var ise true döndürür.

--mart ayında 'Volvo' satışı yapılmış is nisandaki tüm ürünlerini gösteriniz
select *
from nisan
where exists(select * from mart where urun_isim='Volvo');

--mart ayında satılan ürünün urun_id ve musteri_isim'lerini eger nisan ayında da satılmışsa, listeleyen bir sorgu yazınız.

select urun_id,musteri_isim
from mart as m
where exists(select * from nisan as n where n.urun_isim=m.urun_isim);

-- her iki ayda birden satılan ürünlerin urun_isim'lerini bu ürünleri nisan ayında satın alan musteri_isim'lerini listeleyen bir sorgu yazınız.

select urun_isim,musteri_isim
from nisan n
where exists(select * from mart m where m.urun_isim=n.urun_isim);

--martta satılıp nisanda satılmayan ürünlerin urun_isim'lerini ve bu ürünleri mart ayında satın alan musteri_isimlerini listeleyen bir sorgu yazınız.

select urun_isim,musteri_isim
from mart m
where not exists(select * from nisan n where n.urun_isim=m.urun_isim)