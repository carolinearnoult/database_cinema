CREATE DATABASE IF NOT EXISTS cinema utf8mb4 COLLATE utf8mb4_general_ci;

CREATE table cinema (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(150),
    city VARCHAR(50),
    zipCode INTEGER(10),
)

CREATE table movie (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    minutes INTEGER NOT NULL
)

CREATE table screen (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cinema_id INTEGER NOT NULL,
    name VARCHAR(50),
    seats INTEGER NOT NULL, 
)

CREATE table prices (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50),
    price FLOAT,
)

CREATE table reservation (
    cinema_id INTEGER NOT NULL,
    screen_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    prices_id INTEGER NOT NULL
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT fk_cinema FOREIGN KEY(cinema_id) REFERENCES cinema(id),
    CONSTRAINT fk_screen FOREIGN KEY(screen_id) REFERENCES screen(id),
    CONSTRAINT fk_movie FOREIGN KEY(movie_id) REFERENCES movie(id),
    CONSTRAINT fk_prices FOREIGN KEY(prices_id) REFERENCES prices(id)
)


INSERT INTO cinema (name) VALUES 
('CGR Bordeaux'), 
('CGR Bayonne'), 
('CGR Pau'),
('CGR Fontaine le Comte'),
('CGR Tarnos');

INSERT INTO movie (name, minutes) VALUES 
('spider-man: no way home', 148), 
('tous en scène ', 110), 
('the king\s man: première mission', 130), 
('Matrix', 148), 
('a perfect ennemy', 110);

INSERT INTO screen (cinema_id, name, seats) VALUES (1, '1', 120), (1, '2', 100), (1, '3', 130), (1, '4', 100);
INSERT INTO screen (cinema_id, name, seats) VALUES (2, 'Main Floor', 80), (2, 'Downstairs', 70), (2, 'Upstairs', 80);
INSERT INTO screen (cinema_id, name, seats) VALUES (3, '1', 200), (3, '2', 200), (3, '3', 200), (3, '4', 150);
INSERT INTO screen (cinema_id, name, seats) VALUES (4, NULL , 160);
INSERT INTO screen (cinema_id, name, seats) VALUES (5, '1', 120), (5, '2', 100), (5, '3', 130), (5, '4', 100);

INSERT INTO reservation (cinema_id, screen_id, movie_id, start_date, end_date) VALUES
    (1, 1, 1, DATE("2022-01-01"), DATE("2022-01-21")),
	(1, 2, 2, DATE("2022-01-01"), DATE("2022-01-21")),
	(1, 3, 3, DATE("2022-01-01"), DATE("2022-01-21")),
	(1, 4, 4, DATE("2022-01-01"), DATE("2022-01-21")),
	(2, 1, 5, DATE("2022-01-01"), DATE("2022-01-21")),
	(2, 2, 4, DATE("2022-01-01"), DATE("2022-01-21")),
	(2, 3, 1, DATE("2022-01-01"), DATE("2022-01-21")),
	(3, 1, 3, DATE("2022-01-01"), DATE("2022-01-21")),
	(3, 2, 6, DATE("2022-01-01"), DATE("2022-01-21")),
	(3, 3, 8, DATE("2022-01-01"), DATE("2022-01-21")),
	(3, 4, 1, DATE("2022-01-01"), DATE("2022-01-21")),
	(4, 1, 9, DATE("2022-01-01"), DATE("2022-01-21")),
	(5, 1, 5, DATE("2022-01-01"), DATE("2022-01-21")),
	(5, 2, 2, DATE("2022-01-01"), DATE("2022-01-21")),
	(5, 3, 4, DATE("2022-01-01"), DATE("2022-01-21")),
	(5, 4, 8, DATE("2022-01-01"), DATE("2022-01-21"));