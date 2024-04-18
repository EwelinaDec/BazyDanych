-- Database: firma
DROP DATABASE IF EXISTS firma;
CREATE DATABASE firma;
DROP SCHEMA IF EXISTS rozliczenia CASCADE;

CREATE SCHEMA rozliczenia;
CREATE TABLE rozliczenia.pracownicy(id_pracownika INT NOT NULL PRIMARY KEY,
									imie VARCHAR NOT NULL,
									nazwisko VARCHAR NOT NULL,
									adres VARCHAR NOT NULL,
									telefon VARCHAR NULL) ;
									
								
									
CREATE TABLE rozliczenia.godziny(id_godziny INT NOT NULL PRIMARY KEY,
								 data DATE NOT NULL,
								 liczba_godzin REAL NOT NULL,
								 id_pracownika INT NOT NULL);
								 
ALTER TABLE  rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

CREATE TABLE rozliczenia.pensje(id_pensji INT NOT NULL PRIMARY KEY,
								stanowisko VARCHAR NOT NULL,
								kwota REAL NOT NULL,
								id_premii INT NOT NULL);

								
CREATE TABLE rozliczenia.premie(id_premii INT NOT NULL PRIMARY KEY,
								rodzaj VARCHAR NOT NULL,
								kwota REAL NOT NULL);

ALTER TABLE  rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);			

INSERT INTO rozliczenia.pracownicy (id_pracownika,imie,nazwisko,adres,telefon)
VALUES
  (1,'Emma','Watson','123-4567 Random St.','555-123-456'),
(2,'Liam','Smith','789-0123 Mystery Ave.','555-987-654'),
(3,'Olivia','Brown','456-7890 Enigma Rd.','555-321-098'),
(4,'William','Jones','012-3456 Secret St.','555-654-321'),
(5,'Ava','Johnson','678-9012 Puzzle Pl.','555-789-012'),
(6,'James','Williams','345-6789 Riddle Rd.','555-210-987'),
(7,'Isabella','Davis','890-1234 Conundrum St.','555-543-210'),
(8,'Benjamin','Miller','567-8901 Enigma Blvd.','555-876-543'),
(9,'Sophia','Wilson','234-5678 Cipher St.','555-987-654'),
(10,'Michael','Taylor','901-2345 Mystery Way','555-123-456');



  
  INSERT INTO rozliczenia.premie (id_premii,rodzaj,kwota)
VALUES
(1,'Premia za doskonałą obsługę klienta',189),
(2,'Premia za terminowość i punktualność',27),
(3,'Premia za zaangażowanie społeczne',40),
(4,'Premia za kreatywne podejście do problemów',134),
(5,'Premia za inicjatywę i samodzielność',70),
(6,'Premia za profesjonalizm w pracy zespołowej',50),
(7,'Premia za osiągnięcia w szkoleniach',92),
(8,'Premia za doskonalenie umiejętności',32),
(9,'Premia za dbałość o bezpieczeństwo',60),
(10,'Premia za aktywny udział w projektach',205);

  
  INSERT INTO rozliczenia.godziny (id_godziny,data,liczba_godzin,id_pracownika)
VALUES
 (1,'2024-02-15',3,1),
(2,'2024-03-25',2,2),
(3,'2024-01-22',7,3),
(4,'2024-01-20',8,4),
(5,'2024-07-20',4,5),
(6,'2025-03-30',8,6),
(7,'2025-04-05',6,7),
(8,'2025-01-20',4,8),
(9,'2023-07-15',3,9),
(10,'2024-01-10',2,10);


INSERT INTO rozliczenia.pensje (id_pensji,stanowisko,kwota,id_premii)
VALUES
  (1,'Backend Developer',100,1),
(2,'Project Manager',1500,2),
(3,'Frontend Developer',1350,3),
(4,'Quality Assurance Engineer',1900,4),
(5,'Financial Advisor',2800,5),
(6,'Human Resources Specialist',4500,6),
(7,'Internet Marketing Specialist',6000,7),
(8,'Mobile App Developer',1000,8),
(9,'Data Analyst',2000,9),
(10,'Human Resources',1500,10);

  
  
  
  
SELECT nazwisko, adres FROM rozliczenia.pracownicy;
-----
SELECT 
    id_godziny,
    DATE_PART('isodow', data) AS dzien_tygodnia,
    DATE_PART('month', data) AS miesiac
FROM 
    rozliczenia.godziny;
-----
ALTER TABLE rozliczenia.pensje
RENAME COLUMN kwota TO kwota_brutto;


ALTER TABLE rozliczenia.pensje
ADD kwota_netto DECIMAL(10, 2);

UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto * 0.8;


SELECT * FROM rozliczenia.pensje;

	