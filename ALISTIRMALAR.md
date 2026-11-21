# SQL Alıştırmaları — Sorular

Önce `veritabani/ogrenci_isleri.sql` betiğini SQL Server'da çalıştırın, sonra her soruyu kendiniz yazmayı deneyin.
Takıldığınızda ya da kontrol etmek için [COZUMLER.md](COZUMLER.md) dosyasına bakın: her sorunun sorgusu ve çıkması gereken sonuç tablosu orada.

## 1. Temel Seçme (SELECT)

1. Tüm öğrencileri bütün bilgileriyle listeleyin.
2. Öğrencilerin sadece adını ve soyadını listeleyin.
3. Öğrencilerin hangi şehirlerden geldiğini, her şehir bir kez görünecek şekilde listeleyin.

## 2. Filtreleme (WHERE)

4. Birinci sınıftaki öğrencileri listeleyin.
5. Bayburtlu öğrencileri listeleyin.
6. Bilgisayar Programcılığı (BolumID = 1) bölümünde okuyan 2. sınıf öğrencilerini listeleyin.
7. Erzurumlu veya Trabzonlu öğrencileri listeleyin.
8. 2004 ile 2005 yılları arasında (ikisi dahil) doğan öğrencileri listeleyin.
9. Adı 'E' harfiyle başlayan öğrencileri listeleyin.
10. Şehir bilgisi girilmemiş öğrencileri bulun.
11. Henüz bir bölüme yerleşmemiş öğrencileri bulun.

## 3. Sıralama ve Hesaplanan Sütunlar

12. Öğrencileri doğum yılına göre en gençten en yaşlıya sıralayın.
13. Her notun dönem sonu ortalamasını (vizenin %40'ı + finalin %60'ı) hesaplayın.
14. Ortalaması 50'nin altında kalan (dersten kalan) notları listeleyin.

## 4. Toplama Fonksiyonları ve Gruplama

15. Okulda toplam kaç öğrenci var?
16. En yüksek ve en düşük final notu kaçtır?
17. Her sınıfta kaç öğrenci olduğunu bulun.
18. Her derste final notlarının ortalamasını bulun.
19. Aynı şehirden 2 veya daha fazla öğrenci gelen şehirleri bulun.

## 5. Tabloları Birleştirme (JOIN)

20. Her öğrencinin adını ve okuduğu bölümün adını listeleyin.
21. Bölümü olmasa bile tüm öğrencileri, bölüm adıyla birlikte listeleyin.
22. Her notu öğrencinin adı ve dersin adıyla birlikte gösterin.
23. Her bölümde kaç öğrenci olduğunu, hiç öğrencisi olmayan bölüm de görünecek şekilde bulun.
24. Her dersin ortalama dönem sonu notunu ders adıyla birlikte, yüksekten düşüğe sıralayın.

## 6. Alt Sorgular

25. Final notu, tüm final notlarının ortalamasından yüksek olan kayıtları listeleyin.
26. Hiç not kaydı olmayan öğrencileri bulun.
