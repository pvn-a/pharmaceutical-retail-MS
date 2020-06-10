
USE dbms_project;

/*
select distinct(m.med_id),m.name,m.cost_per_unit 
from MEDICINE m, RETAIL r 
where m.med_id=r.med_id;
*/

/*SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));*/
UPDATE TRANSACTIONS, MEDICINE
SET TRANSACTIONS.total = TRANSACTIONS.quantity * MEDICINE.cost_per_tab
where TRANSACTIONS.med_id = MEDICINE.med_id;

/*Get the grand total of a bill issued to a patient*/
SELECT bill_id, ANY_VALUE(pat_id) AS pat_id, ANY_VALUE(store_id) AS store_id, SUM(total) AS Grand_total
FROM TRANSACTIONS
GROUP BY bill_id;


/*List patients who got treated today and bought medicines today.*/
SELECT DISTINCT(A.pat_id) , name, B.med_id
FROM PATIENT A, TRANSACTIONS B, TREATMENT C
WHERE A.pat_id = B.pat_id AND B.pur_date = CURRENT_date() AND B.pat_id IN
(
	SELECT C.pat_id
	FROM TREATMENT C
	WHERE C.treat_date = CURRENT_date()
);


/*List the necessary details, where a patient who has transacted in a STORE, has been treated in a hospital having a contract with the same store.
(Useful for operations like giving discounts for tie ups etc).*/
SELECT DISTINCT(A.pat_id), A.name, A.phone, C.hos_id, E.name, D.store_id, F.name
FROM PATIENT A, TREATMENT B, CONTRACT C, TRANSACTIONS D, HOSPITAL E, STORES F
WHERE A.pat_id = D.pat_id and E.hos_id = C.hos_id and F.store_id = D.store_id and(D.pat_id, C.hos_id, D.store_id) IN
(
    SELECT B.pat_id, B.hos_id, C.store_id
    FROM TREATMENT B, CONTRACT C
    WHERE B.hos_id = C.hos_id
);


/*Find Total Sales in each store in non-increasing order.*/
SELECT ANY_VALUE(B.store_id) AS STORE_ID, ANY_VALUE(B.name) AS STORE_NAME, SUM(A.total) AS TOTAL_SALES
FROM TRANSACTIONS A LEFT JOIN STORES B
USING(store_id)
GROUP BY A.store_id
UNION
SELECT ANY_VALUE(B.store_id) AS STORE_ID, ANY_VALUE(B.name) AS STORE_NAME, SUM(A.total) AS TOTAL_SALES
FROM TRANSACTIONS A RIGHT JOIN STORES B
USING(store_id)
GROUP BY B.store_id
ORDER BY TOTAL_SALES DESC;


/*The stores want to know what medicines are unsold in their stores, so that they can effectively save money by ordering less next time.*/
SELECT DISTINCT(A.store_id), A.name, D.med_id, D.quantity
FROM STORES A, RETAIL B, TRANSACTIONS C, QUANT D
WHERE D.store_id = A.store_id AND A.store_id=B.store_id AND B.store_id NOT IN 
(
    SELECT DISTINCT(C.store_id)
    FROM TRANSACTIONS C
);


/*Give an output which shows the MEDICINE sold at a store, which was supplied by a dealer, to a patient along with the purchased date and expiry date.*/
SELECT  A.store_id, A.med_id, C.name, A.dealer_id, C.exp_date, B.pur_date, B.pat_id
FROM MEDICINE C JOIN TRANSACTIONS B JOIN RETAIL A
ON B.med_id = A.med_id and C.med_id = B.med_id AND
C.med_id = A.med_id and B.store_id = A.store_id
ORDER BY A.store_id;


/*Display the daily transaction statistics of every store*/
SELECT ANY_VALUE(a.store_id) as store_id, ANY_VALUE(b.name) as store_name, ANY_VALUE(COUNT(a.store_id)) as No_of_Trancts, ANY_VALUE(AVG(a.total)) as AVG_amt, ANY_VALUE(MIN(a.total)) as MIN_amt, ANY_VALUE(MAX(a.total)) as MAX_amt, ANY_VALUE(a.pur_date)as Purch_Date
FROM TRANSACTIONS a JOIN STORES b
ON a.store_id = b.store_id
GROUP BY(a.pur_date)
ORDER BY a.pur_date DESC;

/*Display retail and dealer information about all registered Dealers who have supplied a bulk order of >= 100 tablets*/
SELECT B.dealer_id, A.name, A.phone, B.retail_id, B.store_id,  B.med_id, B.quantity_supplied 
FROM RETAIL B, DEALER A
WHERE A.dealer_id = B.dealer_id and EXISTS
(
    SELECT B.dealer_id
    FROM DEALER A
    WHERE A.dealer_id = B.dealer_id and B.quantity_supplied >= 100
)
ORDER BY A.dealer_id;
