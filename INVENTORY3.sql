CREATE OR REPLACE PACKAGE CUSTOMER_PACKAGE
AS

PROCEDURE ADD_CUSTOMER(
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
);

PROCEDURE ALTER_SALES;

PROCEDURE GET_CUSTOMER(
  C_ID IN NUMBER
  );

PROCEDURE fetch_sales_data (
   p_order_id IN NUMBER
);

function find_salescount(
    p_sales_date IN date
    )
    RETURN NUMBER;
    
FUNCTION powers (
    base     IN NUMBER,
    exponent IN NUMBER
) RETURN NUMBER;

END CUSTOMER_PACKAGE;
