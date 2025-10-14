USE AdventureWorksDW;
SELECT *
FROM dimproduct;
# 1)Interroga la tabella dei prodotti ed esponi in output i campi ProductKey, ProductAlternateKey, EnglishProductName,
#Color, StandardCost, FinishedGoodsFlag.
#Il result set deve essere parlante per cui assegna un alias se lo ritieni opportuno.
SELECT
ProductKey,
ProductAlternateKey,
EnglishProductName AS Name,
Color,
StandardCost,
FinishedGoodsFlag AS FinishProduct
FROM dimproduct;
# 2) Partendo dalla query scritta nel passaggio precedente, esponi in output i soli prodotti finiti cioè quelli per cui
#il campo FinishedGoodsFlag è uguale a 1.
SELECT 
ProductKey,
ProductAlternateKey,
EnglishProductName AS Name,
Color,
StandardCost,
FinishedGoodsFlag AS FinishProduct
FROM dimproduct
WHERE FinishedGoodsFlag = 1;
# 3) Scrivi una nuova query al fine di esporre in output i prodotti il cui codice modello (ProductAlternateKey)
#comincia con FR oppure BK. Il result set deve contenere il codice prodotto (ProductKey), il modello,
#il nome del prodotto, il costo standard (StandardCost) e il prezzo di listino (ListPrice).
SELECT *
FROM dimproduct;
SELECT
ProductKey,
EnglishProductName AS Name,
StandardCost,
ListPrice,
ProductAlternateKey
FROM dimproduct
WHERE ProductAlternateKey LIKE 'FR%' OR ProductAlternateKey LIKE 'BK%';
# 4) Arricchisci il risultato della query scritta nel passaggio precedente del Markup applicato dallʼazienda
#(ListPrice - StandardCost)
SELECT ProductKey,
EnglishProductName AS Name,
StandardCost,
ListPrice,
ProductAlternateKey,
ListPrice - StandardCost AS Markup
FROM dimproduct
WHERE ProductAlternateKey like 'FR%' OR ProductAlternateKey like 'BK%';
# 5) Scrivi unʼaltra query al fine di esporre lʼelenco dei prodotti finiti il cui prezzo di listino è compreso tra 1000 e 2000.
SELECT
ProductKey,
ProductAlternateKey,
EnglishProductName AS Name,
ListPrice, #listprice non è necessario ma lo tengo per vedere se il filtro ha funzionato
StandardCost,
ListPrice - StandardCost AS Markup
FROM dimproduct
WHERE 
FinishedGoodsFlag = 1
AND
ListPrice BETWEEN 1000 AND 2000
ORDER BY ListPrice; #se non scrivo ASC o DISC di default MYSQL mette i dati in ordine crescente
# 6) Esplora la tabella degli impiegati aziendali (DimEmployee)
SELECT *
FROM dimemployee;
# 7) Esponi, interrogando la tabella degli impiegati aziendali, lʼelenco dei soli agenti.
#Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1.
SELECT 
EmployeeKey,
FirstName,
LastName,
Title,
DepartmentName,
Position
FROM dimemployee
WHERE SalesPersonFlag = 1;
# 8) Interroga la tabella delle vendite (FactResellerSales). Esponi in output lʼelenco delle transazioni registrate a partire
#dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214. Calcola per ciascuna transazione il profitto
#(SalesAmount - TotalProductCost).
SELECT *
FROM factresellersales; #esploro la tabella
SELECT
SalesOrderNumber,
SalesOrderLineNumber,
OrderDate,
ProductKey,
OrderQuantity,
SalesAmount,
TotalProductCost,
SalesAmount - TotalProductCost AS Profitto
FROM factresellersales
WHERE ProductKey 
IN (597, 598, 477, 214)
AND 
OrderDate BETWEEN '2020-01-01' AND '2025-10-14';