create or replace procedure process_customer(
c_id IN customer.customer_id%TYPE)
IS
TYPE CUSTOMER_REC IS RECORD(
FIRST_NAME VARCHAR2(50),
LAST_NAME VARCHAR2(50)
);
c_rec CUSTOMER_REC;
TOTAL_ROWS NUMBER;

BEGIN
select FIRST_NAME,LAST_NAME INTO c_rec
FROM customer 
where customer_id = c_id;

c_rec.first_name := 'sonuj';

IF SQL%FOUND THEN
TOTAL_ROWS := SQL%ROWCOUNT;
DBMS_OUTPUT.PUT_LINE( TOTAL_ROWS || 'COLUMNS SELECTED');
END IF;

dbms_output.put_line('First name:' || c_rec.first_name);
dbms_output.put_line('Last name:' || c_rec.last_name);

END;

execute process_customer(45);


create or replace procedure show_customer(
customer_in IN customer%ROWTYPE
)
IS
BEGIN
UPDATE CUSTOMER
SET ROW = CUSTOMER_IN
WHERE CUSTOMER_ID = CUSTOMER_IN.CUSTOMER_ID;

END;

select * from customer WHERE CUSTOMER_ID = 45;
execute process_customer(45);