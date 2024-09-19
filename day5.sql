--DAY 6--------------
--29-GROUP BY Clause: tablolarımızdaki kayıtları belirli bir sütuna göre gruplarımızı sağlar

CREATE TABLE manav
(
isim varchar(50),
urun_id varchar(50),
urun_miktar int
);

INSERT INTO manav VALUES ('Ali', 'Elma', 5);
INSERT INTO manav VALUES ('Ayse', 'Armut', 3);
INSERT INTO manav VALUES ('Veli', 'Elma', 2);
INSERT INTO manav VALUES ('Hasan', 'Uzum', 4);
INSERT INTO manav VALUES ('Ali', 'Armut', 2);
INSERT INTO manav VALUES ('Ayse', 'Elma', 3);
INSERT INTO manav VALUES ('Veli', 'Uzum', 5);
INSERT INTO manav VALUES ('Ali', 'Armut', 2);
INSERT INTO manav VALUES ('Veli', 'Elma', 3);
INSERT INTO manav VALUES ('Ayse', 'Uzum', 2);

select * from manav;

--manav tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz

select isim,sum(urun_miktar)
from manav 
group by isim

--Manav tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz.
--Toplam ürün miktarına göre AZALAN sıralayınız

select isim,sum(urun_miktar) toplam_kg
from manav
group by isim
order by sum(urun_miktar) desc

--her bir ismin aldığı her bir ürünün toplam miktarını görüntüleyiniz.

select isim, urun_id, sum(urun_miktar) toplam_kg
from manav
group by isim,urun_id
order by isim

--not: group by ile gruplama yapıldığında select komutundan sonra sadece gruplanan sütun veya başka bir sütunun aggregate fonk ile sonucu kullanılabilir.
-------!!!!!!---
select isim,urun_miktar
from manav
group by isim
---------------------

--ürün ismine göre her bir ürünü alan toplam kişi sayısını gösteriniz
SELECT urun_id, COUNT(DISTINCT isim) AS toplam_kisi
FROM manav
GROUP BY urun_id



