DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `value_plan` DECIMAL(4,2) NOT NULL
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_id INT,
  `name` VARCHAR(100) NOT NULL,
  age INT NOT NULL,
  signature_date DATE,
  FOREIGN KEY (plan_id) REFERENCES plans (plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.follow(
  user_id INT,
  artist_id INT,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
  PRIMARY KEY (user_id, artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_id INT,
  `name` VARCHAR(50) NOT NULL,
  release_year YEAR,
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  album_id INT,
  `name` VARCHAR(50) NOT NULL,
  time_seconds INT,
  FOREIGN KEY (album_id) REFERENCES album (album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.`history`(
  song_id INT,
  user_id INT,
  reproduction_date DATETIME,
	FOREIGN KEY (song_id) REFERENCES songs (song_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
  PRIMARY KEY(song_id, user_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (`name`, `value_plan`)
VALUES 
  ('gratuito',	0.00),
  ('familiar', 7.99),
  ('universitario', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.users (plan_id, `name`, age,  signature_date)
VALUES
  (1, 'Barbara Liskov',	82, '2019-10-20'),
  (1, 'Robert Cecil Martin', 58, '2017-01-06'),
  (2, 'Ada Lovelace', 37, '2017-12-30'),
  (2,	'Martin Fowler', 46, '2017-01-17'),
  (2,	'Sandi Metz', 58, '2018-04-29'),
  (3,	'Paulo Freire',	19, '2018-02-14'),
  (3,	'Bell Hooks',	26, '2018-01-05'),
  (4,	'Christopher Alexander', 85,'2019-06-05'),
  (4, 'Judith Butler', 45, '2020-05-13'),
  (4,'Jorge Amado',	58,'2017-02-17');

INSERT INTO SpotifyClone.artists (`name`)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.follow (user_id ,artist_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);

INSERT INTO SpotifyClone.album (artist_id, `name`, release_year)
VALUES
  (1, 'Renaissance', '2022'),
  (2, 'Jazz',	'1978'),
  (2, 'Hot Space', '1982'),
  (3, 'Falso Brilhante', '1998'),
  (3,' Vento de Maio', '2001'),
  (4,	'QVVJFA?', '2003'),
  (5,	'Somewhere Far Beyond',	'2007'),
  (6,	'I Put A Spell On You',	'2012');

INSERT INTO SpotifyClone.songs (album_id, `name`, time_seconds)
VALUES
  (1, 'BREAK MY SOUL', 279),
  (1, 'VIRGO`S GROOVE', 369 ),
  (1, 'ALIEN SUPERSTAR', 116),
  (2, 'Don`t Stop Me Now', 203),
  (3, 'Under Pressure', 152),
  (4, 'Como Nossos Pais', 105),
  (5, 'O Medo de Amar é o Medo de Ser Livre', 207),
  (6, 'Samba em Paris', 267),
  (7, 'The Bard`s Song', 244),
  (8, 'Feeling Good', 100);

INSERT INTO SpotifyClone.`history` (song_id, user_id, reproduction_date)
VALUES
  (8, 1, '2022-02-28 10:45:55'),
  (2, 1,'2020-05-02 05:30:35'),
  (10, 1,'2020-03-06 11:22:33'),
  (10, 2,'2022-08-05 08:05:17'),
  (7, 2,'2020-01-02 07:40:33'),
  (10, 3,'2020-11-13 16:55:13'),
  (2, 3,'2020-12-05 18:38:30'),
  (8, 4, '2021-08-15 17:10:10'),
  (8,	5, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (7,	6,'2017-01-24 00:31:17'),
  (1, 6, '2017-10-12 12:35:20'),
  (4, 7,'2011-12-15 22:30:49'),
  (4, 8,'2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (3, 10,'2015-12-13 08:30:22');