# SQL commands

### If

```sql
SELECT IF(500<1000, "YES", "NO");
```

### Case

```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END AS ALIAS; 
```

## Join

#### Inner

```sql
SELECT *
FROM table1 AS tb1
	JOIN table2 AS tb2
    ON tb1.primaryKey = tb2.foreginKey
```

#### Left join

```sql
SELECT *
FROM A
	LEFT JOIN B
    ON A.key = B.key
```

#### Exclusive left join

```sql
SELECT *
FROM A
	LEFT JOIN B
    ON A.key = B.key
    WHERE B.key IS NULL
```

#### Full join

```sql
SELECT *
FROM A
	FULL JOIN B ON A.key = B.key
```

#### Outer full join

```sql
SELECT *
FROM A
	FULL JOIN B ON A.key = B.key
	WHERE A.key IS NULL
	OR B.key IS NULL
```

## Where

```sql
SELECT *
FROM table
WHERE id = 1;

SELECT *
FROM table
WHERE id > 1;

SELECT *
FROM table
WHERE id < 1;
```

### AND - OR - BETWEEN 

```sql
SELECT *
FROM table
WHERE id > 10
	AND id < 100;

SELECT *
FROM table
WHERE id BETWEEN 10 AND 100;

SELECT *
FROM users
WHERE name = "someName"
	and (
        lastname = "lastname1"
        OR
        lastname = "lastname2"
    );
```

### LIKE

```sql
SELECT *
FROM users
WHERE name LIKE "Is%"

SELECT *
FROM users
WHERE name LIKE "Is_ael%"  /* en _ puede ir cualquier caracter*/

SELECT *
FROM users
WHERE name NOT LIKE "Is_ael%"
```

### IS - IN

```sql
SELECT *
FROM users
WHERE name IS NULL;

SELECT *
FROM users
WHERE name IS NOT NULL;

SELECT *
FROM users
WHERE name IN ('NAME1', 'NAME2', 'NAME3');
```

## ORDER BY

```SQL
SELECT *
FROM table
ORDER BY date;

SELECT *
FROM table
ORDER BY date ASC;

SELECT *
FROM table
ORDER BY date DESC;
```

## GROUP BY - LIMIT

```SQL
SELECT *
FROM table
GROUP BY name

SELECT *
FROM table
OFFSET 1500
LIMIT 10000
```

## Distinct

Is used to return only distinct (different) values.

```sql
SELECT DISTINCT column1, column2, ...
FROM table_name;
```

## Window functions

[PostgreSQL's documentation](https://www.postgresql.org/docs/current/tutorial-window.html)

A *window function* performs a calculation across a set of table rows that are somehow related to the current row. This is comparable to the type of calculation that can be done with an aggregate function. However, window functions do not cause rows to become grouped into a single output row like non-window aggregate calls would. Instead, the rows retain their separate identities. Behind the scenes, the window function is able to access more than just the current row of the query result.

```sql
SELECT coulmn_name1, 
 window_function(cloumn_name2)
 OVER([PARTITION BY column_name1] [ORDER BY column_name3]) AS new_column
FROM table_name;
```

