# MYO SQL Alıştırma Veri Seti

**Öğrenci İşleri örnek veritabanı ve sonuç tablolu 26 SQL alıştırması**

Bu depo, meslek yüksekokullarında (MYO) veritabanı ve SQL öğretimi için hazırlanmış küçük, Türkçe bir örnek veritabanı ile ona bağlı alıştırmaları içerir. Bütün sorular aynı veri seti üzerinden ilerler. Her sorunun çözümünde **soru → sorgu → çıkması gereken sonuç tablosu** verilir, böylece öğrenci kendi sonucunu doğrudan karşılaştırabilir.

Bayburt Üniversitesi Teknik Bilimler MYO, Bilgisayar Programcılığı ve Sağlık Bilgi Sistemleri Teknikerliği programlarındaki Görsel Programlama II (C# ile veritabanı uygulamaları) dersi için hazırlanmıştır.

## İçerik

| Dosya | Ne işe yarar |
|---|---|
| [`veritabani/ogrenci_isleri.sql`](veritabani/ogrenci_isleri.sql) | Veritabanını, 4 tabloyu ve örnek verileri oluşturan SQL Server betiği |
| [`ALISTIRMALAR.md`](ALISTIRMALAR.md) | Sadece sorular (öğrenciye verilecek kısım) |
| [`COZUMLER.md`](COZUMLER.md) | Her sorunun sorgusu, kısa açıklaması ve sonuç tablosu |

## Veritabanı

```
Bolumler (BolumID, BolumAdi)
Ogrenciler (OgrenciID, Ad, Soyad, BolumID → Bolumler, Sinif, Sehir, DogumYili)
Dersler (DersID, DersAdi, Kredi, BolumID → Bolumler)
Notlar (NotID, OgrenciID → Ogrenciler, DersID → Dersler, Vize, Final)
```

Veriler bilerek bazı "tuzaklar" içerir: şehri boş (`NULL`) bir öğrenci, bölüme yerleşmemiş bir öğrenci, hiç öğrencisi olmayan bir bölüm ve hiç notu olmayan bir öğrenci. Böylece `IS NULL`, `INNER JOIN` ile `LEFT JOIN` arasındaki fark ve `COUNT(*)` ile `COUNT(sütun)` arasındaki fark gerçek sonuçlarla görülebilir.

Tüm adlar ve notlar uydurmadır, gerçek kişilerle ilgisi yoktur.

## Kapsanan konular

1. Temel seçme: `SELECT`, `DISTINCT`
2. Filtreleme: `WHERE`, `AND`, `IN`, `BETWEEN`, `LIKE`, `IS NULL`
3. Sıralama ve hesaplanan sütunlar: `ORDER BY`, `AS`
4. Toplama fonksiyonları ve gruplama: `COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING`
5. Tablo birleştirme: `INNER JOIN`, `LEFT JOIN`, üç tablolu birleştirme
6. Alt sorgular

## Kullanım

1. SQL Server Management Studio'yu (veya Visual Studio'da SQL Server Object Explorer'ı) açın.
2. `veritabani/ogrenci_isleri.sql` dosyasını açıp çalıştırın (F5).
3. `ALISTIRMALAR.md` dosyasındaki soruları sırayla çözün, sonucunuzu `COZUMLER.md` ile karşılaştırın.

Sorgular standart SQL'e yakın yazıldığı için küçük değişikliklerle (`N'...'` önekini kaldırmak gibi) MySQL, PostgreSQL ve SQLite'ta da çalışır. Çözümlerdeki sonuç tabloları sorgular gerçekten çalıştırılarak üretilmiştir.

## Atıf

Bu materyali ders, kitap veya yayında kullanırsanız lütfen kaynak gösterin. GitHub sayfasının sağındaki **"Cite this repository"** bağlantısı hazır atıf metni verir.

## Lisans

[Creative Commons Attribution 4.0 International (CC BY 4.0)](LICENSE). Kaynak göstermek şartıyla kopyalanabilir, değiştirilebilir ve ticari dahil her amaçla kullanılabilir.

## Hazırlayan

Öğr. Gör. Muhammet İkbal YILDIZ, Bayburt Üniversitesi, Teknik Bilimler MYO, Bilgisayar Teknolojileri Bölümü
mikbalyildiz@bayburt.edu.tr

---

*English summary: A small Turkish-language sample database ("Student Affairs") for Microsoft SQL Server with 26 graded SQL exercises (SELECT, WHERE, ORDER BY, aggregates, GROUP BY/HAVING, JOINs, subqueries). Every solution shows the question, the query and the exact expected result table. Prepared for vocational school (MYO) database courses. Licensed under CC BY 4.0.*
