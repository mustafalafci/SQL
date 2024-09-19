CREATE TABLE sirketler (
    sirket_id INT PRIMARY KEY,
    sirket_ismi VARCHAR(50),
    memur_sayisi INT
);

INSERT INTO sirketler (sirket_id, sirket_ismi, memur_sayisi)
VALUES (100, 'Nokia', 1000),
(101, 'iPhone', 900),
(102, 'Samsung', 1200),
(103, 'Xiaomi', 1500);

--1- samsungun memurlar sayisini en yüksek memurlar sayisi değerine esiyleyiniz
update sirketler set memur_sayisi=(select max(memur_sayisi) from sirketler) where sirket_ismi='Samsung'
select * from sirketler;
--subquery'si select max(memur_sayisi) from sirketler

--2- Nokia sirketinin memurlar sayisi değerini en düşük memurlar sayisi değerinin 1.5 katina esitleyiniz

--subquery select min(memur_sayisi)

update sirketler set memur_sayisi=(select min(memur_sayisi)*1.5 from sirketler) where sirket_ismi='Nokia'

--iphonenun memurlar sayisini nokia ve xiaomi sirketlerinin memurlar sayisinin toplamına esitleyiniz.
--subquery'si select sum(memur_sayisi) from sirketler in ('Nokia',Xiaomi)

update sirketler set memur_sayisi=(select sum(memur_sayisi) from sirketler where sirket_ismi in ('Nokia','Xiaomi')) where sirket_ismi='iPhone'

--4- ortalama memurlar sayisi degerinden düsük olan memurlarin  memur_sayisi degerlerini 400 arttırın
--subquerysi select avg(memur_sayisi) from sirketler
update sirketler set memur_sayisi=memur_sayisi+400 
where memur_sayisi<(select avg(memur_sayisi) from sirketler);

---------------------------------------------------------

CREATE TABLE memurlar (
    memurlar_id INT PRIMARY KEY,
    ad VARCHAR(100),
    sehir VARCHAR(50),
    sirket_ismi VARCHAR(100),
    calisma_performanslari VARCHAR(255)
);

INSERT INTO memurlar (memurlar_id, ad, sehir, sirket_ismi, calisma_performanslari)
VALUES
(100, 'Ali Yılmaz', 'Ankara', 'Samsung', 'Ortalama 67'),
(101, 'Ayşe Demir', 'İstanbul', 'iPhone', 'Ortalama 72'),
(102, 'Mehmet Kaya', 'İzmir', 'xiaomi', 'Ortalama 55'),
(103, 'Ahmet Kısaçık', 'Bursa', 'Nokia', 'Ortalama 98'),
(104, 'Ahmet Kadir', 'Ankara', 'Nokia', 'Ortalama 92.5'),
(105, 'Fatma Güzel', 'Giresun', 'Samsung', 'Ortalama 92.5'),
(106, 'Furkan Yılmaz', 'İzmir', 'xiaomi', 'Ortalama 99');

select * from memurlar;

--soru 5 memurlar sayisi 2200den çok olan sirketlerin ve 
--bu sirkette calisanların isimlerini ve calisma perfomansini listeleyin

select ad,calisma_performanslari from memurlar 
where memurlar.sirket_ismi in(select sirketler.sirket_ismi from sirketler where memur_sayisi>2200)

--soru 6 Ankara'da sirket olan sirketlerin
--memur id'lerini ve memurlar sayilarini listeleyiniz
select sirket_id,memur_Sayisi from sirketler
where sirket_ismi in (select sirket_ismi from memurlar where sehir='Ankara')

--soru 7 eger giresunda bir tane bile memur varsa tüm sirketleri yazdirin
select * from sirketler where exists(select sirket_ismi from memurlar where sehir='Giresun');












