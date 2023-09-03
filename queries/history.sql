WITH code_marca_modelo as (
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
history as (
SELECT
    t1.codeFipe,
    t1.brand,
    t1.model,
    t1.modelYear,
    t1.month,
    t1.price,
    t1.ano_modelo
FROM precos_ano_modelo_marca AS t1
)
SELECT DISTINCT
    h.*,
    id_marca,
    id_modelo
FROM history as h
LEFT JOIN code_marca_modelo AS c
    ON c.codeFipe = h.codeFipe
    AND c.brand = h.brand
    AND c.model = h.model