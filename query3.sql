-- Menampilkan list director beserta banyaknya genre yang sudah di-direct
SELECT concat(d.first_name, ' ', d.last_name) AS fullname, count(DISTINCT g.id) AS "COUNT GENRE"
FROM Movies m
JOIN Directors d On m.director_id = d.id
JOIN Genres g ON m.genre_id = g.id
GROUP BY fullname;

-- Menampilkan list aktor dengan peran lebih dari 5
SELECT concat(a.first_name, ' ', a.last_name) AS "actor name", count(ma.role) AS total
FROM Movies_Actors ma
JOIN Actors a ON a.id = ma.actor_id
JOIN Movies m ON ma.movie_id = m.id
GROUP BY "actor name"
HAVING COUNT(ma.role) > 5;

-- Menampilkan director yang paling produktif sepanjang masa
SELECT concat(d.first_name, ' ', d.last_name) AS fullname, count(m.id) AS total
FROM Directors d
JOIN Movies m ON d.id = m.director_id
GROUP BY fullname
ORDER BY total DESC
LIMIT 1;

-- Menampilkan tahun tersibuk sepanjang masa
SELECT COUNT(extract(year FROM release_date)) AS "total movies releases", extract(year FROM release_date) AS "the busiest year"
FROM Movies
GROUP BY extract(year FROM release_date)
ORDER BY "total movies releases" DESC
LIMIT 1;

-- Mendapatkan data movies dengan list actors yang disatukan menjadi 1 kolom (dipisahkan dengan koma) dengan menggunakan string_agg
SELECT m.title, string_agg(DISTINCT concat(a.first_name, ' ', a.last_name), ', ')
FROM Movies_Actors ma
JOIN Movies m ON ma.movie_id = m.id
JOIN Actors a ON ma.actor_id = a.id
GROUP BY m.title;