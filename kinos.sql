-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 18 Mar 2022, 20:10
-- Wersja serwera: 8.0.27
-- Wersja PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `kinos`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `halls`
--

CREATE TABLE `halls` (
  `hid` int NOT NULL,
  `tiers` int NOT NULL,
  `seats_in_tier` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `halls`
--

INSERT INTO `halls` (`hid`, `tiers`, `seats_in_tier`) VALUES
(1, 12, 16),
(2, 10, 18),
(3, 10, 15);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `inbox`
--

CREATE TABLE `inbox` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `inbox`
--

INSERT INTO `inbox` (`id`, `email`, `message`) VALUES
(5, 'agunia@student.agh.edu.pl', 'Strona jest ekstra. Pozdrawiam prowadzącego!'),
(7, 'bananplb@gmail.com', 'Dzień Dobry, wkrótce napiszę swoją opinię o owej stronie.'),
(8, 'bananplb@gmail.com', 'To znów ja. Chciałbym teraz ocenić Państwa stronę. W skali od 0 do 15 oceniam na 14.\nNaura'),
(9, 'gunia.amadeusz@gmail.com', 'Ekstra strona.'),
(14, 'agunia@student.agh.edu.pl', 'Polecam to kino!');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `movies`
--

CREATE TABLE `movies` (
  `mid` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `director` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `genre` varchar(20) NOT NULL,
  `duration` int NOT NULL,
  `min_age` int NOT NULL,
  `production` varchar(30) NOT NULL,
  `poster_path` varchar(255) NOT NULL,
  `trailer_URL` varchar(255) NOT NULL,
  `available_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `click_counter` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `movies`
--

INSERT INTO `movies` (`mid`, `title`, `director`, `description`, `genre`, `duration`, `min_age`, `production`, `poster_path`, `trailer_URL`, `available_date`, `expiration_date`, `click_counter`) VALUES
(1, 'GIEREK', 'Michał Węgrzyn', 'Sekrety i tajemnice domu I sekretarza KC PZPR. Film z przełomową historią Polski w tle. Akcja filmu toczy się w latach 1970 – 1982, kiedy Edward Gierek zostaje I sekretarzem KC PZPR, do końca jego internowania.', 'Biograficzny', 140, 15, 'Polska', '/resources/gierek.jpg', 'https://www.youtube.com/embed/sDa-hUS3-mo', '2022-01-21', '2022-03-02', 547),
(2, 'DZIEWCZYNY Z DUBAJU', 'Maria Sadowska', 'Oparte na prawdziwych wydarzeniach „Dziewczyny z Dubaju” zdemaskują hipokryzję polskiego show biznesu i ujawnią całą prawdę na temat tzw. „afery dubajskiej”, w którą zamieszane były zarówno celebrytki i modelki, jak również wiele znanych postaci ze świata polityki, biznesu, czy sportu.', 'Kryminał', 146, 18, 'Polska', '/resources/dubaj.jpg', 'https://www.youtube.com/embed/C3VhTYLIpF4', '2021-11-26', '2022-02-28', 166),
(3, 'SING 2', 'Garth Jennings', 'Miś koala - Buster Moon i gwiazdorska obsada jego teatru pragną wystąpić na olśniewającej, wspaniałej i ekstrawaganckiej scenie. Jest tylko jeden haczyk: najpierw muszą przekonać najbardziej samotną gwiazdę rocka na świecie, aby do nich dołączyła. Buster i jego ekipa zmienili teatr New Moon we wspaniałe miejsce, ale Buster chciałby, aby nowy spektakl zadebiutował na scenie teatru Crystal w olśniewającym mieście Redshore.', 'Animacja', 110, 6, 'Francja/Japonia/USA', '/resources/sing2.jpg', 'https://www.youtube.com/embed/McDrxYQ3qqU', '2022-01-21', '2022-02-28', 171),
(4, 'KRZYK', 'Matt Bettinelli-Olpin, Tyler Gillett', 'Dwadzieścia pięć lat po serii brutalnych zdarzeń, które wstrząsnęły mieszkańcami Woodsboro, kolejny zabójca nakłada otoczoną złą legendą maskę Ghostface. Mnożą się okrutne ataki na grupę nastolatków. Tajemnice z mrocznej przeszłości miasta zostają wskrzeszone. Neve Campbell (Sidney Prescott), Courteney Cox (Gale Weathers) i David Arquette (szeryf Dewey Riley) jeszcze raz obejmują swe ikoniczne role w „Krzyku”, obok Melissy Barrery, Masona Goodinga, Jenny Ortegi, Jacka Quaida i Marley Shelton. Fani mogą liczyć na solidną dawkę strachu, ale również na niezłą zabawę.', 'Horror', 114, 15, 'USA', '/resources/krzyk.jpg', 'https://www.youtube.com/embed/VC1kbhpvYYQ', '2022-01-14', '2022-04-14', 8),
(5, 'NASZE MAGICZNE ENCANTO', 'Byron Howard', '„Nasze magiczne Encanto” opowiada historię niezwykłej rodziny Madrigal. Ich pełen magii dom znajduje się w tętniącym życiem mieście - w cudownym i urokliwym miejscu zwanym Encanto, ukrytym w górach Kolumbii. Magia Encanto sprawiła, że każde dziecko w rodzinie posiada wyjątkową moc uzdrawiania, z wyjątkiem Mirabel. Kiedy magia otaczająca Encanto jest w niebezpieczeństwie, Mirabel odkrywa, że to właśnie ona, jako jedyna zwyczajna osoba w tej wyjątkowej rodzinie, może być jej ostatnią nadzieją.', 'Animacja', 110, 6, 'USA', '/resources/encanto.jpg', 'https://www.youtube.com/embed/IIyZi4zEbn4', '2021-11-26', '2022-03-16', 19),
(6, 'WIKI I JEJ SEKRET', 'Denis Imbert', 'Ośmioletnia Wiki, wraz z tatą, przeprowadza się do małego miasteczka w górach. Choć nowe miejsce jest pełne uroku, Wiki tęskni za dawnym życiem. Pewnego dnia dziewczynka dostaje od sąsiada niezwykły prezent – małego, cudownego szczeniaka. W tajemnicy przed tatą zabiera go do domu. Tak zaczyna się historia niezwykłej przyjaźni z wyjątkowym zwierzęciem.', 'Familijny', 84, 6, 'Francja', '/resources/wiki.jpg', 'https://www.youtube.com/embed/d_8VtMfnw14', '2022-02-04', '2022-06-14', 29),
(7, 'CLIFFORD. WIELKI CZERWONY PIES', 'Walt Becker', 'Ośmioletnia dziewczynka, Emily Elizabeth marzy o tym, aby jej maleńki, czerwony szczeniak urósł i był silny, nie spodziewa się jednak, że budząc się pewnego ranka znajdzie wielkiego psa w swoim małym mieszkaniu w Nowym Jorku. Emily za wszelką cenę chce, aby ukochany zwierzak został z nią. Postanawia znaleźć czarodzieja, który, przywróci Clifforda do normalnego rozmiaru. Na poszukiwania udaje się ze swoim wujem Caseyem i szkolnym kolegą Owenem. Clifford wzbudza powszechne zaciekawienie. Przyciąga również uwagę złego naukowca, który chce aby Clifford został jego psem.', 'Familijny', 96, 6, 'USA', '/resources/clifford.jpg', 'https://www.youtube.com/embed/OPdHTXV5iFs', '2021-12-03', '2022-03-08', 12),
(8, '8 RZECZY, KTÓRYCH NIE WIECIE O FACETACH', 'Sylwester Jakimow', 'Siła przyjaźni, chwile wzruszenia i szalone przygody uwielbianych przez widzów bohaterów. Jak potoczyły się ich losy? Co nastąpiło po przysłowiowym: „żyli długo i szczęśliwie”? W nowej odsłonie komedii o męskich „słabościach” Ricky walczy z twórczym kryzysem, Jarosław z atakami paniki, Filip szaleje na giełdzie, Stefan próbuje zapanować nad złością, a Kordian poskładać złamane serce. Tylko Tomek, jako jedyny z przyjaciół, nadal odważnie spełnia marzenia. I w końcu wpada przez to w kłopoty. W wir szaleństw facetów, poza znanymi z poprzedniej części Basią i Zosią, wciągnięta zostanie również zupełnie nowa bohaterka – tajemnicza Pestka.', 'Romantyczny', 95, 13, 'Polska', '/resources/8rzeczy.jpg', 'https://www.youtube.com/embed/dGG2XG2Ra_I', '2022-01-28', '2022-04-28', 26),
(9, 'MIŁOŚĆ, SEKS & PANDEMIA', 'Patryk Vega', 'Trzy spragnione wrażeń i męskiego towarzystwa przyjaciółki wychodzą w miasto, aby zabawić się w najkrótszą noc w roku. Kaja (Anna Mucha) jest pewną siebie i ambitną dziennikarką, która swoich kochanków już dawno przestała liczyć. Teraz na jej celowniku pojawia się niejaki Johnny – mistrz uwodzenia kobiet. Kaja widzi w nim nie tylko nową zdobycz, ale i szansę na przebojowy artykuł, na potrzeby którego postanawia pójść z Johnnym do łóżka. Olga (Zofia Zborowska-Wrona) to silna prokurator i zadeklarowana feministka. Jej poglądy i życie rodzinne zostaną wystawione na próbę, kiedy znajdzie się pod niemal narkotycznym wpływem mężczyzny z egzotycznego wschodu. Nora (Małgorzata Rozenek-Majdan) odnosi sukcesy zawodowo, zajmując się fotografią, ale jej życie uczuciowe pozostaje w rozsypce. Wszystko zmieni się, gdy przed obiektywem aparatu stanie młodszy od niej model. Wkrótce za sprawą pandemii życie trzech przyjaciółek oraz Bartka (Sebastian Dela) – kuzyna Kai, prawiczka, który postanawia podbić świat nocnych klubów jako striptizer – zostanie dosłownie wywrócone do góry nogami. A każde z nich odkryje, że miłość w czasach lockdownu ma znacznie więcej niż 50 twarzy.', 'Romantyczny', 115, 15, 'Polska', '/resources/milo.jpg', 'https://www.youtube.com/embed/f_V0ZHcaRGo', '2022-02-04', '2022-05-04', 9),
(10, 'MOONFALL', 'Roland Emmerich', 'Tajemnicza siła wybija Księżyc z orbity i posyła go na kurs kolizyjny z Ziemią. Grupa astronautów wyrusza w kosmos, by zapobiec katastrofie.', 'Science-Fiction', 131, 15, 'USA', '/resources/moonfall.jpg', 'https://www.youtube.com/embed/gReBRtwe_rQ', '2022-02-04', '2022-04-10', 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `screenings`
--

CREATE TABLE `screenings` (
  `sid` int NOT NULL,
  `mid` int NOT NULL,
  `day` date NOT NULL,
  `time` time NOT NULL,
  `hid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `screenings`
--

INSERT INTO `screenings` (`sid`, `mid`, `day`, `time`, `hid`) VALUES
(1, 1, '2022-02-07', '18:30:00', 1),
(2, 2, '2022-02-07', '19:30:00', 3),
(3, 2, '2022-02-07', '22:00:00', 2),
(4, 3, '2022-02-08', '14:30:00', 1),
(5, 2, '2022-02-08', '18:30:00', 3),
(6, 3, '2022-02-08', '16:00:00', 2),
(7, 2, '2022-02-09', '15:30:00', 3),
(8, 1, '2022-02-09', '16:30:00', 2),
(9, 1, '2022-02-09', '19:30:00', 1),
(10, 3, '2022-02-09', '14:30:00', 1),
(11, 3, '2022-02-10', '18:30:00', 2),
(12, 1, '2022-02-10', '11:30:00', 2),
(13, 1, '2022-02-10', '17:30:00', 3),
(14, 2, '2022-02-10', '14:30:00', 1),
(15, 3, '2022-02-10', '19:45:00', 1),
(16, 2, '2022-02-10', '14:30:00', 2),
(17, 3, '2022-02-11', '17:30:00', 2),
(18, 1, '2022-02-11', '17:15:00', 3),
(19, 3, '2022-02-11', '19:00:00', 1),
(20, 2, '2022-02-11', '20:30:00', 3),
(21, 1, '2022-02-15', '20:30:00', 2),
(22, 3, '2022-02-11', '11:00:00', 1),
(23, 3, '2022-02-11', '13:30:00', 2),
(24, 2, '2022-02-12', '20:00:00', 1),
(25, 7, '2022-02-11', '15:35:00', 1),
(26, 7, '2022-02-12', '12:40:00', 1),
(27, 7, '2022-02-12', '13:30:00', 2),
(28, 7, '2022-02-14', '14:30:00', 3),
(29, 7, '2022-02-15', '15:00:00', 3),
(30, 4, '2022-02-10', '21:00:00', 2),
(31, 4, '2022-02-10', '21:30:00', 3),
(32, 4, '2022-02-10', '22:30:00', 1),
(33, 4, '2022-02-11', '23:30:00', 2),
(34, 4, '2022-02-12', '01:00:00', 3),
(35, 5, '2022-02-11', '09:00:00', 2),
(36, 5, '2022-02-12', '11:40:00', 3),
(37, 5, '2022-02-13', '10:35:00', 3),
(38, 5, '2022-02-14', '16:30:00', 2),
(39, 5, '2022-02-15', '12:20:00', 3),
(40, 6, '2022-02-11', '15:20:00', 3),
(41, 6, '2022-02-15', '16:20:00', 2),
(42, 6, '2022-02-15', '14:30:00', 1),
(43, 6, '2022-02-16', '15:00:00', 1),
(44, 6, '2022-02-17', '14:20:00', 2),
(45, 8, '2022-02-12', '17:00:00', 2),
(46, 8, '2022-02-13', '20:00:00', 2),
(47, 9, '2022-02-12', '18:00:00', 3),
(48, 9, '2022-02-12', '20:00:00', 2),
(49, 10, '2022-02-12', '21:20:00', 3),
(50, 10, '2022-02-13', '13:00:00', 3),
(51, 10, '2022-02-13', '21:00:00', 3),
(52, 10, '2022-02-14', '18:00:00', 3),
(53, 9, '2022-02-15', '20:00:00', 1),
(54, 9, '2022-02-14', '21:00:00', 1),
(55, 8, '2022-02-18', '20:00:00', 1),
(56, 8, '2022-02-19', '20:00:00', 2),
(57, 8, '2022-02-19', '15:00:00', 2),
(58, 9, '2022-02-19', '17:30:00', 3),
(59, 10, '2022-02-19', '15:00:00', 1);

--
-- Wyzwalacze `screenings`
--
DELIMITER $$
CREATE TRIGGER `new_screening` BEFORE INSERT ON `screenings` FOR EACH ROW BEGIN
DECLARE done INT DEFAULT 0;
DECLARE s_hid INT;
DECLARE s_day DATE;
DECLARE s_time TIME;
DECLARE s_duration INT;
DECLARE s_mid INT;
DECLARE s_available_date DATE;
DECLARE s_expiration_date DATE;
DECLARE new_duration INT;
DECLARE cur CURSOR FOR SELECT hid, day, time, duration, mid, available_date, expiration_date FROM screenings JOIN movies USING (mid);
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
SELECT duration INTO new_duration FROM movies WHERE mid = NEW.mid;
OPEN cur;
read_loop: LOOP
    FETCH cur INTO s_hid, s_day, s_time, s_duration, s_mid, s_available_date, s_expiration_date; 
    IF done THEN
        LEAVE read_loop;  
    END IF;
    IF (NEW.hid = s_hid AND NEW.day = s_day AND
    ((NEW.time BETWEEN s_time AND s_time + INTERVAL s_duration MINUTE + INTERVAL 30 MINUTE) OR
    (NEW.time + INTERVAL new_duration MINUTE BETWEEN s_time - INTERVAL 30 MINUTE AND s_time + INTERVAL s_duration MINUTE)
    OR (NEW.time <= s_time AND NEW.time + INTERVAL new_duration MINUTE >= s_time + INTERVAL s_duration MINUTE))
    OR (NEW.mid = s_mid AND (NEW.day <= s_available_date OR NEW.day >= s_expiration_date)))
    THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='NIE MOŻNA DODAĆ TEGO SEANSU';
    END IF;
END LOOP;
CLOSE cur; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tickets`
--

CREATE TABLE `tickets` (
  `tid` int NOT NULL,
  `sid` int NOT NULL,
  `tier` int NOT NULL,
  `seat` int NOT NULL,
  `price` float NOT NULL,
  `delivery` varchar(255) NOT NULL,
  `payment` varchar(255) NOT NULL,
  `uid` int DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street_number` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `tickets`
--

INSERT INTO `tickets` (`tid`, `sid`, `tier`, `seat`, `price`, `delivery`, `payment`, `uid`, `email`, `name`, `surname`, `street`, `street_number`, `postcode`, `city`, `phone_number`) VALUES
(1, 18, 6, 10, 20, 'collection', 'by-collection', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(2, 20, 7, 10, 20, 'collection', 'by-collection', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(3, 20, 7, 9, 20, 'collection', 'by-collection', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(4, 13, 3, 10, 20, 'collection', 'by-collection', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(5, 19, 11, 12, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(6, 19, 11, 13, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(7, 18, 6, 9, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(8, 18, 6, 8, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(9, 18, 6, 7, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(10, 13, 5, 8, 20, 'e-ticket', 'transfer', 0, 'filip.krakow@wp.pl', 'Filip', 'Kowalski', 'Urzędnicza', '18/8', '31-080', 'Kraków', '508649501'),
(11, 13, 5, 7, 20, 'e-ticket', 'transfer', 0, 'filip.krakow@wp.pl', 'Filip', 'Kowalski', 'Urzędnicza', '18/8', '31-080', 'Kraków', '508649501'),
(12, 15, 3, 8, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(13, 15, 3, 9, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(14, 20, 2, 5, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(15, 20, 10, 13, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(16, 19, 8, 10, 20, 'collection', 'by-collection', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(17, 19, 7, 9, 20, 'collection', 'by-collection', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(18, 19, 5, 4, 20, 'collection', 'by-collection', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(19, 19, 12, 9, 20, 'collection', 'by-collection', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(20, 14, 5, 9, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(21, 14, 5, 8, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(22, 12, 9, 11, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(23, 12, 10, 12, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(24, 15, 4, 12, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(25, 15, 4, 11, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(26, 20, 2, 7, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(27, 20, 2, 8, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(28, 18, 6, 11, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(29, 18, 5, 11, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(30, 18, 4, 11, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(31, 18, 4, 10, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(32, 18, 5, 10, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(33, 18, 5, 9, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(34, 18, 4, 9, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(35, 18, 4, 8, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(36, 18, 5, 8, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(37, 18, 4, 12, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(38, 18, 5, 12, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(39, 18, 6, 12, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(40, 18, 5, 13, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(41, 18, 6, 13, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(42, 18, 4, 13, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(43, 15, 4, 6, 20, 'e-ticket', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(44, 15, 5, 6, 20, 'e-ticket', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(45, 15, 5, 5, 20, 'e-ticket', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(46, 15, 10, 10, 20, 'e-ticket', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(47, 16, 4, 9, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(48, 16, 4, 10, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(49, 16, 4, 11, 20, 'collection', 'transfer', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(50, 11, 8, 12, 20, 'collection', 'by-collection', 4, 'zofia.nowakowa@onet.pl', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(51, 12, 5, 11, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(52, 12, 6, 12, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(53, 12, 6, 13, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(54, 18, 5, 6, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(55, 18, 4, 5, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(56, 18, 5, 4, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(57, 18, 6, 3, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(58, 18, 7, 2, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(59, 18, 8, 3, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(60, 18, 9, 4, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(61, 18, 10, 5, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(62, 18, 9, 6, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(63, 18, 8, 7, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(64, 18, 7, 8, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(65, 19, 6, 6, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(66, 19, 6, 7, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(67, 19, 6, 8, 20, 'collection', 'by-collection', 0, 'kac@kac.kac', 'fgsd', 'sfdzs', 'sdfsa', '12', '34-567', 'krakow', '123456789'),
(68, 19, 5, 6, 20, 'e-ticket', 'transfer', 3, 'kac@kac.kac', 'Kacper', 'jabl', 'ul. ask', '12/2', '23-456', 'kety', '123456789'),
(69, 19, 4, 6, 20, 'e-ticket', 'transfer', 3, 'kac@kac.kac', 'Kacper', 'jabl', 'ul. ask', '12/2', '23-456', 'kety', '123456789'),
(70, 19, 4, 7, 20, 'e-ticket', 'transfer', 3, 'kac@kac.kac', 'Kacper', 'jabl', 'ul. ask', '12/2', '23-456', 'kety', '123456789'),
(71, 19, 5, 7, 20, 'e-ticket', 'transfer', 3, 'kac@kac.kac', 'Kacper', 'jabl', 'ul. ask', '12/2', '23-456', 'kety', '123456789'),
(72, 19, 6, 5, 20, 'e-ticket', 'transfer', 3, 'kac@kac.kac', 'Kacper', 'jabl', 'ul. ask', '12/2', '23-456', 'kety', '123456789'),
(73, 19, 3, 11, 20, 'collection', 'by-collection', 3, 'kac@kac.kac', 'Kacper', 'jabl', 'ul. ask', '12/2', '23-456', 'kety', '123456789'),
(74, 22, 6, 5, 20, 'collection', 'transfer', 5, 'bananplb@gmail.com', 'Marek', 'Irla', 'ul. Przedsiębiorczego ', '2', '28-100', 'Busko-Zdrój', '5079462358'),
(75, 22, 6, 6, 20, 'collection', 'transfer', 5, 'bananplb@gmail.com', 'Marek', 'Irla', 'ul. Przedsiębiorczego ', '2', '28-100', 'Busko-Zdrój', '5079462358'),
(76, 26, 12, 1, 20, 'e-ticket', 'transfer', 5, 'bananplb@gmail.com', 'Marek', 'Irla', 'ul. Przedsiębiorczego ', '2', '28-100', 'Busko-Zdrój', '5079462358'),
(77, 26, 12, 2, 20, 'e-ticket', 'transfer', 5, 'bananplb@gmail.com', 'Marek', 'Irla', 'ul. Przedsiębiorczego ', '2', '28-100', 'Busko-Zdrój', '5079462358'),
(81, 49, 4, 7, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(82, 49, 4, 8, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(83, 49, 7, 10, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(84, 49, 7, 11, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(85, 47, 10, 7, 20, 'e-ticket', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(86, 47, 10, 8, 20, 'e-ticket', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(87, 40, 4, 9, 20, 'e-ticket', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(88, 40, 4, 8, 20, 'e-ticket', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(89, 18, 7, 5, 20, 'e-ticket', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(90, 54, 6, 8, 20, 'e-ticket', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(91, 54, 6, 9, 20, 'e-ticket', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(92, 57, 3, 10, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(93, 57, 3, 11, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(94, 22, 4, 10, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(95, 22, 4, 7, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(96, 22, 4, 6, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(97, 22, 4, 9, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(98, 22, 4, 8, 20, 'collection', 'transfer', 6, 'grzesiek@poczta.com', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(99, 55, 8, 12, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(100, 55, 7, 12, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(101, 55, 7, 13, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(102, 55, 8, 13, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(103, 29, 9, 11, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(104, 29, 8, 11, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(105, 29, 7, 11, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(106, 29, 6, 11, 20, 'e-ticket', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(107, 41, 7, 10, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(108, 41, 7, 11, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(109, 44, 4, 13, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(110, 44, 6, 11, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(111, 44, 6, 12, 20, 'collection', 'transfer', 1, 'gunia.amadeusz@gmail.com', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(112, 57, 6, 7, 20, 'collection', 'transfer', 12, 'agunia@student.agh.edu.pl', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(113, 57, 6, 8, 20, 'collection', 'transfer', 12, 'agunia@student.agh.edu.pl', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `uid` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street_number` varchar(255) NOT NULL,
  `postcode` varchar(6) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone_number` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`uid`, `email`, `password`, `name`, `surname`, `street`, `street_number`, `postcode`, `city`, `phone_number`) VALUES
(1, 'gunia.amadeusz@gmail.com', '$2y$10$byT5axvVLuaIg1azhcWrVub9V5kCNsRh1EKZ7yQ7.aXluRqUUrxuq', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230'),
(4, 'zofia.nowakowa@onet.pl', '$2y$10$X2CocZuuMmmjJa8TiA8i0uluHFz7qLlRiVz4QcTEmC26pQOsQYnmW', 'Zofia', 'Nowak', 'Bora Komorowskiego', '39a', '31-876', 'Kraków', '773185645'),
(6, 'grzesiek@poczta.com', '$2y$10$UIHOaRefd2QxXsA.nDA9m.sKWiGYFI2xHuXlhpX1dd5wrIe2sulLO', 'Grzegorz', 'Kukła', 'Mogilska', '118', '31-876', 'Kraków', '508444629'),
(12, 'agunia@student.agh.edu.pl', '$2y$10$/qrVc4oEf9EeanLRx3ayQesjxmEylvaGFSmNLBw4VVCfqB.GKLKU6', 'Amadeusz', 'Gunia', 'os. Sikorskiego', '2/2', '35-150', 'Brzesko', '808456230');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`hid`);

--
-- Indeksy dla tabeli `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`mid`);

--
-- Indeksy dla tabeli `screenings`
--
ALTER TABLE `screenings`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `hall_idx` (`hid`),
  ADD KEY `movies_idx` (`mid`);

--
-- Indeksy dla tabeli `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`tid`),
  ADD UNIQUE KEY `unique_ticket` (`sid`,`tier`,`seat`),
  ADD KEY `seance_idx` (`sid`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `inbox`
--
ALTER TABLE `inbox`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `screenings`
--
ALTER TABLE `screenings`
  MODIFY `sid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT dla tabeli `tickets`
--
ALTER TABLE `tickets`
  MODIFY `tid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `screenings`
--
ALTER TABLE `screenings`
  ADD CONSTRAINT `hall` FOREIGN KEY (`hid`) REFERENCES `halls` (`hid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie` FOREIGN KEY (`mid`) REFERENCES `movies` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `seance` FOREIGN KEY (`sid`) REFERENCES `screenings` (`sid`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
