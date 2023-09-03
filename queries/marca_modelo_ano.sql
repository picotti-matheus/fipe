with anos as (
SELECT
    t1.code_marca AS id_marca,
    t1.code_modelos as id_modelo,
    t1.ano_modelo,
    t2.brand,
    t2.model,
    t2.codeFipe
FROM ano_modelos_marcas AS t1
LEFT JOIN codigo_fipe_modelos_marcas AS t2
    on t2.code_marca = t1.code_marca
    and t2.code_modelos = t1.code_modelos
),
marca_modelo as (
SELECT
    t2.code_marcas AS id_marca,
    t1.name AS marca,
    t2.code_modelo AS id_modelo,
    t2.name AS nome_modelo
FROM marca_fipe AS t1
LEFT JOIN modelos_fipe AS t2
    ON t2.code_marcas = t1.code
)
SELECT DISTINCT
    mm.*,
    a.ano_modelo
FROM marca_modelo AS mm
LEFT JOIN anos as a
    on a.id_marca = mm.id_marca
    and a.id_modelo = mm.id_modelo
