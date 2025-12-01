SELECT 
    geo.nome AS regional,
    COUNT(rua._id) AS total_pessoas_rua,
    geo.area_km AS area_regional_km2,
    ROUND(COUNT(rua._id)::numeric / NULLIF(geo.area_km, 0), 2) AS densidade_rua_por_km2
FROM 
    regiao_administrativa_tb geo
INNER JOIN 
    populacao_rua_bh rua ON UPPER(geo.nome) = UPPER(rua.regional)
GROUP BY 
    geo.nome, geo.area_km
ORDER BY 
    densidade_rua_por_km2 DESC;