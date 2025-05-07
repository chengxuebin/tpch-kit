Copy region FROM '{{DATA_DIR}}/region.tbl' WITH DELIMITER AS '|';
Copy nation FROM '{{DATA_DIR}}/nation.tbl' WITH DELIMITER AS '|';
Copy part FROM '{{DATA_DIR}}/part.tbl' WITH DELIMITER AS '|';
Copy supplier FROM '{{DATA_DIR}}/supplier.tbl' WITH DELIMITER AS '|';
Copy customer FROM '{{DATA_DIR}}/customer.tbl' WITH DELIMITER AS '|';
Copy lineitem FROM '{{DATA_DIR}}/lineitem.tbl' WITH DELIMITER AS '|';
Copy partsupp FROM '{{DATA_DIR}}/partsupp.tbl' WITH DELIMITER AS '|';
Copy orders FROM '{{DATA_DIR}}/orders.tbl' WITH DELIMITER AS '|';