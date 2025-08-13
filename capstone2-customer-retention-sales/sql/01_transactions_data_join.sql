USE capstone;

SELECT  T.TransactionID,T.CustomerID,C.Name,C.Gender,C.Age,C.Region,T.ProductID,P.ProductName,P.Category,T.Quantity,CP.Channel,T.TotalPrice AS Sales, T.TransactionDate 
FROM transactions AS T
JOIN customers AS C
ON T.CustomerID = C.CustomerID
JOIN products AS P
ON T.ProductID = P.ProductID
LEFT JOIN campaigns AS CP
ON T.CampaignID = CP.CampaignID

UNION

SELECT T.TransactionID,T.CustomerID,C.Name,C.Gender,C.Age,C.Region,T.ProductID,P.ProductName,P.Category,T.Quantity,CP.Channel,T.TotalPrice AS Sales, T.TransactionDate 
FROM transactions AS T
JOIN customers AS C
ON T.CustomerID = C.CustomerID
JOIN products AS P
ON T.ProductID = P.ProductID
RIGHT JOIN campaigns AS CP
ON T.CampaignID = CP.CampaignID;
