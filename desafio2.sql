SELECT count(*) AS cancoes,
(SELECT count(*) FROM  SpotifyClone.artists) AS artistas,
(SELECT count(*) FROM  SpotifyClone.album) AS albuns
FROM SpotifyClone.songs;