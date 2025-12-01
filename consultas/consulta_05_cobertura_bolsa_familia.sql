WITH beneficio_rua AS (
    SELECT regional, COUNT(*) as total,
           SUM(CASE WHEN bolsa_familia = 'SIM' THEN 1 ELSE 0 END) as com_beneficio
    FROM populacao_rua_bh GROUP BY regional
),
beneficio_cad AS (
    SELECT regional, COUNT(*) as total,
           SUM(CASE WHEN auxilio_brasil = 'SIM' THEN 1 ELSE 0 END) as com_beneficio
    FROM pessoas_cadunico GROUP BY regional
)
SELECT 
    r.regional,
    ROUND((r.com_beneficio::numeric / r.total) * 100, 1) || '%' AS cobertura_RUA,
    ROUND((c.com_beneficio::numeric / c.total) * 100, 1) || '%' AS cobertura_CADUNICO,
    ROUND(((c.com_beneficio::numeric / c.total) - (r.com_beneficio::numeric / r.total)) * 100, 1) || '%' AS gap_diferenca
FROM 
    beneficio_rua r
JOIN 
    beneficio_cad c ON UPPER(r.regional) = UPPER(c.regional)
ORDER BY 
    r.regional;