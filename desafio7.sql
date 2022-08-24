SELECT 
	a.`name` AS artista, 
  b.`name` AS album,
  COUNT(s.artist_id) AS seguidores
FROM 
	SpotifyClone.artists a
INNER JOIN SpotifyClone.album b ON b.artist_id = a.artist_id
INNER JOIN SpotifyClone.follow s ON s.artist_id = a.artist_id
GROUP BY b.`name`, a.`name`
ORDER BY seguidores DESC, a.`name`, b.`name`;