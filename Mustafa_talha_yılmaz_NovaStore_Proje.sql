
--Katogori bölümü
create table Category(
	CategoryID int identity(1,1) primary key,
	CatagoryName nvarchar(50) not null,--Katagori ismi
)
--Ürünler Bölümü 
create table Products(
	ProductID int identity(1,1) primary key,
	ProductName nvarchar(100) not null,--Ürün Ýsmi
	Price decimal(10,2) not null,--Ürün fiyatý
	Stock int default 0 not null,--Stok degeri
	CategoryID INT not NULL,--fk
	CONSTRAINT FK_Products_Category
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
)
--Müþteri Detaylarý
create table Customers(
	CustomerID int identity(1,1) primary key,
	FullName nvarchar(50),--Müþteri tam ismi
	City nvarchar(30),--Müþterilerin þehiri
	Email nvarchar(100) unique,--Müþterilerin maili
)
--Sipariþler
create table Orders(
	OrderID int identity(1,1) primary key,
	OrderDate DATETIME NOT NULL DEFAULT GETDATE(),--Sipariþ ettigi tarih
	TotalAmount decimal(10,2),-- Sipariþ toplam tutarý (hesaplanabilir)
	CustomerID int not null,--Kim hangi sipariþi yapmýþ kontrol için fk kullanýyorum
	constraint fk_ordes_customers 
	foreign key(CustomerID) references Customers(CustomerID)
)
--Sipariþ Detaylarý Bölümü
create table OrdersDetails(
	DetailID int identity(1,1) primary key,
	OrderID int not null,-- Hangi sipariþe ait
	Quantity int not null, --  Satýlan Ürün adedi(Miktar)
	constraint fk_OrdersDetails_Orders foreign key(OrderID) references Orders(OrderID),
	ProductID int not null, -- Hangi ürün
	constraint fk_OrdersDetails_Products foreign key(ProductID) references Products(ProductID),
)

--Veri Giriþi Yapýyorum DMl
insert into Category (CatagoryName) Values ('Elektronik'),('Giyim'),('Kitap'),('Kozmetik'),('Ev'),('Yaþam')

insert into Products (ProductName,Price,Stock,CategoryID) values 
('Telefon', 18000.00, 15, 1),
('Tablet', 12000.00, 8, 1),
('Akýllý Saat', 7500.00, 20, 1),
('Bluetooth Kulaklýk', 1500.00, 30, 1),
('Mouse', 500.00, 50, 1),
('Klavye', 900.00, 40, 1),
('Monitör', 6000.00, 12, 1),
('Yazýcý', 3500.00, 9, 1),
('Harici Disk', 2200.00, 25, 1),
('Powerbank', 800.00, 35, 1),
('Webcam', 1100.00, 18, 1),
('Router', 2000.00, 14, 1);


insert into Products (ProductName,Price,Stock,CategoryID) values
('Tiþört', 350.00, 50, 2),
('Kot Pantolon', 900.00, 30, 2),
('Ceket', 1500.00, 20, 2),
('Sweatshirt', 750.00, 35, 2),
('Elbise', 1200.00, 18, 2),
('Etek', 600.00, 25, 2),
('Gömlek', 500.00, 40, 2),
('Mont', 2500.00, 12, 2),
('Þort', 400.00, 28, 2),
('Eþofman Altý', 650.00, 22, 2),
('Kazak', 800.00, 27, 2),
('Bluz', 450.00, 33, 2),
('Pijama Takýmý', 700.00, 19, 2);

insert into Products(ProductName,Price,Stock,CategoryID) values
('Suç ve Ceza', 120.00, 40, 3),
('1984', 95.00, 35, 3),
('Simyacý', 85.00, 25, 3),
('Kürk Mantolu Madonna', 110.00, 20, 3),
('Sefiller', 150.00, 18, 3),
('Beyaz Zambaklar Ülkesinde', 90.00, 22, 3),
('Nutuk', 200.00, 15, 3),
('Þeker Portakalý', 80.00, 30, 3),
('Hayvan Çiftliði', 75.00, 28, 3),
('Ýnce Memed', 140.00, 17, 3),
('Dönüþüm', 70.00, 33, 3),
('Yeraltýndan Notlar', 100.00, 19, 3),
('Uçurtma Avcýsý', 130.00, 21, 3);


insert into Products(ProductName,Price,Stock,CategoryID) values
('Parfüm', 950.00, 18, 4),
('Ruj', 250.00, 60, 4),
('Fondöten', 400.00, 22, 4),
('Þampuan', 180.00, 45, 4),
('Saç Kremi', 170.00, 38, 4),
('Yüz Temizleme Jeli', 220.00, 27, 4),
('Güneþ Kremi', 300.00, 19, 4),
('Maskara', 280.00, 34, 4),
('Allýk', 260.00, 29, 4),
('Oje', 90.00, 70, 4),
('Dudak Balmý', 120.00, 41, 4),
('Vücut Losyonu', 210.00, 26, 4),
('Makyaj Temizleme Suyu', 240.00, 23, 4);

insert into Products(ProductName,Price,Stock,CategoryID) values
('Yemek Masasý', 8500.00, 5, 5),
('Sandalye', 1200.00, 20, 5),
('Koltuk Takýmý', 25000.00, 3, 5),
('Sehpa', 1800.00, 12, 5),
('Halý', 3500.00, 8, 5),
('Perde', 900.00, 25, 5),
('Avize', 2200.00, 10, 5),
('Kitaplýk', 4000.00, 6, 5),
('Gardýrop', 15000.00, 4, 5),
('Çalýþma Masasý', 5000.00, 7, 5),
('Mutfak Dolabý', 20000.00, 2, 5),
('Ayna', 750.00, 18, 5),
('Dekoratif Lamba', 1300.00, 14, 5);

insert into Products(ProductName,Price,Stock,CategoryID) values
('Yoga Matý', 450.00, 30, 6),
('Termos', 300.00, 25, 6),
('Su Matarasý', 150.00, 40, 6),
('Sýrt Çantasý', 900.00, 18, 6),
('Valiz', 2500.00, 10, 6),
('Kamp Sandalyesi', 700.00, 15, 6),
('Kamp Çadýrý', 3500.00, 6, 6),
('Bisiklet Kaský', 800.00, 12, 6),
('Koþu Ayakkabýsý', 1800.00, 20, 6),
('Akýllý Bileklik', 1200.00, 14, 6),
('Masa Oyunu', 600.00, 22, 6),
('Kitap Okuma Lambasý', 500.00, 19, 6),
('Meditasyon Minderi', 650.00, 17, 6);

insert into Customers (FullName,City,Email) values
('Sefa Esen','Afyon','s@gmail.com'),
('Kenan Dogulu','Ankara','k@gmail.com'),
('Þebnem Ferah','Bursa','þ@gmail.com'),
('Murat Boz','Ýstanbul','m@gmail.com'),
('Ece Seçkin','Bursa','e@gmail.com'),
('Volkan konak','istanbul','v@gmail.com');

insert into Orders(CustomerID,OrderDate) values
(1, '2026-01-01'),
(2, '2026-01-03'),
(3, '2026-01-05'),
(1, '2026-01-08'),
(4, '2026-01-10'),
(2, '2026-01-12'),
(5, '2026-01-15'),
(3, '2026-01-18'),
(6, '2026-01-22'),
(4, '2026-01-25');


insert into OrdersDetails(OrderID,ProductID,Quantity) values
(1, 5, 2),
(1, 8, 1),
(2, 3, 1),
(3, 10, 4),
(4, 15, 2),
(5, 20, 1),
(6, 7, 3),
(7, 12, 1),
(8, 18, 2);





select ProductName,Stock from Products where Stock < 20 order by stock desc;

select c.FullName,o.OrderDate,c.City,o.TotalAmount from Customers c inner join Orders o on  c.CustomerID=o.CustomerID

select c.FullName,ca.CatagoryName,p.ProductName,p.Price from Customers c join Orders o on c.CustomerID=o.CustomerID join OrdersDetails od on o.OrderID=od.OrderID join Products p on od.ProductID=p.ProductID join Category ca on p.CategoryID=ca.CategoryID where c.FullName = 'Mustafa Yýlmaz'

select c.CatagoryName,count(p.ProductID) as toplam_ürün from Category c left join Products p on c.CategoryID=p.CategoryID group by c.CatagoryName order by toplam_ürün desc;

select c.FullName,sum(od.quantity*p.Price) as toplam_ciro from Customers c join Orders o on c.CustomerID=o.CustomerID join OrdersDetails od on o.OrderID=od.OrderID join Products p on od.ProductID=p.ProductID group by FullName order by toplam_ciro desc;

select c.FullName,o.OrderID,o.OrderDate,Datediff(day,o.OrderDate,GETDATE()) as gecen_gün from Orders o join Customers c on o.CustomerID=c.CustomerID order by gecen_gün desc








create view vw_SiparisOze as select c.FullName,o.OrderDate,p.ProductName,p.Stock from Customers c join Orders o on c.CustomerID=o.CustomerID join OrdersDetails od on o.OrderID=od.OrderID join  Products p on od.ProductID=p.ProductID


backup database NovaStore to disk='C:\Backup\NovaStore_20260215.bak'


RESTORE DATABASE NovaStore FROM DISK = 'C:\Backup\NovaStore_20260215.bak' 