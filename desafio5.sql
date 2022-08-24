SELECT U.`name` AS cancao, COUNT(H.song_id) AS reproducoes
FROM SpotifyClone.songs AS U 
INNER JOIN SpotifyClone.`history` AS H ON U.song_id = H.song_id
GROUP BY U.`name`
ORDER BY reproducoes DESC,
cancao ASC
LIMIT 2;