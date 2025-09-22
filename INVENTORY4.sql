/*Write a procedure to call the procedure you have created in #2 and update the column 
TOTAL_AMOUNT to SALES_AMOUNT + TAX_AMOUNT in the SALES table. */
CREATE OR REPLACE PROCEDURE MONEY(
  TOTAL_MONEY IN SALES%ROWTYPE
  )
AS
BEGIN
 UPDATE SALES
 SET TOTAL_AMOUNT = SALES_AMOUNT + TAX_AMOUNT
 WHERE ORDER_ID = TOTAL_MONEY.ORDER_ID;
END;

EXECUTE FETCH_DATA(1001);
SELECT * FROM SALES;

/*Write a procedure to fetch SALES_DATE, ORDER_ID, PRODUCT_ID, CUSTOMER_ID and 
QUANTITY from SALES table and display the data. (Use a User defined record type).*/
CREATE OR REPLACE PROCEDURE DETAILS(
C_ORDER_id IN SALES.ORDER_id%TYPE)
AS
TYPE SALES_REC IS RECORD(
SALES_DATE DATE,
ORDER_ID NUMBER,
PRODUCT_ID NUMBER,
CUSTOMER_ID NUMBER,
QUANTITY NUMBER
);
s_rec SALES_REC;

BEGIN
select SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,QUANTITY INTO s_rec
FROM sales
where order_id = c_order_id;


dbms_output.put_line('Sales date:' || s_rec.sales_date);
dbms_output.put_line('Order id:' || s_rec.order_id);

END DETAILS;

execute details(1001);

select * from sales;