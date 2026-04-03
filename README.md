# NovaStore SQL Veritabanı Yönetim Sistemi

## 📌 Proje Hakkında
NovaStore, e-ticaret platformu için geliştirilmiş bir **SQL veritabanı yönetim sistemi**dir.  
Ürün, müşteri ve sipariş yönetimini kapsayan ilişkisel veritabanı tasarımı yapılmıştır.

## 🛠️ Kullanılan Teknolojiler
- Microsoft SQL Server
- T-SQL (DDL, DML, JOIN, VIEW, BACKUP/RESTORE)

## 📂 Veritabanı Yapısı
- **Category**: Ürün kategorileri
- **Products**: Ürün bilgileri (isim, fiyat, stok, kategori)
- **Customers**: Müşteri detayları (isim, şehir, e-posta)
- **Orders**: Siparişler (tarih, müşteri, toplam tutar)
- **OrdersDetails**: Sipariş detayları (ürün, miktar)

## 🔍 Örnek Sorgular
- Stok kontrolü: `select ProductName, Stock from Products where Stock < 20 order by Stock desc;`
- Müşteri-Sipariş raporu: JOIN ile müşteri ve sipariş ilişkisi
- Kategori bazlı ürün sayısı ve toplam ciro hesaplamaları
- Siparişlerin geçen gün sayısını hesaplayan raporlar

## 📊 İleri Seviye Özellikler
- View oluşturma: `vw_SiparisOze`
- Veritabanı yedekleme ve geri yükleme işlemleri

## 🎯 Sonuç
Bu proje, gerçek bir e-ticaret senaryosunu simüle ederek **performans optimizasyonu** ve **veri bütünlüğü** sağlamaktadır.
