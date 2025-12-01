SELECT 
    tempo_vive_na_rua,
    COUNT(*) AS total_pessoas,
    SUM(CASE WHEN contato_parente_fora_ruas <> 'Nunca' THEN 1 ELSE 0 END) AS tem_contato,

    ROUND(
        (SUM(CASE WHEN contato_parente_fora_ruas <> 'Nunca' THEN 1 ELSE 0 END)::numeric / COUNT(*)) * 100
    , 1) || '%' AS taxa_contato_familiar
FROM 
    populacao_rua_bh
GROUP BY 
    tempo_vive_na_rua
ORDER BY 
    CASE tempo_vive_na_rua
        WHEN 'Ate seis meses' THEN 1
        WHEN 'Entre seis meses e um ano' THEN 2
        WHEN 'Entre um e dois anos' THEN 3
        WHEN 'Entre dois e cinco anos' THEN 4
        WHEN 'Entre cinco e dez anos' THEN 5
        WHEN 'Mais de dez anos' THEN 6
        ELSE 7
    END;