SELECT U.`name` AS usuario, COUNT(H.song_id) AS qt_de_musicas_ouvidas, ROUND(SUM(S.time_seconds) / 60, 2) AS total_minutos FROM SpotifyClone.`history` AS H
INNER JOIN SpotifyClone.users AS U ON H.user_id = U.user_id
INNER JOIN SpotifyClone.songs AS S ON H.song_id = S.song_id
GROUP BY usuario
ORDER BY usuario;
