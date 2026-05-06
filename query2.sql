table directors;
-- Menampilkan data gabungan antara directors dan genres ke dalam tabel movies, batasi output sebanyak 50 baris
SELECT d.first_name, d.last_name, g.name
FROM Movies m
JOIN Directors d ON m.director_id = d.id
JOIN Genres g ON m.genre_id = g.id
LIMIT 50;

-- Menampilkan data gabungan antara tabel movies dan actors berdasarkan tabel asosiasi movies_actors
SELECT m.title, m.release_date, m.rating, concat(a.first_name, ' ', a.last_name) AS fullname, ma.role
FROM Movies_Actors ma
JOIN Movies m ON ma.movie_id = m.id
JOIN Actors a ON ma.actor_id = a.id;