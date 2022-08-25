SELECT 
  S.`name` AS nome, 
  COUNT(S.song_id) AS reproducoes 
FROM 
  SpotifyClone.`history` H
INNER JOIN SpotifyClone.songs S ON S.song_id = H.song_id
INNER JOIN SpotifyClone.users U ON U.user_id = H.user_id
WHERE U.plan_id = 1 OR U.plan_id = 4
GROUP BY S.`name`
ORDER BY S.`name`;