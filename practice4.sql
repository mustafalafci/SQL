create table memurlar (
memur_id int PRIMARY key,
memur_isim VARCHAR(50),
memur_maas int
);

Insert into memurlar VALUES (1, 'çiğdem', 100000);
INSERT into memurlar VALUES (2, 'Duygu', 150000);
Insert into memurlar values (3, 'Aykut', 110000);
INSERT into memurlar values (4, 'Sıla');

select * from memurlar

--sıla hanıma maas degeri ataması yapalım
update memurlar set memur_maas=125000 where memur_isim='Sıla';

--en dusuk ve en buyuk maas değerlerinin oldugu kayıtları listeleyin
--1.YOL
SELECT * 
FROM memurlar 
WHERE memur_maas = (SELECT MAX(memur_maas) FROM memurlar)
   OR memur_maas = (SELECT MIN(memur_maas) FROM memurlar);
--2.YOL
(SELECT * FROM memurlar ORDER BY memur_maas ASC LIMIT 1)
UNION ALL
(SELECT * FROM memurlar ORDER BY memur_maas DESC LIMIT 1);

--aykut beyin maasini en yüksek maasa esitleyelim
update memurlar set memur_maas=(select max(memur_maas) from memurlar) where memur_isim='Aykut';







