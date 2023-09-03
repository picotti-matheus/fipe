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