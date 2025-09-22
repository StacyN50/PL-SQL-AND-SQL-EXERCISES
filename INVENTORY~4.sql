create or replace PROCEDURE DUE_CUSTOMER(
c_id IN customer.customer_id%type
)
AS

BEGIN
  for c_rec in(
  select first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region
    FROM CUSTOMER
    WHERE CUSTOMER_ID = C_ID)


   LOOP 
   
dbms_output.put_line('First name:' || c_rec.first_name);
dbms_output.put_line('Last name:' || c_rec.last_name);
dbms_output.put_line('Middle name:' || c_rec.middle_name);
dbms_output.put_line('Address line1:' || c_rec.address_line1);
dbms_output.put_line('Address line2:' || c_rec.address_line2);
dbms_output.put_line('City:' || c_rec.city);
dbms_output.put_line('Country:' || c_rec.country);
dbms_output.put_line('Date added:' || c_rec.date_added);
END LOOP;


END;

execute due_customer(32);
select * from customer ORDER BY CUSTOMER_ID;