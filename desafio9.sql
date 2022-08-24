SELECT 
	COUNT(h.song_id) AS quantidade_musicas_no_historico
FROM 
	SpotifyClone.users u
INNER JOIN SpotifyClone.`history` h ON h.user_id = u.user_id
WHERE u.`name` = 'Barbara Liskov';