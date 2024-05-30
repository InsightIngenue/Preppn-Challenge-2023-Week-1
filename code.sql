 1. Split the Transaction Code and Total Values of Transactions by each bank


 SELECT SPLIT_PART (TRANSACTION_CODE,'-', 0) as Bank, SUM(VALUE) as VALUE
   FROM PD2023_WK01
   GROUP BY Bank
   ;


2. Total Values by Bank, Day of the Week and Type of Transaction (Online or In-Person)


SELECT SPLIT_PART (TRANSACTION_CODE,'-', 0) as Bank, 
            CASE
                WHEN online_or_in_person = 2 
                    THEN 'In-Person'
                WHEN online_or_in_person = 1 
                    THEN 'Online'
                        END as type,
        DAYNAME( DATE(LEFT(transaction_date,10), 'dd/MM/yyyy')) as d, 
        SUM(Value) as Value

 FROM PD2023_WK01
 GROUP BY Bank,type, d
 ;



3. Total Values by Bank and Customer Code



 SELECT SPLIT_PART (TRANSACTION_CODE,'-', 0) as Bank, 
    CUSTOMER_CODE, SUM(Value) as Value

 FROM PD2023_WK01
 GROUP BY 1, 2