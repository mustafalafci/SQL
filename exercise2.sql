--SQL Queries-2
--(Select,Where,Delete)

/*
1-musteri tablosundaki tüm kayıtları listeleyiniz.

2-Mesleği AVUKAT olanların sadece şehirlerini listeleyiniz.

3-Kadın müşterilerin tüm bilgilerini listeleyiniz.

4-Kadın müşterilerin sadece şehir bilgilerini listeleyiniz.

5-Yaşı 40-50 arasında olan müşterileri listeleyiniz.

6-Erkek müşterilerin mesleklerini listeleyiniz.

7-Yaşı 40-50 arasında OLMAYAN müşterileri listeleyiniz.

8-Yaşı 30-40 arasında olan KADIN müşterilerden ÖĞRETMENLERİ listeleyiniz.

9-Yaşı 30-40 arasında OLMAYAN ERKEK müşterilerden AVUKAT OLMAYANLARI listeleyiniz.

10-Geliri 3000-5000 arasında olan müşterileri listeleyiniz.

11-ismi ALİ olan kayıtları siliniz.

12-yaşı 60 olan kayıtları siliniz.

13-mesleği 'KUAFÖR' ve cinsiyeti 'K' olan kullanıcıyı siliniz.

14-geliri 6000 olan veya mesleği 'TESİSATÇI' olan kayıtları siliniz. 

15-musteri tablosundaki tüm kayıtları siliniz.
*/

CREATE TABLE musteri (
    id SERIAL PRIMARY KEY,
    isim VARCHAR(50),
    cinsiyet CHAR(1),
    yas INT,
    meslek VARCHAR(50),
    sehir VARCHAR(50),
    gelir DECIMAL(10, 2)
);

INSERT INTO musteri (isim, cinsiyet, yas, meslek, sehir, gelir) VALUES
('Ali', 'E', 45, 'AVUKAT', 'Ankara', 4000),
('Ayşe', 'K', 35, 'ÖĞRETMEN', 'İzmir', 3500),
('Fatma', 'K', 55, 'AVUKAT', 'İstanbul', 5000),
('Mehmet', 'E', 40, 'DOKTOR', 'Ankara', 7000),
('Seda', 'K', 32, 'ÖĞRETMEN', 'Bursa', 3000),
('Veli', 'E', 30, 'TESİSATÇI', 'Antalya', 4500),
('Zeynep', 'K', 28, 'KUAFÖR', 'Adana', 2000),
('Kemal', 'E', 60, 'AVUKAT', 'İstanbul', 5500),
('Esra', 'K', 29, 'MÜHENDİS', 'İzmir', 3200),
('Ahmet', 'E', 65, 'MÜHENDİS', 'İstanbul', 6000);

Select * from musteri;

--2-Mesleği AVUKAT olanların sadece şehirlerini listeleyiniz.
select sehir from musteri where meslek='AVUKAT';

--3-Kadın müşterilerin tüm bilgilerini listeleyiniz.
select * from musteri where cinsiyet='K';

--4-Kadın müşterilerin sadece şehir bilgilerini listeleyiniz.
select sehir from musteri where cinsiyet='K';

--5-Yaşı 40-50 arasında olan müşterileri listeleyiniz.
select * from musteri where yas between 40 and 50;

--6-Erkek müşterilerin mesleklerini listeleyiniz.
select meslek from musteri where cinsiyet='E';

--7-Yaşı 40-50 arasında OLMAYAN müşterileri listeleyiniz.
select * from musteri where yas not between 40 and 50;

--8-Yaşı 30-40 arasında olan KADIN müşterilerden ÖĞRETMENLERİ listeleyiniz.
select * from musteri where yas between 30 and 40 
                      and cinsiyet='K' 
					  and meslek='ÖĞRETMEN';

--9-Yaşı 30-40 arasında OLMAYAN ERKEK müşterilerden AVUKAT OLMAYANLARI listeleyiniz.
select * from musteri where yas not between 30 and 40
                      and cinsiyet='E'
					  and meslek!='AVUKAT'
					  
--10-Geliri 3000-5000 arasında olan müşterileri listeleyiniz.
select * from musteri where gelir between 3000 and 5000;

--11-ismi ALİ olan kayıtları siliniz.
delete from musteri where isim='Ali';

--12-yaşı 60 olan kayıtları siliniz.
delete from musteri where yas=60;

--13-mesleği 'KUAFÖR' ve cinsiyeti 'K' olan kullanıcıyı siliniz.
delete from musteri where meslek='KUAFÖR' and cinsiyet='K';

--14-geliri 6000 olan veya mesleği 'TESİSATÇI' olan kayıtları siliniz.
delete from musteri where gelir=6000 or meslek='TESİSATÇI';

--15-musteri tablosundaki tüm kayıtları siliniz.
delete from musteri;

CREATE TABLE tedarikciler3 (
    id SERIAL PRIMARY KEY,
    tedarikci_isim VARCHAR(50),
    tedarikci_adres VARCHAR(100)
);

INSERT INTO tedarikciler3 (tedarikci_isim, tedarikci_adres) VALUES
('Tedarikçi 1', 'Adres 1'),
('Tedarikçi 2', 'Adres 2'),
('Tedarikçi 3', 'Adres 3');

--16-tedarikciler3 tablosunu SCHEMADAN kaldırınız.
DROP TABLE tedarikciler3 CASCADE;
DROP TABLE IF EXISTS tedarikciler3;

--17-urunler tablosunu SCHEMADAN kaldırınız. 
DROP TABLE urunler;

