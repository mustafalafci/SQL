/*************************************************************
******************* ON-DELETE-CASCADE  **********************
*************************************************************

CHILD TABLODA ON DELETE CASCADE KOMUTU YAZILMAZSA

1-) Child tablo silinmeden Parent tablo silinmeye calisildiginda 
        PgAdmin Eror verir. Yani Child tablo silinmeden Parent 
        tablo silinemez
		
2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye 
        calisildiginda Pg Admin Eror verir. yani Child tablodaki 
        veri silinmeden Parent tablodaki veri silinemez
		
CHILD TABLODA ON DELETE CASCADE KOMUTU YAZILIRSA

1-) Child tablo silinmeden Parent tablo silinebilir.
    PgAdmin Eror vermez
	
2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye 
        calisildiginda PgAdmin Eror vermez  Parent tablodaki veriyi 
        siler.Fakat bu durumda Child tablodaki veride silinir.
*/

CREATE TABLE parent2
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO parent2 VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent2 VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent2 VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent2 VALUES (104, 'Apple', 'Mick Jackson') ;

CREATE TABLE child2
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY (ted_vergino) REFERENCES parent2(vergi_no)
ON DELETE CASCADE   
);

-- SORU-1 : parent2 tablosundaki tum verileri siliniz

delete from parent2
select * from parent2

select * from child2;

-- SORU-2 : Parent2 tablosunu silinz

drop table parent2;--Önce child i sil sonra parenti sil diyor

drop table parent2 cascade;--Bunun childi var hala silmek istiyormusun diye soruyor eminsen cascade yaz diyor

drop table child2;-- Artık parent i olmadığı için kolaylıkla siler

CREATE TABLE toptancilar
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);

INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen'); 
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203,'Erikson', 'Mehmet Gör'); 
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');

CREATE TABLE malzemeler  --> child
(
ted_vergino int,
malzeme_id int,
malzeme_isim VARCHAR(20),
musteri_isim VARCHAR(25),
CONSTRAINT FK FOREIGN KEY (ted_vergino) REFERENCES toptancilar (vergi_no) on delete cascade
);


INSERT INTO malzemeler VALUES (201, 1001, 'Laptop', 'Asli Can'); 
INSERT INTO malzemeler VALUES (202, 1002, 'Telefon', 'Fatih Ak'); 
INSERT INTO malzemeler VALUES (202, 1003, 'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES (202, 1004, 'Laptop', 'Veli Tan');

--SORU-4: Malzemeler tablosundaki musteri_isim'i Asli Can olan kaydin malzeme_isim'ini, 
--toptancılar tablosunda irtibat_ismi 'Adem Coş' olan kaydin sirket_ismi ile güncelleyiniz.

update malzemeler set malzeme_isim =(select sirket_ismi from toptancilar where irtibat_ismi = 'Adem Coş') where musteri_isim='Asli Can'

--SORU-5: malzeme_ismi Laptop olan kaydin musteri_isim'ini, sirket_ismi Apple'olan toptancinin irtibat_isim'i ile güncelleyiniz.

update malzemeler set musteri_isim=(select irtibat_ismi from toptancilar where sirket_ismi='Apple') where malzeme_isim='Apple'

----------------------------------------------------------------

create table arac ( 
id int,
marka varchar (30),
model varchar(30), 
fiyat int,
kilometre int, 
vites varchar(20)
);
insert into arac values (100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values (101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values (102, 'Honda', 'Civic', 400000, 15000, 'Manuel' );
insert into arac values (103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );  
insert into arac values (104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values (105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values (106, 'Bugatti', 'Veyron', 950008, 5000, 'Otomatik' );

--SORU-6: arac tablosundaki en yüksek fiyat'ı listele

select max(fiyat) from arac

--Soru-7:arac tablosundaki araçları toplam fiyatını bulunuz

select sum(fiyat) toplam_fiyat from arac;

--Soru-8: arac tablosundaki fiyat ortalamalarını bulunuz

select round(avg(fiyat),2) ort_fiyat from arac

--Soru-9: arac tablosunda kaç tane araç olduğunu bulunuz

select count(*) from arac;--İkisi de olur ama en garanti olan budur 

select count(id) from arac;--İkisi de olur ama bu bazı durumlarda bizi yanıltabilir  

-----------------------------------------

CREATE TABLE meslekler
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
soyisin VARCHAR(50), 
meslek CHAR(9), 
maas int
);
INSERT INTO meslekler VALUES (1, 'Ali', 'Can', 'Doktor', '20000' ); 
INSERT INTO meslekler VALUES (2, 'Veli', 'Cem', 'Mühendis', '18000'); 
INSERT INTO meslekler VALUES (3, 'Mine', 'Bulut', 'Avukat', '17008'); 
INSERT INTO meslekler VALUES (4, 'Mahmut', 'Bulut', 'Ögretmen', '15000'); 
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13008'); 
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000'); 
INSERT INTO meslekler VALUES (7, 'Ali', 'Can', 'Marangoz', '10000' ); 
INSERT INTO meslekler VALUES (8, 'Veli', 'Cem', 'Tekniker', '14000');

--Soru-10: meslekler tablosunu isime göre sıralayınız

select * from meslekler order by isim --İsme göre sıraladık a-z

--Soru-11: meslekler tablosunda maaşı büyükten küçüğe doğru sıralayınız

select * from meslekler order by maas desc --Maaşı büyükten küçüğe doğru sıralayınız

--Not: Eğer desc yazmassak küçükten büyüğe sıralar !!!!

--Soru-12: meslekler tablosunda ismi Ali olanları maaşı büyükten küçüğe doğru sıralayınız

select * from meslekler 
where isim='Ali' 
order by isim desc

--Soru-13: meslekler tablosunda id değeri 5 ten büyük olan ilk iki veriyi listeleyiniz

select * from meslekler where id>5 limit 2; --kaç tane görünmesini istiyorsak ona göre limit kullanırız

--Soru-14: meslekler tablosunda maaşı en yüksek 3 kişinin bilgilerini getiriniz

select * from meslekler 
order by maas desc 
limit 3;

--küçükten büyüğe "asc" kullanılır,
--büyükten küçüğe "desc"





