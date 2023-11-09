call lab8.least_flights();
SELECT * FROM least_flights;
ROLLBACK TO savepoint sve;
SELECT * FROM least_flights;