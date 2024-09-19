
create table ogrenciler(
id int primary key,
isim varchar(50),
adres varchar(50),
sinav_not int 
);

-- Tabloma veri ekleme
insert into ogrenciler values(1,'Betül Kuyucu','Istanbul',80);
insert into ogrenciler(id,isim,adres,sinav_not) values
                       (2, 'Zeki Bey', 'İzmir', 90),
                       (3, 'Cemal Doğan', 'Trabzon', 65),
                       (4, 'Miraç', 'Bursa', 45),
                       (5, 'Yavuz Bal', 'Antalya', 55);

INSERT INTO ogrenciler (id,isim,sinav_not) values
		(6,'Bilal Degirmen',95),
		(7,'Fahri Ersoz',92);
					   

select * from ogrenciler

--soru 1: ogrenciler tablosundaki id ve isim bilgileri ile tüm recordları getirelim

select id,isim from ogrenciler

select (id,isim) from ogrenciler --tek bir sutunda ikisini getirir


--soru 2:sınav notu 80den buyuk olan ogrencilerin tüm bilgilerini getirelim

select * from ogrenciler where sinav_not>80

--Soru3: Adresi İzmir olan ogrenciler tum bilgilerini listele

select * from ogrenciler where adres='İzmir'

--Soru4: Sinav notu 80 ve adresi İzmir olan ogrenci ismini listele

select isim from ogrenciler where sinav_not>80 and adres='İzmir'

--Bolum5: Sinav notu 55 veya 100 olan ogrencilerin tüm bilgilerini listele

select * from ogrenciler where sinav_not=55 or sinav_not=80

--Daha matıklı yolu

select * from ogrenciler where sinav_not in (55,80)

-- Sinav notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele

select * from ogrenciler where sinav_not between 65 and 85

-- SORU7: id'si 3 ve 5 arasinda olmayan ogrencilerin isim ve sinav notu listele

select isim,sinav_not from ogrenciler where id not between 3 and 5

-- SORU8: En yuksek sinav puani nedir

select max(sinav_not) from ogrenciler

-- SORU9: İzmir'de yaşayan ve sınav notu 50'den yuksek olan öğrencilerin listesi:

select * from ogrenciler where  adres='İzmir' and sinav_not>50

-- SORU10: Öğrenci sayısı ve ortalama sınav notu:

select count(*),avg(sinav_not) from ogrenciler

select count(*),round(avg(sinav_not),1) from ogrenciler--virgülsüz

-- SORU11: sinav_notu 52 olan satiri siliniz
delete from ogrenciler where sinav_not=55

-- SORU12: ismi Derya Soylu veya Yavuz Bal olan satirlari siliniz
delete from ogrenciler where isim ='Derya Soylu' or isim='Yavuz Bal'
delete from ogrenciler where isim in ('Derya Soylu','Yavuz Bal') 

--Soru13 : Ogrenciler tablosunun iceriğini siliniz
delete from ogrenciler;
truncate table ogrenciler; 

--Ogrenciler tablosunu siliniz
drop table ogrenciler;



