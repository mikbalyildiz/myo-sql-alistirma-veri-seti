-- =============================================================
-- MYO SQL Alıştırma Veri Seti — Öğrenci İşleri Örnek Veritabanı
-- Hazırlayan: Öğr. Gör. Muhammet İkbal YILDIZ (Bayburt Üniversitesi)
-- Lisans: CC BY 4.0 — kaynak gösterilerek serbestçe kullanılabilir.
-- Hedef: Microsoft SQL Server (SSMS veya Visual Studio içinden çalıştırılır)
-- =============================================================

-- Veritabanını oluştur ve onu kullanmaya başla
CREATE DATABASE OgrenciIsleri;
GO
USE OgrenciIsleri;
GO

-- Bölümler: okuldaki programlar
CREATE TABLE Bolumler (
    BolumID   INT PRIMARY KEY,          -- her bölümün tek numarası
    BolumAdi  NVARCHAR(60) NOT NULL     -- bölümün adı (Türkçe karakter için NVARCHAR)
);

-- Öğrenciler: her öğrenci bir bölüme bağlı (BolumID boş olabilir: henüz yerleşmemiş öğrenci)
CREATE TABLE Ogrenciler (
    OgrenciID INT PRIMARY KEY,
    Ad        NVARCHAR(30) NOT NULL,
    Soyad     NVARCHAR(30) NOT NULL,
    BolumID   INT NULL REFERENCES Bolumler(BolumID),
    Sinif     INT NOT NULL,             -- 1 veya 2
    Sehir     NVARCHAR(30) NULL,        -- bilinmiyorsa boş (NULL)
    DogumYili INT NOT NULL
);

-- Dersler: her ders bir bölüme ait
CREATE TABLE Dersler (
    DersID   INT PRIMARY KEY,
    DersAdi  NVARCHAR(60) NOT NULL,
    Kredi    INT NOT NULL,
    BolumID  INT NOT NULL REFERENCES Bolumler(BolumID)
);

-- Notlar: hangi öğrenci hangi dersten kaç almış
CREATE TABLE Notlar (
    NotID     INT PRIMARY KEY,
    OgrenciID INT NOT NULL REFERENCES Ogrenciler(OgrenciID),
    DersID    INT NOT NULL REFERENCES Dersler(DersID),
    Vize      INT NOT NULL,
    Final     INT NOT NULL
);
GO

INSERT INTO Bolumler (BolumID, BolumAdi) VALUES
    (1, N'Bilgisayar Programcılığı'),
    (2, N'Sağlık Bilgi Sistemleri Teknikerliği'),
    (3, N'Muhasebe ve Vergi Uygulamaları');

INSERT INTO Ogrenciler (OgrenciID, Ad, Soyad, BolumID, Sinif, Sehir, DogumYili) VALUES
    (1, N'Ahmet', N'Kaya', 1, 1, N'Bayburt', 2006),
    (2, N'Elif', N'Demir', 1, 1, N'Erzurum', 2005),
    (3, N'Mehmet', N'Çelik', 1, 2, N'Trabzon', 2004),
    (4, N'Zeynep', N'Arslan', 1, 2, N'Bayburt', 2005),
    (5, N'Burak', N'Yılmaz', 1, 1, N'Ankara', 2006),
    (6, N'Ayşe', N'Şahin', 2, 1, N'Gümüşhane', 2006),
    (7, N'Emre', N'Koç', 2, 1, N'Bayburt', 2005),
    (8, N'Fatma', N'Aydın', 2, 2, N'Erzincan', 2004),
    (9, N'Can', N'Öztürk', 2, 2, NULL, 2003),
    (10, N'Selin', N'Kurt', 1, 2, N'İstanbul', 2004),
    (11, N'Kerem', N'Aksoy', 2, 1, N'Erzurum', 2006),
    (12, N'Derya', N'Polat', NULL, 1, N'Bayburt', 2006);

INSERT INTO Dersler (DersID, DersAdi, Kredi, BolumID) VALUES
    (1, N'Görsel Programlama', 4, 1),
    (2, N'Veritabanı', 4, 1),
    (3, N'İnternet Programcılığı', 3, 1),
    (4, N'Tıbbi Terminoloji', 3, 2),
    (5, N'Sağlık Bilgi Sistemleri', 4, 2),
    (6, N'Genel Muhasebe', 4, 3);

INSERT INTO Notlar (NotID, OgrenciID, DersID, Vize, Final) VALUES
    (1, 1, 1, 70, 80),
    (2, 1, 2, 55, 60),
    (3, 2, 1, 90, 95),
    (4, 2, 2, 85, 75),
    (5, 3, 1, 40, 45),
    (6, 3, 3, 60, 70),
    (7, 4, 2, 100, 90),
    (8, 4, 3, 75, 85),
    (9, 5, 1, 30, 50),
    (10, 6, 4, 80, 70),
    (11, 6, 5, 65, 75),
    (12, 7, 4, 45, 40),
    (13, 8, 5, 95, 100),
    (14, 9, 5, 50, 65),
    (15, 10, 3, 88, 92),
    (16, 11, 4, 72, 68);

GO
