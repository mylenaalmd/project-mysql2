SELECT 
	S.`name` AS nome_musica,
CASE 
	WHEN S.`name` LIKE '%Bard%' THEN REPLACE(S.`name`, 'Bard', 'QA')
    WHEN S.`name` LIKE '%Amar%' THEN REPLACE(S.`name`, 'Amar', 'Code Review')
    WHEN S.`name` LIKE '%Pais%' THEN REPLACE(S.`name`, 'Pais', 'Pull Requests')
    WHEN S.`name` LIKE '%SOUL%' THEN REPLACE(S.`name`, 'SOUL', 'CODE')
    WHEN S.`name` LIKE '%SUPERSTAR%' THEN REPLACE(S.`name`, 'SUPERSTAR', 'SUPERDEV')
END AS novo_nome
FROM SpotifyClone.songs S 
HAVING novo_nome IS NOT NULL
ORDER BY S.`name` DESC;
    