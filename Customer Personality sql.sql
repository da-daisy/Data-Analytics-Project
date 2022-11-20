-- 1. RFM analysis

-- Summarize dataset

SELECT 
Customer_ID,
Recency,
sum(MntWines+
MntFruits+
MntMeatProducts+
MntFishProducts+
MntSweetProducts+MntGoldProds) as Amount
 FROM customers
 group by Customer_ID, Recency;


-- RFM
SELECT 
Customer_ID,
Recency as Recency,
COUNT(Date_Customer) as Frequency,
SUM(MntWines+
MntFruits+
MntMeatProducts+
MntFishProducts+
MntSweetProducts+MntGoldProds) as Monetary,
NTILE(3) OVER (ORDER BY Recency) as R,
NTILE(3) OVER (ORDER BY COUNT(Date_Customer) ASC) F,
NTILE(3) OVER (ORDER BY SUM(MntWines+
MntFruits+
MntMeatProducts+
MntFishProducts+
MntSweetProducts+MntGoldProds) ASC) M

FROM customers
 GROUP BY Customer_ID
ORDER BY 1, 3 DESC;

-- 2.  Average number of store purchases vs websites
SELECT AVG(NumStorePurchases),
AVG(NumWebPurchases)
FROM customers
WHERE Response = 1;

