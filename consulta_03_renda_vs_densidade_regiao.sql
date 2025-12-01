SELECT 
    geo.nome AS regional,

    'R$ ' || ROUND(AVG(cad.val_remuneracao_mes_passado), 2) AS renda_media_declarada,
    ROUND(geo.densidade_demografica, 0) AS densidade_demografica_censo
FROM 
    regiao_administrativa_tb geo
JOIN 
    pessoas_cadunico cad ON UPPER(geo.nome) = UPPER(cad.regional)
GROUP BY 
    geo.nome, geo.densidade_demografica
ORDER BY 
    geo.densidade_demografica DESC;