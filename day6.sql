--------------DAY'7---------------------
--JOINS--BİRLEŞTİRME
--JOIN:ilişkili tablolarda ortak bir sütun baz alınarak(tipik olarak PK ve FK)
--bir veya daha fazla tablodaki sütunların birleştirilmesini sağlar.

CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'IBM');
INSERT INTO sirketler VALUES(101, 'GOOGLE');
INSERT INTO sirketler VALUES(102, 'MICROSOFT');
INSERT INTO sirketler VALUES(103, 'APPLE');

CREATE TABLE siparis (
siparis_id int,
sirket_id int,
siparis_tarihi date
);
INSERT INTO siparis VALUES(11, 101, '2023-02-17');  
INSERT INTO siparis VALUES(22, 102, ' 2023-02-18');  
INSERT INTO siparis VALUES(33, 103, ' 2023-01-19');  
INSERT INTO siparis VALUES(44, 104, ' 2023-01-20');  
INSERT INTO siparis VALUES(55, 105, ' 2022-12-21');
select * from siparis


--33-INNER JOIN:baz aldığımız sütundaki sadece ortak değerleri gösterir.

--iki tablodaki şirket id'si aynı olanların şirket id,şirket ismi,
--sipariş tarihini,sipariş idsini  listeleyiniz.

select sirketler.sirket_id,sirket_isim,siparis_id,siparis_tarihi
from sirketler
inner join siparis
on sirketler.sirket_id=siparis.sirket_id

--NOT: INNER JOIN'de ortak kayıtları birleştirdiğinden tablo sırası önemli olmaz.

--34-LEFT JOIN:Sol tablodaki(ilk tablodaki) tüm verileri getirir.
   --RIGHT JOIN:Sağ tablodaki(ikinci tablodaki) tüm verileri getirir.
   
   
--şirketler tablosundaki tüm kayıtların şirket id,şirket ismi,
--sipariş tarihini,sipariş idsini  listeleyiniz. 

select sirketler.sirket_id,sirket_isim,siparis_id,siparis_tarihi
from sirketler left join siparis
on sirketler.sirket_id=siparis.sirket_id

-- siparis tablosundaki tüm kayıtların şirket id,şirket ismi,
--siparis tarihini,sipariş idsini  listeleyiniz. 

select siparis.sirket_id,sirket_isim,siparis_id,siparis_tarihi
from sirketler right join siparis
on sirketler.sirket_id=siparis.sirket_id

--left ve right join tablo sıraları değiştirelerek birbirinin yerine alternatif olarak kullanılabilir.

--35-full join : iki tablodaki tüm kayıtları gösterir.

select siparis.sirket_id,sirket_isim,siparis_id,siparis_tarihi
from sirketler full join siparis
on sirketler.sirket_id=siparis.sirket_id
--veya
select *
from sirketler full join siparis
on sirketler.sirket_id=siparis.sirket_id

--36-SELF JOIN : tablonun kendi içindeki bir sütunu baz alarak INNER JOIN yapılmasını sağlar. 

CREATE TABLE personeller  (
id int,
isim varchar(20),  
title varchar(60), 
yonetici_id int
);
INSERT INTO personeller VALUES(1, 'Ali Can', 'SDET',     2);
INSERT INTO personeller VALUES(2, 'Veli Cem', 'QA',      3);
INSERT INTO personeller VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO personeller VALUES(4, 'Fatma Can', 'CEO',    null);

SELECT * FROM personeller;

--herbir personelin ismi ile birlikte yöneticisinin ismini de veren bir sorgu oluşturunuz.

select p.isim as personel,m.isim as yönetici
from personeller as p inner join personeller as m
on p.yonetici_id=m.id

--37-LIKE Cond.:WHERE komutu ile kullanılır, 
--Sorgular belirli bir karakter dizisini(desen-pattern) kullanarak filtreleme yapmamızı sağlar
--ILIKE:LIKE gibi çalışır ancak CASE INSENSITIVE dir.

CREATE TABLE words
( 
  word_id int UNIQUE,
  word varchar(50) NOT NULL,
  number_of_letters int
);

INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'Hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selim', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
INSERT INTO words VALUES (1009, 'hAt', 3);
INSERT INTO words VALUES (1010, 'yaf', 5);
INSERT INTO words VALUES (1011, 'ahata', 3);

SELECT * FROM words;

select * from developers where name='Enes Can'

--select * from developers where name='E....'

--wildcard(joker-%) : 0 veya daha fazla karakteri temsil eder.
select *
from developers
where name like 'A%'--A,Ab,Abc...

select *
from developers
where name like '%Şeker'--A,Ab,Abc...

select *
from developers
where name Ilike 'a%'--A,Ab,Abc... --Küçük Büyük harf farketmez.

--ismi T ile başlayıp n harfi ile biten dev isimlerini ve maaşlarını yazdıran QUERY yazin

select name,salary
from developers
where name like 'T%n'

--ismin içinde 'an' olan dev isimlerini ve maaşlarını yazdiran QUERY yazin.

select name,salary
from developers
where name like '%an%' --an,an...,....an

--ismin içinde e ve a harfi olan devlerin tüm bilgilerii yazdıran QUERY yazin.
--yasemin,kemal

select *
from developers
where name like '%e%a%' or name like '%a%e%';
--2.Yol
select *
from developers
where name like '%e%' and name like '%a%';

--*underscore(_) : sadece 1 karakteri temsil eder.
--isminin ikinci harfi ü olan devlerin tüm bilgilerini yazdıran QUERY yazin

select *
from developers
where name like '_ü%'

--Kullandığı prog.dili 4 harfli ve üçüncü harfi v olan devlerin tüm bilgilerini yazdıran QUERY yazin.

select *
from developers
where prog_lang like '__v_'

--Kullandığı prog. dili en az 5 harfli ve ilk harfi J olan devlerin tum bilgilerini yazdiran QUERY yazin.ÖDEVVV
--HINT:sadece JavaScript olacak
--Isminin 2. harfi e,4. harfi y olan devlerin tum bilgilerini yazdiran QUERY yazin. ÖDEVV
--ismi boşluk içeren devlerin tum bilgilerini yazdiran QUERY yazin:ÖDEVVVV


--38-REGEXP_LIKE(~):belirli bir karakter desenini içeren dataları regex kullanarak
--filtrelememizi sağlar.

--[] : içerisindeki harflarden sadece 1 tanesini temsil eder.

--words tablosu ile çalışalım.
--h harfinden sonra a veya i harfini sonra ise t harfini 
--içeren kelimelerin tum bilgilerini yazdiran QUERY yaziniz.

SELECT * 
FROM words
WHERE word ~ 'h[ai]t'; --hat,ahata nor : hait gelmez köşeli parantez içindekilerden sadece bir tanesini temsil eder.

SELECT * 
FROM words
WHERE word ~* 'h[ai]t'; --Case-insensitive

--h harfinden sonra, a ile k arasındaki harflerden birini , sonra da t harfini
--içeren kelimelerin tüm bilgilerini yazdıran QUERY yaziniz.

select *
from words
where word ~* 'h[a-k]t';

--içinde m veya i olan kelimelerin tüm bilgilerini yazdıran QUERY yazın.

select *
from words
where word ~* '[mi]'; --mat,ilk

--^:baslangıcı gösterir
--$:baslangıcı gösterir
--a ile baslayan kelimelerin tüm bilgilerini yazdıran query yazın.

select *
from words
where word ~* '^a';

--m ile biten kelimelerin tüm bilgilerini yazdıran query yazın.
select *
from words
where word ~* 'm$';

--a veya s ile baslayan kelimelerin tüm bilgilerini yazdıran query yazın
select *
from words
where word ~* '^[as]';

--(.*) : 0 veya daha fazla karakteri temsil eder.
-- .   : sadece 1 karakteri temsil eder.
--y ile baslayıp f ile biten kelimelerin tüm bilgilerini yazdıran query yazın

select *
from words
where word ~* '^y(.*)f$'; --yf,yaf,yusuf

--y ile başlayıp f ile biten 3 harfli kelimelerin tüm bilgilerini yazdıran QUERY yazın

select *
from words
where word ~* '^y.f$' --yaf





