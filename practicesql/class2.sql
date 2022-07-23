SELECT DISTINCT colegiatura -- Brings different values in the tuition column
FROM platzi.alumnos AS al   -- a1.colegiatura = [2000, 4800, 1000, 5000, 3000]
WHERE 2 = (  -- position (2nd)
    SELECT COUNT(DISTINCT colegiatura)  
    FROM platzi.alumnos a2   -- a2.colegiatura = [2000, 4800, 1000, 5000, 3000]
    WHERE a1.colegiatura <= a2.colegiatura -- join
);


-- the second most expensive tuition for tutor


-- 1st option 

SELECT DISTINCT colegiatura,tutor_id 
FROM platzi.alumnos AS al   -- brings the different tuition fees for each tutor
-- example: 
-- 
-- colegiatura tutor_id
-- 2000	        3
-- 3500	        14
-- 2000	        26
-- 4500	        26
-- 2300	        24
-- 4800	        10
-- 4800	        20
-- 3000	        22
--
WHERE tutor_id = 20      --  filter according to tutor_id = 20       

-- colegiatura tutor_id
-- 2000	        3
-- 3500	        14
-- 2000	        26
-- 4500	        26
-- 2300	        24
-- 4800	        10
-- 4800	        20
-- 3000	        22

ORDER BY colegiatura DESC  -- order descendent 
LIMIT 1 OFFSET 1;          -- the second most expensive tuition


-- 2nd option 

SELECT *
FROM  platzi.alumnos AS datos_alumnos
INNER JOIN (
    SELECT DISTINCT colegiatura
    FROM platzi.alumnos
    WHERE tutor_id = 20
    ORDER BY colegiatura DESC
    LIMIT 1 OFFSET 1
) AS second
ON datos_alumnos.colegiatura = second.colegiatura;


-- 3rd option 

SELECT *
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
    SELECT DISTINCT colegiatura
    FROM platzi.alumnos
    WHERE tutor_id = 20
    ORDER BY colegiatura DESC
    LIMIT 1 OFFSET 1;
)