# 1) Scrivi una query per verificare che il campo ProductKey nella tabella DimProduct sia una chiave primaria.
#Quali considerazioni/ragionamenti è necessario che tu faccia?
#LA PRIMARY KEY è UNIVOCA E MAI NULLA. PER VERIFICARE CHE "ProductKey" SIA UNA PK DOBBIAMO
#VERIFICARE CHE QUESTE DUE CONDIZIONI SIANO VERE
USE AdventureWorksDW;
SELECT DISTINCT ProductKey
FROM dimproduct;
SELECT ProductKey
FROM dimproduct
WHERE ProductKey IS NULL;
SELECT 
ProductKey,
COUNT(*)
FROM dimproduct
GROUP BY ProductKey
HAVING COUNT(*) > 1; 
# 2) Scrivi una query per verificare che la combinazione dei campi SalesOrderNumber e SalesOrderLineNumber sia una PK.
#LA PRIMARY KEY è UNIVOCA E MAI NULLA. PER VERIFICARE CHE "ProductKey" SIA UNA PK DOBBIAMO
#VERIFICARE CHE QUESTE DUE CONDIZIONI SIANO VERE
SELECT 
SalesOrderNumber,
SalesOrderLineNumber,
COUNT(*)
FROM factresellersales
GROUP BY 
SalesOrderNumber,
SalesOrderLineNumber
HAVING COUNT(*) > 1; 
SELECT 
SalesOrderNumber,
SalesOrderLineNumber,
COUNT(*)
FROM factresellersales
WHERE SalesOrderNumber IS NULL AND SalesOrderLineNumber IS NULL
GROUP BY 
SalesOrderNumber,
SalesOrderLineNumber;
#3) Conta il numero transazioni (SalesOrderLineNumber) realizzate ogni giorno a partire dal 1 Gennaio 2020
SELECT * 
FROM factresellersales;
#4) Calcola il fatturato totale (FactResellerSales.SalesAmount), la quantità totale venduta (FactResellerSales.OrderQuantity)
#e il prezzo medio di vendita (FactResellerSales.UnitPrice) per prodotto (DimProduct) a partire dal 1 Gennaio 2020.
#Il result set deve esporre pertanto il nome del prodotto, il fatturato totale, la quantità totale venduta e il prezzo medio 
#di vendita. I campi in output devono essere parlanti!
SELECT 
P.EnglishProductName AS NomeProdotto,
SUM(SalesAmount) AS FatturatoTotale,
SUM(OrderQuantity) AS QuantitaTotaleVenduta,
AVG(UnitPrice) AS PrezzoMedio,
SUM(SalesAmount)/SUM(OrderQuantity) AS PrezzoMedio2
FROM dimproduct AS P
INNER JOIN
factresellersales AS FR
ON
P.ProductKey = FR.ProductKey
WHERE FR.OrderDate >= '2020-01-01'
GROUP BY 
P.EnglishProductName;
# 5)Calcola il fatturato totale (FactResellerSales.SalesAmount) e la quantità totale venduta (FactResellerSales.OrderQuantity) 
#per Categoria prodotto (DimProductCategory). Il result set deve esporre pertanto il nome della categoria prodotto,
#il fatturato totale e la quantità totale venduta. I campi in output devono essere parlanti!
SELECT 
C.EnglishProductCategoryName AS CategoriaProdotto,
SUM(SalesAmount) AS FatturatoTotale,
SUM(OrderQuantity) AS QuantitaTotaleVenduta,
AVG(UnitPrice) AS PrezzoMedio
FROM dimproduct AS P
INNER JOIN 
dimproductsubcategory AS S
ON 
P.ProductSubcategoryKey = S.ProductSubcategoryKey
INNER JOIN 
dimproductcategory AS C
ON
 S.ProductCategoryKey = C.ProductCategoryKey
INNER JOIN
factresellersales AS FR
ON
P.ProductKey = FR.ProductKey
GROUP BY 
C.EnglishProductCategoryName;
# 6) Calcola il fatturato totale per area città (DimGeography.City) realizzato a partire dal 1 Gennaio 2020.
#Il result set deve esporre lʼelenco delle città con fatturato realizzato superiore a 60K.
SELECT 
G.City AS Città,
SUM(SalesAmount) AS FatturatoTotale
FROM dimgeography AS G
INNER JOIN 
dimreseller AS R
ON G.GeographyKey = R.GeographyKey
INNER JOIN
factresellersales AS FR
ON 
FR.ResellerKey = R.ResellerKey
WHERE FR.OrderDate>= '2020-01-01'
GROUP BY 
G.CITY
HAVING 
SUM(SalesAmount) >60000;


