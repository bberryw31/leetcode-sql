CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
DECLARE M INT := N - 1;
BEGIN
IF (M < 0) THEN RETURN QUERY (SELECT NULL::INT);
ELSE RETURN QUERY (
    SELECT(
        SELECT DISTINCT e.salary 
        FROM Employee e 
        ORDER BY e.salary DESC 
        LIMIT 1 OFFSET M
        )      
  );
END IF;
END;
$$ LANGUAGE plpgsql;