CREATE DATABASE minitask4;
SELECT current_database();

CREATE TABLE Directors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE Genres (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Movies (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date TIMESTAMP NOT NULL,
    rating FLOAT(24),
    director_id INT NOT NULL,
    genre_id INT NOT NULL,

    FOREIGN KEY (director_id) REFERENCES Directors(id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id)
);

CREATE TABLE Actors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255)
);

CREATE TABLE Movies_Actors (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    role VARCHAR(100) NOT NULL,

    FOREIGN KEY (movie_id) REFERENCES Movies(id),
    FOREIGN KEY (actor_id) REFERENCES Actors(id)
);

INSERT INTO Directors (first_name, last_name)
VALUES
    ('Christopher', 'Nolan'),
    ('Greta', 'Gerwig'),
    ('Quentin', 'Tarantino'),
    ('Bong', 'Joon-ho'),
    ('Niki', 'Caro');

INSERT INTO Genres (name)
VALUES
    ('Sci-Fi'),
    ('Drama'),
    ('Action'),
    ('Comedy'),
    ('Thriller');

INSERT INTO Movies (title, release_date, rating, director_id, genre_id)
VALUES
    ('Inception', '2010-07-16 00:00:00', 8.8, 1, 1),
    ('Interstellar', '2014-11-07 00:00:00', 8.7, 1, 1),
    ('Lady Bird', '2017-11-03 00:00:00', 7.4, 2, 2),
    ('Parasite', '2019-05-30 00:00:00', 8.5, 4, 5),
    ('Mulan', '2020-09-04 00:00:00', 5.8, 5, 3);

INSERT INTO Actors (first_name, last_name)
VALUES
    ('Leonardo', 'DiCaprio'),
    ('Cillian', 'Murphy'),
    ('Saoirse', 'Ronan'),
    ('Song', 'Kang-ho'),
    ('Anne', 'Hathaway'),
    ('Mayes', 'Hathaway');

INSERT INTO Movies_Actors (movie_id, actor_id, role)
VALUES
    (1, 1, 'Cobb'),
    (1, 2, 'Robert Fischer'),
    (2, 5, 'Brand'),
    (3, 3, 'Christine McPherson'),
    (4, 4, 'Kim Ki-taek');

-- Mengambil data movie yang rilis di tahun 2020
SELECT title, release_date, rating, director_id, genre_id
FROM Movies
WHERE extract(year FROM release_date) = 2020;

-- Mengambil list aktor yang memiliki firstname berakhiran s
SELECT first_name, last_name
FROM Actors
WHERE first_name LIKE '%s';

-- Mengambil data movie dengan rating minimum 4 dan maksimal 8 yang rilis pada tahun 2004-2010
SELECT title, release_date, rating, director_id, genre_id
FROM Movies
WHERE rating BETWEEN 4 AND 8;