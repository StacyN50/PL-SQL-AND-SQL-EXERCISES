/*Write a procedure to call the procedure you have created in #2 and insert the 
data in the SALES_COPY table. */
CREATE OR REPLACE PROCEDURE COPY(
COPY_rec in sales%ROWTYPE
)
AS
BEGIN
   INSERT INTO SALES
   VALUES COPY_REC;
END COPY;

SELECT * FROM SALES WHERE ORDER_ID = 1269;
EXECUTE fetch_data(1269);
SELECT * FROM SALES;