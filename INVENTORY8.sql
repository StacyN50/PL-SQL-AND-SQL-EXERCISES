CREATE OR REPLACE FUNCTION GET_NAMES(
 custid IN NUMBER
 )
  RETURN SYS_REFCURSOR
  
  AS
  l_return SYS_REFCURSOR;
  BEGIN
   OPEN l_return FOR 
   select first_name,last_name
   from customer
   where customer_id = custid;
   RETURN l_return;
  END GET_NAMES;
  
  CREATE OR REPLACE PROCEDURE DISPLAY_NAMES
  AS
  C_REC SYS_REFCURSOR;
  FNAME VARCHAR2(50);
  LNAME VARCHAR2(50);
  
  BEGIN 
  C_REC := GET_NAMES(32);
  
  LOOP
  FETCH C_REC INTO FNAME,LNAME;
  EXIT WHEN C_REC%NOTFOUND;
  dbms_output.put_line(fname);
dbms_output.put_line(lname);
  END LOOP;
     CLOSE C_REC;

  END display_names;


execute display_names();

select * from customer;
SELECT * FROM SALES;
/*Write a procedure to fetch data from table SALES for a given parameter sales date and 
display all the data(Hint: use Explicit cursors and ROWTYPE)*/
CREATE OR REPLACE PROCEDURE GET_SALES(
   date_of_sales IN sales.sales_date%TYPE
   )
   AS
   cursor sales is select *
                   from sales
                   where sales_date = date_of_sales;
                   
    v_sales sales%rowtype;
   BEGIN
   open sales;
   
   LOOP 
   fetch sales into v_sales;
   EXIT WHEN sales%NOTFOUND;
   dbms_output.put_line('Order id:' || v_sales.order_id);
   dbms_output.put_line('Product id:' || v_sales.product_id);
   dbms_output.put_line('Sales amount:' || v_sales.sales_amount);
   END LOOP;
   
   close sales;
   END GET_SALES;
   
   execute get_sales(to_date('27-mar-15','dd-mon-yy'));
   
    /*Write a procedure to fetch data from table SALES for a given parameter sales date and 
display all the data(Hint: use Cursor FOR loop)*/
CREATE OR REPLACE PROCEDURE GET_SALES(
   date_of_sales IN sales.sales_date%TYPE
   )
   AS
                   
   BEGIN
  FOR v_sales in ( select * from sales where sales_date = date_of_sales)
   
   LOOP
   dbms_output.put_line('Order id:' || v_sales.order_id);
   dbms_output.put_line('Product id:' || v_sales.product_id);
   dbms_output.put_line('Sales amount:' || v_sales.sales_amount);
   END LOOP;
   END GET_SALES;
   
   exec get_sales(to_date('27-mar-15','dd-mon-yy'));
   
 /*Write a procedure to fetch data from table SALES for a given parameter sales date and 
pass that cursor to another program.*/
CREATE OR REPLACE FUNCTION GET_sales_data(
 date_of_sales IN sales.sales_date%type
 )
  RETURN SYS_REFCURSOR
  
  AS
  l_return SYS_REFCURSOR;
  BEGIN
   OPEN l_return FOR 
   select product_id,sales_amount
   from sales
   where sales_date = date_of_sales;
   RETURN l_return;
  END GET_sales_data;
  
/*Write another procedure which calls the above procedure and displays the data. */
CREATE OR REPLACE PROCEDURE DISPLAY_NAMES_data
  AS
  C_REC SYS_REFCURSOR;
  product_id number;
  sales_amount number;
  
  BEGIN 
  C_REC := GET_sales_data(to_date('27-mar-15','dd-mon-yy'));
  
  LOOP
  FETCH C_REC INTO product_id,sales_amount;
  EXIT WHEN C_REC%NOTFOUND;
  dbms_output.put_line(product_id);
dbms_output.put_line(sales_amount);
  END LOOP;
     CLOSE C_REC;

  END display_names_data;
  
  execute display_names_data();
