/*Write a procedure to fetch data from table SALES for a given parameter orderid and 
display the data(use ROWTYPE to capture the data) */
create or replace PROCEDURE fetch_data (
   p_order_id IN sales.order_id%TYPE
)
AS

c_rec sales%ROWTYPE;
BEGIN
   SELECT *
   INTO c_rec
   FROM SALES
   WHERE ORDER_ID = p_order_id;

   DBMS_OUTPUT.PUT_LINE('Order ID: ' || c_rec.order_id);
   DBMS_OUTPUT.PUT_LINE('Sales Date: ' || c_rec.sales_date);
   DBMS_OUTPUT.PUT_LINE('Order Amount: ' || c_rec.total_amount);

COPY(C_REC);
EXCEPTION
WHEN no_data_found then
   DBMS_OUTPUT.PUT_LINE('No data found');
WHEN too_many_rows then
   DBMS_OUTPUT.PUT_LINE('Too many rows');
WHEN access_into_null then
   DBMS_OUTPUT.PUT_LINE('Access into null');
WHEN CASE_NOT_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('Case not found');
END fetch_data;

BEGIN
fetch_data(1268);
END;

/*Modify the above procedure to return the row you have stored in the ROWTYPE 
variable using an OUT parameter.  */
create or replace PROCEDURE fetch_data (
   p_order_id IN sales.order_id%TYPE,
   c_rec OUT sales%ROWTYPE
)
AS
BEGIN
   SELECT *
   INTO c_rec
   FROM SALES
   WHERE ORDER_ID = p_order_id;

   DBMS_OUTPUT.PUT_LINE('Order ID: ' || c_rec.order_id);
  

EXCEPTION
WHEN no_data_found then
   DBMS_OUTPUT.PUT_LINE('No data found');
WHEN too_many_rows then
   DBMS_OUTPUT.PUT_LINE('Too many rows');
END fetch_data;

DECLARE
t_rec sales%ROWTYPE;
BEGIN
fetch_data(1268,t_rec);
END;

/*Perform the following steps. 
Create a table SALES_COPY which is similar to SALES table. 
Write a procedure to call the procedure you have created in #2 and insert the 
data in the SALES_COPY table.*/

select * from sales;