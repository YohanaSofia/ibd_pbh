WITH metricas_rua AS (
    SELECT 
        regional,
        COUNT(*) AS total,
		
        SUM(CASE WHEN grau_instrucao ILIKE '%Fundamental incompleto%' OR grau_instrucao ILIKE '%Sem instrução%' THEN 1 ELSE 0 END) AS baixa_escolaridade
    FROM populacao_rua_bh
    GROUP BY regional
),
metricas_cadunico AS (
    SELECT 
        regional,
        COUNT(*) AS total,
        SUM(CASE WHEN grau_instrucao ILIKE '%Fundamental incompleto%' OR grau_instrucao ILIKE '%Sem instrução%' THEN 1 ELSE 0 END) AS baixa_escolaridade
    FROM pessoas_cadunico
    GROUP BY regional
)
SELECT 
    r.regional,

    ROUND((r.baixa_escolaridade::numeric / r.total) * 100, 1) || '%' AS pct_baixa_edu_RUA,
    ROUND((c.baixa_escolaridade::numeric / c.total) * 100, 1) || '%' AS pct_baixa_edu_GERAL
FROM 
    metricas_rua r
JOIN 
    metricas_cadunico c ON UPPER(r.regional) = UPPER(c.regional)
ORDER BY 
    r.regional;