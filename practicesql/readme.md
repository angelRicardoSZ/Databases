### SQL commands

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

### Join

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

