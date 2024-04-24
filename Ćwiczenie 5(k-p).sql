--DROP DATABASE IF EXISTS firma2;
--CREATE DATABASE firma2;

DROP SCHEMA IF EXISTS ksiegowosc CASCADE;
CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (
id_pracownika INT NOT NULL PRIMARY key,
imie VARCHAR NOT NULL,
nazwisko VARCHAR NOT NULL,
adres VARCHAR NOT NULL,
telefon VARCHAR NULL);

CREATE TABLE ksiegowosc.godziny (
id_godziny INT NOT NULL PRIMARY KEY,
data DATE NOT NULL, 
liczba_godzin REAL NOT NULL, 
id_pracownika INT NOT NULL);

CREATE TABLE ksiegowosc.pensja (
    id_pensji INT NOT NULL PRIMARY KEY,
    stanowisko VARCHAR NOT NULL,
    kwota DECIMAL(10, 2) NOT NULL);
								
CREATE TABLE ksiegowosc.premie(
id_premii INT NOT NULL PRIMARY KEY,
rodzaj VARCHAR NOT NULL,
kwota REAL NOT NULL);

CREATE TABLE ksiegowosc.wynagrodzenie(
id_wynagrodzenia INT NOT NULL PRIMARY KEY,
data DATE NOT NULL,
id_pracownika INT NOT NULL,
id_godziny INT NOT NULL,
id_pensji INT NOT NULL,
id_premii INT NOT NULL);


ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika),
ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny),
ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji),
ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);


COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela przechowująca informacje o pracownikach.';
COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela przechowująca informacje o przepracowanych godzinach przez pracowników.';
COMMENT ON TABLE ksiegowosc.pensja IS 'Tabela przechowująca informacje o pensjach pracowników.';
COMMENT ON TABLE ksiegowosc.premie IS 'Tabela przechowująca informacje o premiach dla pracowników.';
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela przechowująca informacje o wynagrodzeniach pracowników, uwzględniająca pensje i premie.';


INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
(1, 'Alicja', 'Nowakowska', 'ul. Podgórna 3, Gdynia', '123123123'),
(2, 'Jan', 'Kowalczyk', 'ul. Słonecznikowa 7, Bydgoszcz', '456456456'),
(3, 'Krzysztof', 'Zieliński', 'ul. Kwiatowa 2, Lublin', '789789789'),
(4, 'Aleksandra', 'Duda', 'ul. Lipowa 4, Łódź', '987987987'),
(5, 'Robert', 'Pawlak', 'ul. Leśna 10, Poznań', '654654654'),
(6, 'Karolina', 'Mazur', 'ul. Brzozowa 12, Kraków', '321321321'),
(7, 'Marek', 'Krawczyk', 'ul. Polna 1, Warszawa', '999999999'),
(8, 'Monika', 'Walna', 'ul. Ogrodowa 9, Wrocław', '888888888'),
(9, 'Jola', 'Witkowski', 'ul. Miodowa 15, Gdańsk', '777777777'),
(10, 'Magdalena', 'Kubiak', 'ul. Kwiatowa 6, Katowice', '666666666');

INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(1, '2024-04-21', 80.00, 1),
(2, '2024-04-22', 167.50, 2),
(3, '2024-04-23', 128.25, 3),
(4, '2024-04-24', 198.00, 4),
(5, '2024-04-25', 97.75, 5),
(6, '2024-04-26', 148.50, 6),
(7, '2024-04-27', 158.00, 7),
(8, '2024-04-28', 167.25, 8),
(9, '2024-04-29', 88.75, 9),
(10, '2024-04-30', 177.00, 10);

INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota)
VALUES
(1, 'Recepcjonista', 2000.00),
(2, 'Technik', 880.00),
(3, 'Kierowca', 5500.00),
(4, 'Specjalista ds. marketingu', 6000.00),
(5, 'Administrator systemów', 6500.00),
(6, 'Kasjer', 7000.00),
(7, 'Przedstawiciel handlowy', 7500.00),
(8, 'Kasjer', 4000.00),
(9, 'Magazynier', 3800.00),
(10, 'Sprzątaczka', 2500.00);


INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES
(1, 'Za nadgodziny', 300.00),
(2, 'Premia roczna', 1500.00),
(3, 'Bonus', 1000.00),
(4, 'Nagroda jubileuszowa', 2000.00),
(5, 'Dodatkowe świadczenia', 800.00),
(6, 'Premia za wydajność', 1200.00),
(7, 'Bonus urodzinowy', 500.00),
(8, 'Motywacyjna nagroda', 900.00),
(9, 'Zaangażowanie', 700.00),
(10, 'Premia za jakość', 1100.00);

INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES
(1, '2024-04-11', 1, 1, 1, 1),
(2, '2024-04-12', 2, 2, 2, 2),
(3, '2024-04-13', 3, 3, 3, 3),
(4, '2024-04-14', 4, 4, 4, 4),
(5, '2024-04-15', 5, 5, 5, 5),
(6, '2024-04-16', 6, 6, 6, 6),
(7, '2024-04-17', 7, 7, 7, 7),
(8, '2024-04-18', 8, 8, 8, 8),
(9, '2024-04-19', 9, 9, 9, 9),
(10, '2024-04-20', 10, 10, 10, 10);


--a
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;


--b
SELECT p.id_pracownika
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja pe ON w.id_pensji = pe.id_pensji
WHERE pe.kwota > 1000;


--c
SELECT p.id_pracownika
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja pe ON w.id_pensji = pe.id_pensji
LEFT JOIN ksiegowosc.premie pr ON w.id_premii = pr.id_premii
WHERE pr.id_premii IS NULL AND pe.kwota > 2000;


--d
SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';


--e
SELECT *
FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';


--f
SELECT p.imie, p.nazwisko, SUM(g.liczba_godzin) - 160 AS nadgodziny
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika
GROUP BY p.imie, p.nazwisko;


--g
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja pe ON w.id_pensji = pe.id_pensji
WHERE pe.kwota BETWEEN 1500 AND 3000;


--h
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja pe ON w.id_pensji = pe.id_pensji
JOIN ksiegowosc.godziny g ON w.id_godziny = g.id_godziny
LEFT JOIN ksiegowosc.premie pr ON w.id_premii = pr.id_premii
WHERE (g.liczba_godzin > 160 AND pr.id_premii IS NULL);


--i
SELECT p.imie, p.nazwisko, pe.kwota AS pensja
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja pe ON w.id_pensji = pe.id_pensji
ORDER BY pe.kwota;


--j
SELECT p.imie, p.nazwisko, pe.kwota AS pensja, pr.kwota AS premia
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja pe ON w.id_pensji = pe.id_pensji
LEFT JOIN ksiegowosc.premie pr ON w.id_premii = pr.id_premii
ORDER BY pe.kwota DESC, pr.kwota DESC;


--k
SELECT stanowisko, COUNT(p.id_pracownika) as liczba_pracownikow
FROM ksiegowosc.pensja AS pe
JOIN ksiegowosc.wynagrodzenie AS w ON pe.id_pensji = w.id_pensji
JOIN ksiegowosc.pracownicy AS p ON w.id_pracownika = p.id_pracownika
GROUP BY stanowisko;


--l
SELECT 
    pe.stanowisko,
    AVG(pe.kwota) as srednia_placa,
    MIN(pe.kwota) as minimalna_placa,
    MAX(pe.kwota) as maksymalna_placa
FROM ksiegowosc.wynagrodzenie AS w
JOIN ksiegowosc.pensja AS pe ON w.id_pensji = pe.id_pensji
WHERE pe.stanowisko = 'Kasjer'
GROUP BY pe.stanowisko;


--m
SELECT SUM(pe.kwota) as suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie AS w
JOIN ksiegowosc.pensja AS pe ON w.id_pensji = pe.id_pensji;


--n
SELECT 
    pe.stanowisko,
    SUM(pe.kwota) as suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie AS w
JOIN ksiegowosc.pensja AS pe ON w.id_pensji = pe.id_pensji
GROUP BY pe.stanowisko;


--o
SELECT 
    pe.stanowisko,
    COUNT(pr.id_premii) as liczba_premii
FROM ksiegowosc.wynagrodzenie AS w
JOIN ksiegowosc.pensja AS pe ON w.id_pensji = pe.id_pensji
LEFT JOIN ksiegowosc.premie AS pr ON w.id_premii = pr.id_premii
GROUP BY pe.stanowisko;


--p
DELETE FROM ksiegowosc.wynagrodzenie
WHERE id_pensji IN (
    SELECT id_pensji
    FROM ksiegowosc.pensja
    WHERE kwota < 1200.00
);

DELETE FROM ksiegowosc.pracownicy
WHERE id_pracownika IN (
    SELECT p.id_pracownika
    FROM ksiegowosc.pracownicy p
    LEFT JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
    LEFT JOIN ksiegowosc.pensja pe ON w.id_pensji = pe.id_pensji
    WHERE pe.kwota < 1200.00
);



