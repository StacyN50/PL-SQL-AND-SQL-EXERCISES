/*Write a function which accepts 2 numbers n1 and n2 and returns the power of n1 to n2. 
(Example: If I pass values 10 and 3, the output should be 1000)*/
CREATE OR REPLACE FUNCTION POWERS(
   BASE IN NUMBER,
   EXPONENT IN NUMBER
   )
   RETURN NUMBER
   AS  
      VALUE NUMBER;

BEGIN
   VALUE := BASE ** EXPONENT;
   RETURN VALUE;
END POWERS;

--Calling the function
DECLARE 
SCOUNT NUMBER := 0;
BEGIN
    SCOUNT := POWERS(10,3);
    dbms_output.put_line(SCOUNT);
END;


select * from sales;
/*Write a function to display the number of rows in the SALES table for a given sales date.*/
CREATE OR REPLACE FUNCTION ROWS_WITH_SIMILAR_DATE(
  date_of_sales IN DATE
)
RETURN NUMBER
AS
  total_row_count NUMBER;

BEGIN
 select COUNT(1) INTO total_row_count from sales
 WHERE sales_date = date_of_sales;
 
RETURN total_row_count;
END ROWS_WITH_SIMILAR_DATE;

--Call function
DECLARE
 sales_of_date DATE := TO_DATE('2015-01-01','YYYY-MM-DD');
 DATE_COUNT NUMBER;
 
BEGIN 
DATE_COUNT := ROWS_WITH_SIMILAR_DATE(sales_of_date);
dbms_output.put_line(DATE_COUNT);
END;

--Exceptions
CREATE OR REPLACE PROCEDURE GET_CUSTOMER(
  C_ID IN NUMBER
  )
  AS
  c_name customer.first_name%type;
  c_cntry customer.country%type;
  ex_customer_id EXCEPTION;
  
  BEGIN
  if c_id <= 0 then
  RAISE ex_customer_id;
  end if;
  
  select FIRST_NAME,COUNTRY INTO C_NAME,C_CNTRY
  FROM CUSTOMER
  WHERE CUSTOMER_ID = C_ID;
  
  dbms_output.put_line('Name: '|| c_name);
  dbms_output.put_line('Country:' || c_cntry);
  
  EXCEPTION
  WHEN ex_customer_id then
  dbms_output.put_line('Customer id is below zero');
  WHEN no_data_found then
  dbms_output.put_line('No data found.');
  WHEN others then
  dbms_output.put_line('Other errors.');
  END;
  
  execute get_customer(-2);
  
  select * from customer order by customer_id;
  
