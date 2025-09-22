--ASSOCIATIVE COLLECTION
DECLARE
TYPE CUSTOMER_TYPE IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
    customer_table customer_type;
    v_idx NUMBER;
    
    BEGIN
    customer_table(1) := 'JEFF';
    customer_table(2) := 'MIKE';
    customer_table(3) := 'JOHN';
    customer_table(6) := 'KING';

--Delete the third item of the collection
    --customer_table.DELETE(3);

--Traverse
  v_idx := customer_table.FIRST;
  
  WHILE v_idx IS NOT NULL
  LOOP
  dbms_output.put_line('Customer name:' ||customer_table(v_idx));
 v_idx := customer_table.NEXT(v_idx);
   END LOOP;
    END;
    
--NESTED COLLECTION
DECLARE
TYPE CUSTOMER_TYPE IS TABLE OF VARCHAR2(100);
    customer_table customer_type := CUSTOMER_TYPE(); --Intialized the collection
    v_idx NUMBER;
    
    BEGIN
    
    CUSTOMER_TABLE.EXTEND(4);  --Extended the collection before using the table
    customer_table(1) := 'JEFF';
    customer_table(2) := 'MIKE';
    customer_table(3) := 'JOHN';
    --customer_table(6) := 'KING';  --Throws an error
    customer_table(4) := 'KING';    --It must be sequential
--Delete the third item of the collection
    customer_table.DELETE(3);

dbms_output.put_line('Customer name:' ||customer_table(customer_table.first));
dbms_output.put_line('Customer name:' ||customer_table(customer_table.last));

--Traverse dense collection
  v_idx := customer_table.FIRST;
  
  WHILE v_idx IS NOT NULL
  LOOP
  dbms_output.put_line('Customer name:' ||customer_table(v_idx));
 v_idx := customer_table.NEXT(v_idx);
   END LOOP;
    END;
    

--VARRAY
DECLARE
TYPE CUSTOMER_TYPE IS VARRAY(4) OF VARCHAR2(100);
    customer_table customer_type := CUSTOMER_TYPE(); --Intialized the collection
    v_idx NUMBER;
    
    BEGIN
    
    CUSTOMER_TABLE.EXTEND(4);  --Extended the collection before using the table
    customer_table(1) := 'JEFF';
    customer_table(2) := 'MIKE';
    customer_table(3) := 'JOHN';
    --customer_table(6) := 'KING';  --Throws an error
    customer_table(4) := 'KING';    --It must be sequential
--Cannot delete the third item of the collection
    --customer_table.DELETE(3);

--Traverse dense collection
  v_idx := customer_table.FIRST;
  
  WHILE v_idx IS NOT NULL
  LOOP
  dbms_output.put_line('Customer name:' ||customer_table(v_idx));
 v_idx := customer_table.NEXT(v_idx);
   END LOOP;
    END;
    
--MULTISET UNION
--MULTISET UNION ALL
--MULTISET EXCEPT
--MULTISET INTERSECT

DECLARE
TYPE OP IS TABLE OF NUMBER;
op1 op := op(1,2,3,4,5,6);
op2 op := op(5,6,7,8,9,10);

BEGIN
OP1 := OP1 MULTISET UNION all OP2;

FOR I IN OP1.FIRST .. OP2.LAST
LOOP
dbms_output.put_line(op1(i));
END LOOP;
END;
    
/*Create an Associative array of character datatype and index it by number and perform 
the below operations. 
 Insert 10 values into this array 
 Delete 3rd element from the array 
 Delete 7th element from the array 
 Display the data from the array */
--For numbers, you can use TYPE FIRSTOP IS TABLE of NUMBER INDEX BY BINARY_INTEGER;
--For characters,you can use TYPE FIRSTOP IS TABLE of varchar(50) INDEX BY number;

DECLARE 
TYPE FIRSTOP IS TABLE of NUMBER INDEX BY BINARY_INTEGER;
     firstop1 firstop;
     op NUMBER;
     
     BEGIN
     --Insert 10 values
     firstop1(1) := 3;
     firstop1(2) := 10;
     firstop1(3) := 21;
     firstop1(4) := 12;
     firstop1(5) := 5;
     firstop1(6) := 8;
     firstop1(7) := 4;
     firstop1(8) := 1;
     firstop1(9) := 11;
     firstop1(10) := 7;
     
     --Delete 3rd element
     firstop1.DELETE(3);
     
     --Delete 7th element
     firstop1.DELETE(7);
     
     --Traverse
      op := firstop1.FIRST;
      
      WHILE op IS NOT NULL
      LOOP
      dbms_output.put_line('No:' || firstop1(op));
      op := firstop1.NEXT(op);
      END LOOP;

     END;

/*Create a Nested Table array of character datatype and perform the below operations. 
 Insert 10 values into this array 
 Delete 3rd element from the array 
 Delete 7th element from the array 
 Display the data from the array*/

DECLARE 
TYPE FIRSTOP IS TABLE of VARCHAR(50);
     firstop1 firstop := firstop();
     op NUMBER;
     
     BEGIN
     
     firstop1.EXTEND(10);
     --Insert 10 values
     firstop1(1) := 'l';
     firstop1(2) := 'm';
     firstop1(3) := 'P';
     firstop1(4) := 'D';
     firstop1(5) := 'O';
     firstop1(6) := 'Q';
     firstop1(7) := 'N';
     firstop1(8) := 'S';
     firstop1(9) := 'A';
     firstop1(10) := 'G';
     
     --Delete 3rd element
     firstop1.DELETE(3);
     
     --Delete 7th element
     firstop1.DELETE(7);
     
     --Traverse
      op := firstop1.FIRST;
      
      WHILE op IS NOT NULL
      LOOP
      dbms_output.put_line('Char:' || firstop1(op));
      op := firstop1.NEXT(op);
      END LOOP;

     END;
     
      /*Create a VARRAY array of character datatype which holds 10 values and perform the 
below operations. 
 Insert 10 values into this array 
 Display the data from the array*/
DECLARE
TYPE firstop IS VARRAY(10) OF VARCHAR2(100);
    firstop1 firstop := firstop(); --Intialized the collection
    v_idx NUMBER;
    
    BEGIN
    
    firstop1.EXTEND(10);  --Extended the collection before using the table
    firstop1(1) := 'JEFF';
    firstop1(2) := 'MIKE';
    firstop1(3) := 'JOHN';
    firstop1(4) := 'KING';  --Throws an error
    firstop1(5) := 'KIiNG';    --It must be sequential
    firstop1(6) := 'leo';   
    firstop1(7) := 'deo';    
    firstop1(8) := 'dante';    
    firstop1(9) := 'neo';    
    firstop1(10) := 'up';    

--Traverse dense collection
    v_idx := firstop1.FIRST;
  
  WHILE v_idx IS NOT NULL
  LOOP
  dbms_output.put_line('Customer name:' ||firstop1(v_idx));
 v_idx := firstop1.NEXT(v_idx);
   END LOOP;
    END;