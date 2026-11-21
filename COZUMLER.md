# SQL Alıştırmaları — Çözümler ve Sonuç Tabloları

Her soruda sırayla: **soru → sorgu → çıkması gereken sonuç** verilmiştir.
Sorgunuzun sonucu buradaki tabloyla aynıysa doğru yazmışsınız demektir (satır sırası `ORDER BY` yoksa farklı olabilir).
Tablolardaki ondalıklı sayılar 2 basamağa yuvarlanmıştır; SQL Server aynı değeri `82.333333` ya da `76.0` gibi daha uzun gösterebilir.

## 1. Temel Seçme (SELECT)

`SELECT` tablodan hangi sütunları göstereceğimizi, `FROM` hangi tablodan alacağımızı söyler.

### 1. Tüm öğrencileri bütün bilgileriyle listeleyin.

```sql
SELECT *
FROM Ogrenciler;
```

**Sonuç (12 satır):**

| OgrenciID | Ad | Soyad | BolumID | Sinif | Sehir | DogumYili |
|---|---|---|---|---|---|---|
| 1 | Ahmet | Kaya | 1 | 1 | Bayburt | 2006 |
| 2 | Elif | Demir | 1 | 1 | Erzurum | 2005 |
| 3 | Mehmet | Çelik | 1 | 2 | Trabzon | 2004 |
| 4 | Zeynep | Arslan | 1 | 2 | Bayburt | 2005 |
| 5 | Burak | Yılmaz | 1 | 1 | Ankara | 2006 |
| 6 | Ayşe | Şahin | 2 | 1 | Gümüşhane | 2006 |
| 7 | Emre | Koç | 2 | 1 | Bayburt | 2005 |
| 8 | Fatma | Aydın | 2 | 2 | Erzincan | 2004 |
| 9 | Can | Öztürk | 2 | 2 | NULL | 2003 |
| 10 | Selin | Kurt | 1 | 2 | İstanbul | 2004 |
| 11 | Kerem | Aksoy | 2 | 1 | Erzurum | 2006 |
| 12 | Derya | Polat | NULL | 1 | Bayburt | 2006 |

> `*` "bütün sütunlar" demektir.

### 2. Öğrencilerin sadece adını ve soyadını listeleyin.

```sql
SELECT Ad, Soyad
FROM Ogrenciler;
```

**Sonuç (12 satır):**

| Ad | Soyad |
|---|---|
| Ahmet | Kaya |
| Elif | Demir |
| Mehmet | Çelik |
| Zeynep | Arslan |
| Burak | Yılmaz |
| Ayşe | Şahin |
| Emre | Koç |
| Fatma | Aydın |
| Can | Öztürk |
| Selin | Kurt |
| Kerem | Aksoy |
| Derya | Polat |

### 3. Öğrencilerin hangi şehirlerden geldiğini, her şehir bir kez görünecek şekilde listeleyin.

```sql
SELECT DISTINCT Sehir
FROM Ogrenciler
WHERE Sehir IS NOT NULL
ORDER BY Sehir;
```

**Sonuç (7 satır):**

| Sehir |
|---|
| Ankara |
| Bayburt |
| Erzincan |
| Erzurum |
| Gümüşhane |
| Trabzon |
| İstanbul |

> `DISTINCT` tekrar eden satırları teke indirir. Türkçe harfle başlayan değerlerin (İ, Ç, Ş...) sırası SQL Server'ın harmanlama (collation) ayarına göre farklı yerde çıkabilir.


## 2. Filtreleme (WHERE)

`WHERE` sadece şartı sağlayan satırları getirir.

### 4. Birinci sınıftaki öğrencileri listeleyin.

```sql
SELECT OgrenciID, Ad, Soyad, Sinif
FROM Ogrenciler
WHERE Sinif = 1;
```

**Sonuç (7 satır):**

| OgrenciID | Ad | Soyad | Sinif |
|---|---|---|---|
| 1 | Ahmet | Kaya | 1 |
| 2 | Elif | Demir | 1 |
| 5 | Burak | Yılmaz | 1 |
| 6 | Ayşe | Şahin | 1 |
| 7 | Emre | Koç | 1 |
| 11 | Kerem | Aksoy | 1 |
| 12 | Derya | Polat | 1 |

### 5. Bayburtlu öğrencileri listeleyin.

```sql
SELECT Ad, Soyad, Sehir
FROM Ogrenciler
WHERE Sehir = N'Bayburt';
```

**Sonuç (4 satır):**

| Ad | Soyad | Sehir |
|---|---|---|
| Ahmet | Kaya | Bayburt |
| Zeynep | Arslan | Bayburt |
| Emre | Koç | Bayburt |
| Derya | Polat | Bayburt |

> Metin değerleri tek tırnak içinde yazılır; başındaki `N` Türkçe karakterlerin bozulmaması içindir.

### 6. Bilgisayar Programcılığı (BolumID = 1) bölümünde okuyan 2. sınıf öğrencilerini listeleyin.

```sql
SELECT Ad, Soyad
FROM Ogrenciler
WHERE BolumID = 1 AND Sinif = 2;
```

**Sonuç (3 satır):**

| Ad | Soyad |
|---|---|
| Mehmet | Çelik |
| Zeynep | Arslan |
| Selin | Kurt |

> `AND`: iki şart birden sağlanmalı.

### 7. Erzurumlu veya Trabzonlu öğrencileri listeleyin.

```sql
SELECT Ad, Soyad, Sehir
FROM Ogrenciler
WHERE Sehir IN (N'Erzurum', N'Trabzon');
```

**Sonuç (3 satır):**

| Ad | Soyad | Sehir |
|---|---|---|
| Elif | Demir | Erzurum |
| Mehmet | Çelik | Trabzon |
| Kerem | Aksoy | Erzurum |

> `IN (...)`, `Sehir = 'Erzurum' OR Sehir = 'Trabzon'` yazmanın kısa yoludur.

### 8. 2004 ile 2005 yılları arasında (ikisi dahil) doğan öğrencileri listeleyin.

```sql
SELECT Ad, Soyad, DogumYili
FROM Ogrenciler
WHERE DogumYili BETWEEN 2004 AND 2005;
```

**Sonuç (6 satır):**

| Ad | Soyad | DogumYili |
|---|---|---|
| Elif | Demir | 2005 |
| Mehmet | Çelik | 2004 |
| Zeynep | Arslan | 2005 |
| Emre | Koç | 2005 |
| Fatma | Aydın | 2004 |
| Selin | Kurt | 2004 |

> `BETWEEN` iki ucu da dahil eder.

### 9. Adı 'E' harfiyle başlayan öğrencileri listeleyin.

```sql
SELECT Ad, Soyad
FROM Ogrenciler
WHERE Ad LIKE N'E%';
```

**Sonuç (2 satır):**

| Ad | Soyad |
|---|---|
| Elif | Demir |
| Emre | Koç |

> `%` "buradan sonra ne gelirse gelsin" demektir.

### 10. Şehir bilgisi girilmemiş öğrencileri bulun.

```sql
SELECT Ad, Soyad
FROM Ogrenciler
WHERE Sehir IS NULL;
```

**Sonuç (1 satır):**

| Ad | Soyad |
|---|---|
| Can | Öztürk |

> Boş değer `= NULL` ile değil, `IS NULL` ile aranır.

### 11. Henüz bir bölüme yerleşmemiş öğrencileri bulun.

```sql
SELECT Ad, Soyad
FROM Ogrenciler
WHERE BolumID IS NULL;
```

**Sonuç (1 satır):**

| Ad | Soyad |
|---|---|
| Derya | Polat |


## 3. Sıralama ve Hesaplanan Sütunlar

`ORDER BY` sonucu sıralar (`ASC` küçükten büyüğe, `DESC` büyükten küçüğe). `AS` sütuna yeni ad verir.

### 12. Öğrencileri doğum yılına göre en gençten en yaşlıya sıralayın.

```sql
SELECT Ad, Soyad, DogumYili
FROM Ogrenciler
ORDER BY DogumYili DESC, OgrenciID;
```

**Sonuç (12 satır):**

| Ad | Soyad | DogumYili |
|---|---|---|
| Ahmet | Kaya | 2006 |
| Burak | Yılmaz | 2006 |
| Ayşe | Şahin | 2006 |
| Kerem | Aksoy | 2006 |
| Derya | Polat | 2006 |
| Elif | Demir | 2005 |
| Zeynep | Arslan | 2005 |
| Emre | Koç | 2005 |
| Mehmet | Çelik | 2004 |
| Fatma | Aydın | 2004 |
| Selin | Kurt | 2004 |
| Can | Öztürk | 2003 |

> Aynı yılda doğanlar için ikinci sıralama ölçütü olarak `OgrenciID` kullandık.

### 13. Her notun dönem sonu ortalamasını (vizenin %40'ı + finalin %60'ı) hesaplayın.

```sql
SELECT NotID, OgrenciID, Vize, Final,
       Vize * 0.4 + Final * 0.6 AS Ortalama
FROM Notlar;
```

**Sonuç (16 satır):**

| NotID | OgrenciID | Vize | Final | Ortalama |
|---|---|---|---|---|
| 1 | 1 | 70 | 80 | 76 |
| 2 | 1 | 55 | 60 | 58 |
| 3 | 2 | 90 | 95 | 93 |
| 4 | 2 | 85 | 75 | 79 |
| 5 | 3 | 40 | 45 | 43 |
| 6 | 3 | 60 | 70 | 66 |
| 7 | 4 | 100 | 90 | 94 |
| 8 | 4 | 75 | 85 | 81 |
| 9 | 5 | 30 | 50 | 42 |
| 10 | 6 | 80 | 70 | 74 |
| 11 | 6 | 65 | 75 | 71 |
| 12 | 7 | 45 | 40 | 42 |
| 13 | 8 | 95 | 100 | 98 |
| 14 | 9 | 50 | 65 | 59 |
| 15 | 10 | 88 | 92 | 90.4 |
| 16 | 11 | 72 | 68 | 69.6 |

> SQL Server sonucu `76.0` gibi ondalıklı gösterebilir; değer aynıdır.

### 14. Ortalaması 50'nin altında kalan (dersten kalan) notları listeleyin.

```sql
SELECT NotID, OgrenciID, DersID,
       Vize * 0.4 + Final * 0.6 AS Ortalama
FROM Notlar
WHERE Vize * 0.4 + Final * 0.6 < 50;
```

**Sonuç (3 satır):**

| NotID | OgrenciID | DersID | Ortalama |
|---|---|---|---|
| 5 | 3 | 1 | 43 |
| 9 | 5 | 1 | 42 |
| 12 | 7 | 4 | 42 |

> `WHERE` içinde `Ortalama` takma adı kullanılamaz, hesabı tekrar yazmak gerekir.


## 4. Toplama Fonksiyonları ve Gruplama

`COUNT`, `SUM`, `AVG`, `MIN`, `MAX` çok satırı tek sayıya indirir. `GROUP BY` bunu her grup için ayrı yapar, `HAVING` gruplara şart koyar.

### 15. Okulda toplam kaç öğrenci var?

```sql
SELECT COUNT(*) AS OgrenciSayisi
FROM Ogrenciler;
```

**Sonuç (1 satır):**

| OgrenciSayisi |
|---|
| 12 |

### 16. En yüksek ve en düşük final notu kaçtır?

```sql
SELECT MAX(Final) AS EnYuksek, MIN(Final) AS EnDusuk
FROM Notlar;
```

**Sonuç (1 satır):**

| EnYuksek | EnDusuk |
|---|---|
| 100 | 40 |

### 17. Her sınıfta kaç öğrenci olduğunu bulun.

```sql
SELECT Sinif, COUNT(*) AS OgrenciSayisi
FROM Ogrenciler
GROUP BY Sinif;
```

**Sonuç (2 satır):**

| Sinif | OgrenciSayisi |
|---|---|
| 1 | 7 |
| 2 | 5 |

### 18. Her derste final notlarının ortalamasını bulun.

```sql
SELECT DersID, AVG(Final * 1.0) AS FinalOrtalamasi
FROM Notlar
GROUP BY DersID;
```

**Sonuç (5 satır):**

| DersID | FinalOrtalamasi |
|---|---|
| 1 | 67.5 |
| 2 | 75 |
| 3 | 82.33 |
| 4 | 59.33 |
| 5 | 80 |

> `* 1.0` eklemezsek SQL Server tam sayıların ortalamasını küsuratı atarak verir (1 numaralı derste 67.5 yerine 67).

### 19. Aynı şehirden 2 veya daha fazla öğrenci gelen şehirleri bulun.

```sql
SELECT Sehir, COUNT(*) AS OgrenciSayisi
FROM Ogrenciler
WHERE Sehir IS NOT NULL
GROUP BY Sehir
HAVING COUNT(*) >= 2;
```

**Sonuç (2 satır):**

| Sehir | OgrenciSayisi |
|---|---|
| Bayburt | 4 |
| Erzurum | 2 |

> `WHERE` satırları gruplamadan önce, `HAVING` grupları gruplamadan sonra süzer.


## 5. Tabloları Birleştirme (JOIN)

`JOIN` iki tabloyu ortak sütun üzerinden yan yana getirir. `INNER JOIN` sadece eşleşenleri, `LEFT JOIN` soldaki tablonun hepsini getirir.

### 20. Her öğrencinin adını ve okuduğu bölümün adını listeleyin.

```sql
SELECT o.Ad, o.Soyad, b.BolumAdi
FROM Ogrenciler o
INNER JOIN Bolumler b ON o.BolumID = b.BolumID;
```

**Sonuç (11 satır):**

| Ad | Soyad | BolumAdi |
|---|---|---|
| Ahmet | Kaya | Bilgisayar Programcılığı |
| Elif | Demir | Bilgisayar Programcılığı |
| Mehmet | Çelik | Bilgisayar Programcılığı |
| Zeynep | Arslan | Bilgisayar Programcılığı |
| Burak | Yılmaz | Bilgisayar Programcılığı |
| Ayşe | Şahin | Sağlık Bilgi Sistemleri Teknikerliği |
| Emre | Koç | Sağlık Bilgi Sistemleri Teknikerliği |
| Fatma | Aydın | Sağlık Bilgi Sistemleri Teknikerliği |
| Can | Öztürk | Sağlık Bilgi Sistemleri Teknikerliği |
| Selin | Kurt | Bilgisayar Programcılığı |
| Kerem | Aksoy | Sağlık Bilgi Sistemleri Teknikerliği |

> Bölümü olmayan Derya Polat listede yok: `INNER JOIN` eşleşmeyeni atar.

### 21. Bölümü olmasa bile tüm öğrencileri, bölüm adıyla birlikte listeleyin.

```sql
SELECT o.Ad, o.Soyad, b.BolumAdi
FROM Ogrenciler o
LEFT JOIN Bolumler b ON o.BolumID = b.BolumID;
```

**Sonuç (12 satır):**

| Ad | Soyad | BolumAdi |
|---|---|---|
| Ahmet | Kaya | Bilgisayar Programcılığı |
| Elif | Demir | Bilgisayar Programcılığı |
| Mehmet | Çelik | Bilgisayar Programcılığı |
| Zeynep | Arslan | Bilgisayar Programcılığı |
| Burak | Yılmaz | Bilgisayar Programcılığı |
| Ayşe | Şahin | Sağlık Bilgi Sistemleri Teknikerliği |
| Emre | Koç | Sağlık Bilgi Sistemleri Teknikerliği |
| Fatma | Aydın | Sağlık Bilgi Sistemleri Teknikerliği |
| Can | Öztürk | Sağlık Bilgi Sistemleri Teknikerliği |
| Selin | Kurt | Bilgisayar Programcılığı |
| Kerem | Aksoy | Sağlık Bilgi Sistemleri Teknikerliği |
| Derya | Polat | NULL |

> Bu sefer Derya Polat da geldi; bölüm adı yerine `NULL` yazıyor.

### 22. Her notu öğrencinin adı ve dersin adıyla birlikte gösterin.

```sql
SELECT o.Ad, o.Soyad, d.DersAdi, n.Vize, n.Final
FROM Notlar n
INNER JOIN Ogrenciler o ON n.OgrenciID = o.OgrenciID
INNER JOIN Dersler d ON n.DersID = d.DersID
ORDER BY n.NotID;
```

**Sonuç (16 satır):**

| Ad | Soyad | DersAdi | Vize | Final |
|---|---|---|---|---|
| Ahmet | Kaya | Görsel Programlama | 70 | 80 |
| Ahmet | Kaya | Veritabanı | 55 | 60 |
| Elif | Demir | Görsel Programlama | 90 | 95 |
| Elif | Demir | Veritabanı | 85 | 75 |
| Mehmet | Çelik | Görsel Programlama | 40 | 45 |
| Mehmet | Çelik | İnternet Programcılığı | 60 | 70 |
| Zeynep | Arslan | Veritabanı | 100 | 90 |
| Zeynep | Arslan | İnternet Programcılığı | 75 | 85 |
| Burak | Yılmaz | Görsel Programlama | 30 | 50 |
| Ayşe | Şahin | Tıbbi Terminoloji | 80 | 70 |
| Ayşe | Şahin | Sağlık Bilgi Sistemleri | 65 | 75 |
| Emre | Koç | Tıbbi Terminoloji | 45 | 40 |
| Fatma | Aydın | Sağlık Bilgi Sistemleri | 95 | 100 |
| Can | Öztürk | Sağlık Bilgi Sistemleri | 50 | 65 |
| Selin | Kurt | İnternet Programcılığı | 88 | 92 |
| Kerem | Aksoy | Tıbbi Terminoloji | 72 | 68 |

> Üç tablo da birleştirilebilir: her `JOIN` bir tablo daha ekler.

### 23. Her bölümde kaç öğrenci olduğunu, hiç öğrencisi olmayan bölüm de görünecek şekilde bulun.

```sql
SELECT b.BolumAdi, COUNT(o.OgrenciID) AS OgrenciSayisi
FROM Bolumler b
LEFT JOIN Ogrenciler o ON b.BolumID = o.BolumID
GROUP BY b.BolumAdi
ORDER BY OgrenciSayisi DESC;
```

**Sonuç (3 satır):**

| BolumAdi | OgrenciSayisi |
|---|---|
| Bilgisayar Programcılığı | 6 |
| Sağlık Bilgi Sistemleri Teknikerliği | 5 |
| Muhasebe ve Vergi Uygulamaları | 0 |

> `COUNT(*)` yazsaydık Muhasebe 0 yerine 1 çıkardı; `COUNT(o.OgrenciID)` boş eşleşmeyi saymaz.

### 24. Her dersin ortalama dönem sonu notunu ders adıyla birlikte, yüksekten düşüğe sıralayın.

```sql
SELECT d.DersAdi, AVG(n.Vize * 0.4 + n.Final * 0.6) AS DersOrtalamasi
FROM Notlar n
INNER JOIN Dersler d ON n.DersID = d.DersID
GROUP BY d.DersAdi
ORDER BY DersOrtalamasi DESC;
```

**Sonuç (5 satır):**

| DersAdi | DersOrtalamasi |
|---|---|
| İnternet Programcılığı | 79.13 |
| Veritabanı | 77 |
| Sağlık Bilgi Sistemleri | 76 |
| Görsel Programlama | 63.5 |
| Tıbbi Terminoloji | 61.87 |


## 6. Alt Sorgular

Bir sorgunun içine yazılan ikinci sorguya alt sorgu denir; önce içteki çalışır.

### 25. Final notu, tüm final notlarının ortalamasından yüksek olan kayıtları listeleyin.

```sql
SELECT NotID, OgrenciID, Final
FROM Notlar
WHERE Final > (SELECT AVG(Final * 1.0) FROM Notlar);
```

**Sonuç (8 satır):**

| NotID | OgrenciID | Final |
|---|---|---|
| 1 | 1 | 80 |
| 3 | 2 | 95 |
| 4 | 2 | 75 |
| 7 | 4 | 90 |
| 8 | 4 | 85 |
| 11 | 6 | 75 |
| 13 | 8 | 100 |
| 15 | 10 | 92 |

### 26. Hiç not kaydı olmayan öğrencileri bulun.

```sql
SELECT Ad, Soyad
FROM Ogrenciler
WHERE OgrenciID NOT IN (SELECT OgrenciID FROM Notlar);
```

**Sonuç (1 satır):**

| Ad | Soyad |
|---|---|
| Derya | Polat |
