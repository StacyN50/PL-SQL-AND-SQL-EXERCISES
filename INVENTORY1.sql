--PROCEDURE
create or replace PROCEDURE ADD_CUSTOMER(
c_id IN OUT number,
c_fname IN VARCHAR2,
c_lname IN VARCHAR2,
c_mname IN VARCHAR2,
c_add1  IN VARCHAR2,
c_add2 IN VARCHAR2,
c_city IN VARCHAR2,
c_country IN VARCHAR2,
c_date_added IN DATE,
c_region IN VARCHAR2
)
AS

BEGIN
    INSERT INTO CUSTOMER(customer_id,first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region)
    VALUES(c_id,c_fname,c_lname,c_mname,c_add1,c_add2,c_city,c_country,c_date_added,c_region);  
    COMMIT;
    dbms_output.put_line('Data successfully inserted');
    
    select COUNT(1) INTO c_id from CUSTOMER;
END ADD_CUSTOMER;


--Method 1 of calling a procedure
BEGIN
    add_customer(
    c_id => 32,
    c_fname => 'JEFF',
    c_lname => 'AFONSO',
    c_mname => 'A',
    c_add1 =>  '24 SUNREE DRIVE',
    c_add2 => NULL,
    c_city => 'ALPHARETTAS',
    c_country => 'USA',
    c_date_added => sysdate,
    c_region =>  'SOUTH');
END;


DECLARE
t_count NUMBER(10) := 45;
--Method 2 of calling a procedure
BEGIN
ADD_CUSTOMER(t_count,'BRUCE','AFONSO','A','24 SUNREE DRIVE',NULL,'ALPHARETTAS','USA',sysdate,'SOUTH');
dbms_output.put_line('Total records:' || t_count);
END;

--Function
create or replace function find_salescount(
    p_sales_date IN date
    )
    RETURN NUMBER
AS
   num_of_sales NUMBER := 0;
   
BEGIN
  SELECT COUNT(*) INTO num_of_sales from SALES
  WHERE trunc(sales_date) = trunc(p_sales_date);
  
  RETURN num_of_sales;
END find_salescount;

select * from sales;

--Calling a function(method 1)
select find_salescount(to_date('2015-01-01','YYYY-MM-DD')) from DUAL;

--Method 2
DECLARE
SCOUNT NUMBER := 0;

BEGIN
SCOUNT := find_salescount(to_date('2015-01-01','YYYY-MM-DD'));
dbms_output.put_line(SCOUNT);
END;

select * from sales;

/*Write a procedure to fetch data from table SALES for a given parameter orderid and 
display the data. */
--Method 1
--Compile the procedure
CREATE OR REPLACE PROCEDURE alter_sales (
   ordered_id     IN  NUMBER,
   total_sales    OUT NUMBER
)
AS
BEGIN
 -- Count total number of sales
   SELECT COUNT(*) INTO total_sales FROM SALES 
   where order_id = 1101;
   
      -- Display matching sales details
FOR rec IN(
   select ORDER_ID,SALES_DATE,TOTAL_AMOUNT
   from SALES
   where ORDER_ID = ordered_id
   )
   
   LOOP
    dbms_output.put_line('Order id:' || rec.ORDER_ID);
    dbms_output.put_line('Sales date:' || rec.SALES_DATE);
    dbms_output.put_line('Total Amount:' || rec.TOTAL_AMOUNT);
   END LOOP;
END alter_sales;

--Call the procedure
DECLARE
   v_ordered_id NUMBER := 1101;
   v_total_sales NUMBER;
   
BEGIN
   alter_sales(v_ordered_id,v_total_sales);
   DBMS_OUTPUT.PUT_LINE('Total sales for' || v_ordered_id || ':' || v_total_sales);
END;

--Method 2
--Complie the procedure
CREATE OR REPLACE PROCEDURE fetch_sales_data (
   p_order_id IN NUMBER
)
AS
    v_order_id    SALES.ORDER_ID%TYPE;
   v_sales_date  SALES.SALES_DATE%TYPE;
   v_amount      SALES.TOTAL_AMOUNT%TYPE;
   
BEGIN
   SELECT ORDER_ID, SALES_DATE, TOTAL_AMOUNT
   INTO v_order_id, v_sales_date, v_amount
   FROM SALES
   WHERE ORDER_ID = p_order_id;
   
   DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_id);
   DBMS_OUTPUT.PUT_LINE('Sales Date: ' || v_sales_date);
   DBMS_OUTPUT.PUT_LINE('Order Amount: ' || v_amount);

EXCEPTION
WHEN no_data_found then
   DBMS_OUTPUT.PUT_LINE('No data found');
WHEN too_many_rows then
   DBMS_OUTPUT.PUT_LINE('Too many rows');
WHEN access_into_null then
   DBMS_OUTPUT.PUT_LINE('Access into null');
WHEN CASE_NOT_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('Case not found');
END fetch_sales_data;

--Calling the procedure
DECLARE
  v_order_id NUMBER;
BEGIN
    fetch_sales_data(1001);
END;
select * from sales;
/*Write a procedure which does the following operations,Return the number of rows(using OUT parameter) in the SALES table for that 
sales date (get sales date from the above operation) */
--Compiling procedure
CREATE OR REPLACE PROCEDURE count_sales_by_date (
   p_sales_date     IN  DATE,
   p_sales_count    OUT NUMBER
)
AS
BEGIN
   SELECT COUNT(*) INTO p_sales_count
   FROM SALES
   WHERE TRUNC(sales_date) = TRUNC(p_sales_date);
   
EXCEPTION
WHEN no_data_found then
   DBMS_OUTPUT.PUT_LINE('No data found');
WHEN too_many_rows then
   DBMS_OUTPUT.PUT_LINE('Too many rows');
WHEN access_into_null then
   DBMS_OUTPUT.PUT_LINE('Access into null');
WHEN CASE_NOT_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('Case not found');
END;
  
 --Fetch order id
 DECLARE
    date_of_sales DATE := TO_DATE('2015-01-01', 'YYYY-MM-DD');
   total_sales   NUMBER;
BEGIN
   -- Call the procedure
   count_sales_by_date(date_of_sales, total_sales);

   -- Output result
   DBMS_OUTPUT.PUT_LINE('Total rows with sales date ' || date_of_sales || ' : ' || total_sales);
   
END;
  