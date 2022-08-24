SELECT u.`name` usuario, IF(MAX(h.reproduction_date) > '2021-01-01', 'Usuário ativo', 'Usuário inativo') status_usuario
FROM SpotifyClone.`history` h
INNER JOIN SpotifyClone.users u ON h.user_id = u.user_id
GROUP BY u.`name`
ORDER BY u.`name`;