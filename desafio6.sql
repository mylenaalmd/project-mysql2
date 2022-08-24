SELECT 
	MIN(p.value_plan) AS faturamento_minimo, 
  MAX(p.value_plan) AS faturamento_maximo,
  ROUND(SUM(p.value_plan)/COUNT(u.user_id), 2) AS faturamento_medio,
  SUM(p.value_plan) AS faturamento_total
FROM 
  SpotifyClone.plans AS p
INNER JOIN SpotifyClone.users AS u ON u.plan_id = p.plan_id;