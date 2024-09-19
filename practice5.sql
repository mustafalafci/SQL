CREATE TABLE filmler (
    film_id INT,
    film_name VARCHAR(30),
    category VARCHAR(30)
);

INSERT INTO filmler VALUES (1, 'Eyvah Eyvah', 'Komedi');
INSERT INTO filmler VALUES (2, 'Kurtlar Vadisi', 'Aksiyon');
INSERT INTO filmler VALUES (3, 'Eltilerin Savaşı','Komedi');
INSERT INTO filmler VALUES (4, 'Aile Arasında', 'Komedi');
INSERT INTO filmler VALUES (5, 'GORA', 'Bilim Kurgu');
INSERT INTO filmler VALUES (6, 'Organize İşler', 'Komedi');
INSERT INTO filmler VALUES (7, 'Babam ve Oğlum', 'Dram');

SELECT * FROM filmler;

CREATE TABLE aktorler (
    id INT,
    actor_name VARCHAR(30),
    film_id INT
);

INSERT INTO aktorler VALUES (1, 'Ata Demirer', 1);
INSERT INTO aktorler VALUES (2, 'Necati Sasmaz', 2);
INSERT INTO aktorler VALUES (3, 'Gupse Özay', 3);
INSERT INTO aktorler VALUES (4, 'Engin Günaydın', 4);
INSERT INTO aktorler VALUES (5, 'Cem Yılmaz', 5);

--1- tüm film_name leri,kategorilerini ve filmlerde oynayan aktor_name leri listeleyiniz

select * from filmler 
left join aktorler
on filmler.film_id=aktorler.film_id;

--2- tüm actor_nameleri ve oynadıgı film_nameleri listeleyiniz

select * from aktorler 
left join filmler
on filmler.film_id=aktorler.film_id;

select * from filmler 
right join aktorler
on filmler.film_id=aktorler.film_id;

---------------------------------------------

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO Customers (customer_id, name, email)
VALUES (1, 'Ali', 'ali@gmail.com'),
       (2, 'Ayşe', 'ayse@gmail.com'),
       (3, 'Fatih', 'fatih@gmail.com');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    price DECIMAL(8,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)) 

INSERT INTO Orders (order_id, customer_id, product, price)
VALUES (101, 1, 'Laptop', 2500.00),
       (102, 1, 'Printer', 500.00),
       (103, 2, 'Tablet', 1200.00),
       (104,null, 'Phone', 1500.00),
       (105,null , 'camera', 2000.00);

--1 customer_name o isme ait produst ve price'i
--iner join kullanarak birşetiriniz.

select name,product,price from Customers
inner join Orders
on Customers.customer_id=Orders.customer_id

delete from Orders;

--2 customer name product ve pricelerin hepsini getiriniz.
select name,product,price 
from customers 
full join orders 
on Customers.customer_id=Orders.customer_id

-------------------------------------------------------

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT
);

INSERT INTO Employees (employee_id, name, department, manager_id)
VALUES (1, 'Ali', 'IT', 2),
       (2, 'Ayşe', 'IT', NULL),
       (3, 'Fatih', 'Marketing', 4),
       (4, 'Mehmet', 'Marketing', NULL),
       (5, 'Elif', 'DEV',1);

select * from Employees

-- 1 inner join kullanarak employee_id ve manager_name leri gösteriniz

select A.name as Çalışan,B.name as Yönetici 
from Employees as A
inner join Employees as B
on A.manager_id = B.employee_id

------------------------------------

CREATE TABLE ogrenciler (
    id INT,
    isim VARCHAR(50),
    sehir VARCHAR(50),
    puan INT,
    bolum VARCHAR(20)
);

INSERT INTO ogrenciler VALUES (100, 'Ahmet Ümit', 'İstanbul', 546, 'Bilgisayar');
INSERT INTO ogrenciler VALUES (101, 'R.Nuri Güntekin', 'Antalya', 486, 'İşletme');
INSERT INTO ogrenciler VALUES (102, 'S. Faik Abasıyanık', 'Bursa', 554, 'Bilgisayar');
INSERT INTO ogrenciler VALUES (103, 'Yaşar Kemal', 'İstanbul', 501, 'Matematik');
INSERT INTO ogrenciler VALUES (104, 'Halide E. Adıvar', 'İzmir', 473, 'Psikoloji');
INSERT INTO ogrenciler VALUES (105, 'Nazan Bekiroğlu', 'İzmir', 432, 'Edebiyat');
INSERT INTO ogrenciler VALUES (106, 'Peyami Safa', 'Antalya', 535, 'Bilgisayar');
INSERT INTO ogrenciler VALUES (107, 'Sabahattin Ali', 'İstanbul', 492, 'Matematik');

-- 1 : isimleri 'A' harfi ile başlayan ogrencilerin bilgilerini getirin.

Select * from ogrenciler
where isim like 'A%'

--2 : isimleri 'i' harfi ile biten öğrencilerin bilgilerini getirin.

Select * from ogrenciler
where isim like '%i'

--3 : isimleri 'a' harfi ile baslayan ve 'Bilgisayar' bölümünde okuyan öğrencilerin bilgilerini getirin.

select * from ogrenciler
where isim like 'A%' and bolum='Bilgisayar'

--4 : isimleri 'n' harfi içeren ogrencileri getirin

select * from ogrenciler
where isim Ilike '%n%'

--5 : isimleri 'A' ile baslamayan ogrencileri getirin

select * from ogrenciler
where isim not Ilike 'a%'

--6 : isimleri 12 karakterden daha uzun olan ogrencileri getirin.

select * from ogrenciler
where length(isim)>12;

--7 : 4.harfi a olan ogrenci bilgilerini getirin.

select * from ogrenciler
where isim like '___a%'

--8 : isminin içinde z veya k harfi içeren ogrencileri getirin

select * from ogrenciler
where isim like '%z%' or isim like '%k%';

--2.Yol

select * from ogrenciler
where isim ~ '[zk]';

--9 : ismi Y neya N le baslayan ogrenci bilgilerini getir

select * from ogrenciler
where isim like 'Y%' or isim like 'N%';

--2.Yol

select * from ogrenciler
where isim ~ '^[YN]';

