SELECT 
	a.`name` AS artista, 
  b.`name` AS album
FROM 
	SpotifyClone.artists a
INNER JOIN SpotifyClone.album b ON b.artist_id = a.artist_id
WHERE a.`name` = 'Elis Regina'
ORDER BY b.`name`;