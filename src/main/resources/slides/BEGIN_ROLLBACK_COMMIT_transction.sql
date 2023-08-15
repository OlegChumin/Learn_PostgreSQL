BEGIN;

UPDATE fine AS f1
    LEFT JOIN (
    SELECT name, number_plate, violation
    FROM fine
    GROUP BY name, number_plate, violation
    HAVING COUNT(violation) >= 2
    ) AS f2
ON f1.name = f2.name AND f1.number_plate = f2.number_plate AND f1.violation = f2.violation
    SET f1.sum_fine = f1.sum_fine * 2;

SELECT name,
       number_plate,
       violation,
       sum_fine,
       date_violation,
       date_payment
FROM fine
ORDER BY fine_id ASC;

ROLLBACK;
COMMIT;