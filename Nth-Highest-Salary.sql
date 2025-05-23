CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      WITH CTE AS (
        SELECT *,DENSE_RANK() OVER(ORDER BY Salary DESC) AS rnk FROM employee
      )
      SELECT DISTINCT IFNULL(salary,NULL) FROM CTE WHERE rnk=N
  );
END