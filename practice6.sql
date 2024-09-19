DROP TABLE ogrenciler
CREATE TABLE ogrenciler (
    ogr_no INT PRIMARY KEY,
    ogr_isim VARCHAR(30),
    sinif INT,
    ders_id INT
);

INSERT INTO ogrenciler VALUES (12, 'Enes Erdem', 10, 1);
INSERT INTO ogrenciler VALUES (33, 'Melek Maden', 9, 3);
INSERT INTO ogrenciler VALUES (54, 'Burcu Deniz', 10, 8);
INSERT INTO ogrenciler VALUES (18, 'Polat Yıldırım', 11, 2);
INSERT INTO ogrenciler VALUES (42, 'Defne Gümüş', 12, 4);
INSERT INTO ogrenciler VALUES (23, 'Serpil Ateş', 11, 4);
INSERT INTO ogrenciler VALUES (45, 'Mehmet Güneş', 9, 7);
INSERT INTO ogrenciler VALUES (32, 'Demet Bulut', 12, 6);
INSERT INTO ogrenciler VALUES (68, 'Fikret Yavuz', 10, 9);

CREATE TABLE ogretmenler (
    ogrt_id INT PRIMARY KEY,
    ogrt_isim VARCHAR(30),
    ders_id INT
);

INSERT INTO ogretmenler VALUES (101, 'Adem Alan', 6);
INSERT INTO ogretmenler VALUES (102, 'Filiz Denge', 2);
INSERT INTO ogretmenler VALUES (103, 'Gülşen Başar', 3);
INSERT INTO ogretmenler VALUES (104, 'Osman Kok', 4);
INSERT INTO ogretmenler VALUES (105, 'Mustafa Altın', 8);
INSERT INTO ogretmenler VALUES (106, 'Mine Mutlu', 1);
INSERT INTO ogretmenler VALUES (107, 'Hale Haktan', 5);

CREATE TABLE dersler (
    ders_id INT PRIMARY KEY,
    ders_isim VARCHAR(30),
    ders_saati INT
);

INSERT INTO dersler VALUES (1, 'Matematik', 8);
INSERT INTO dersler VALUES (2, 'Fizik', 6);
INSERT INTO dersler VALUES (3, 'Kimya', 6);
INSERT INTO dersler VALUES (4, 'Biyoloji', 4);
INSERT INTO dersler VALUES (5, 'Edebiyat', 4);
INSERT INTO dersler VALUES (6, 'Coğrafya', 2);
INSERT INTO dersler VALUES (7, 'Tarih', 2);

--1 - tüm dersleri ve varsa bu dersleri alan ogrencilerin isimlerini listeleyiniz.
--esas tablomuz nedir
--dersler
--ders isimleri ve ogr isimleri

select ders_isim,ogr_isim 
from dersler
left join ogrenciler
on dersler.ders_id=ogrenciler.ders_id;

--2- tüm ogrencileri ve varsa bu ogrencilerin aldıkları dersleri listeleyiniz.
--esas tablomuz nedir
--ogrenciler

select ogr_isim,ders_isim
from dersler
right join ogrenciler
on dersler.ders_id=ogrenciler.ders_id;

--3- tüm öğretmenleri ve varsa bu ogretmenlerin derslerini listeleyiniz
--esas tablomuz nedir
--ogretmenler

select ogrt_isim,ders_isim
from ogretmenler
left join dersler
on dersler.ders_id=ogretmenler.ders_id;

--4 - tüm dersleri ve varsa bu derslerin ogretmenlerini listeleyiniz

select ders_isim,ogrt_isim
from dersler
left join ogretmenler
on dersler.ders_id=ogretmenler.ders_id;

--5 tüm ogretmenleri ve varsa bu ogretmenlerin verdiği dersi alan ogrencilerin isimlerini

select ogrt_isim,ogr_isim
from ogretmenler
left join ogrenciler
on ogrenciler.ders_id=ogretmenler.ders_id;

--6 ogrenciler tablosundaki ogrencilerden sadece
--derlser tablosundaki derslerden herhangi birini
--alan ogrenci isimlerini listeleyiniz.

select ogr_isim,ders_isim
from ogrenciler
inner join dersler
on ogrenciler.ders_id=dersler.ders_id;

--7 tüm dersleri ve tüm ogr isimlerini listeleyiniz

select ogr_isim,ders_isim
from ogrenciler
full join dersler
on ogrenciler.ders_id=dersler.ders_id;

-----------------------------------------------------

CREATE TABLE musteriler (
    id INT PRIMARY KEY,
    isim VARCHAR(50),
    sehir VARCHAR(50),
    yas INT
);

INSERT INTO musteriler VALUES (100, 'Ahmet Ümit', 'İstanbul', 54);
INSERT INTO musteriler VALUES (101, 'R. Nuri Güntekin', 'Antalya', 18);
INSERT INTO musteriler VALUES (102, 'S. Faik Abasıyanık', 'Bursa', 14);
INSERT INTO musteriler VALUES (103, 'Yasar Kemal', 'İstanbul', 26);
INSERT INTO musteriler VALUES (104, 'Halide E. Adıvar', 'İzmir', 35);
INSERT INTO musteriler VALUES (105, 'Nazan Bekiroğlu', 'İzmir', 42);
INSERT INTO musteriler VALUES (106, 'Peyami Safa', 'Antalya', 33);
INSERT INTO musteriler VALUES (107, 'Sabahattin Ali', 'İstanbul', 41);
INSERT INTO musteriler VALUES (108, 'Oğuz Atay', 'İstanbul', 28);
INSERT INTO musteriler VALUES (109, 'Orhan Pamuk', 'Ankara', 30);
INSERT INTO musteriler VALUES (110, 'Elif Şafak', 'Bursa', 27);
INSERT INTO musteriler VALUES (111, 'Kemal Tahir', 'İzmir', 29);

CREATE TABLE siparisler (
    id INT,
    musteri_id INT,
    urun_adi VARCHAR(50),
    tutar INT
);

INSERT INTO siparisler VALUES (3002, 101, 'roman', 230);
INSERT INTO siparisler VALUES (3004, 102, 'tukenmez kalem', 80);
INSERT INTO siparisler VALUES (3006, 109, 'sırt çantası', 440);
INSERT INTO siparisler VALUES (3008, 103, 'kurşun kalem', 75);
INSERT INTO siparisler VALUES (3009, 105, 'çizgili defter', 250);
INSERT INTO siparisler VALUES (3010, 108, 'kol çantası', 300);
INSERT INTO siparisler VALUES (3011, 106, 'masal kitabı', 175);
INSERT INTO siparisler VALUES (3013, 107, 'kareli defter', 145);
INSERT INTO siparisler VALUES (3001, 111, 'matematik kitabı', 500);
INSERT INTO siparisler VALUES (3003, 130, 'çizgisiz defter', 145);

--1 musteriler tablosundaki sehri istanbul olan veriler ya da yasi
--30dan büyük olan verilerin isimlerini listeleyiniz

select isim from musteriler
where sehir='Istanbul' or yas>30;

--union * 2.yol

select isim from musteriler where sehir='Istanbul'
union
select isim from musteriler where yas>30

--2 musteriler tablosunda id degeri 105ten kucuk olan verilerin isimlerini
--ve yasi 20 ile 30 arasında olan verilerin sehirlerini listeleyiniz.

select isim from musteriler where id<105
union
select sehir from musteriler where yas between 20 and 30

--3 süparisler tabloundaki k ile baslyan urunlerin urun adi ve musteri_idleri ile
--musteriler tablosundaki ismi o ile baslayan verilerin isim ve idlerini lsiteleyiniz.

select urun_adi,musteri_id
from siparisler
where urun_adi
like 'k%'
union
select isim,id
from musteriler
where isim
like 'O%'

--4 musteriler tablosundaki verilerdem yası en buyuk
--3. ve 6. verilerin bilgilerini listeleyiniz.

select * from musteriler order by yas desc;

(select * from musteriler order by yas desc offset 2 limit 1)
union
(select * from musteriler order by yas desc offset 5 limit 1);

--5 musteriler tablosundaki yası 30dan kucuk olan verilerin id ve sehileri ile
--siparisler tablosundan tutarı 250den büyük olan verilerin id ve urun_adilerin listeleriniz

select id,sehir from musteriler where yas<30
union
select id,urun_adi from siparisler where tutar>250;

--6 musteriler tablosundaki sehir ismi I ile baslayan sehirlerin isimlerini ve
-- yas degeri 30dan cok olan verilerin isimlerini tekrarlı olacak sekilde listeleyiniz
--tekrarlı olacak sekilde kullanmak istiyorsam union all kullanırım

select isim from musteriler where sehir like 'İ%'
union all 
select isim from musteriler where yas>30;
--union tekrarsız listeleme yapar

--7 musteriler tablosundalk sehri izmir olan verilerin idleri ile
--siparisler tablosundaki urun_adi cizgili defter oaln verilerin musteri_idlerinin
--kesimlerini(ortak olanları) bulunuz

select id as ortak_id from musteriler where sehir='İzmir'
intersect --kesimleri bulur
select musteri_id as ortak_id from siparisler where urun_adi='çizgili defter'

--8 musteriler tablosundalk sehri İstanbul veya Ankara olan verilerin idlerinin
--siparisler tablosundaki idsi 3010dan buyuk olan verilerin musteri_idlerinden
--farklı olanları bulunuz

select id from musteriler where sehir in ('İstanbul','Ankara')
except --ilk sorgudan ikinciyi çıkarır -- sıra önemlidir
select musteri_id from siparisler where id>3010

