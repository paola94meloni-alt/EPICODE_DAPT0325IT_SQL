USE adv_2;
# 1) Implementa una vista denominata Product al fine di creare unʼanagrafica (dimensione) prodotto completa.
# La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome prodotto,
# il nome della sottocategoria associata e il nome della categoria associata.
CREATE VIEW PRODOTTI AS 
(
SELECT
P.ProductKey,
P.EnglishProductName AS NomeProdotto,
C.EnglishProductCategoryName AS CategoriaProdotto,
S.EnglishProductSubcategoryName AS SottocategoriaProdotto
FROM dimproduct AS P
INNER JOIN 
dimproductsubcategory AS S 
ON
P.ProductSubcategoryKey = S.ProductSubcategoryKey
INNER JOIN 
dimproductcategory AS C
ON
S.ProductCategoryKey = C.ProductCategoryKey
);
# 2) Implementa una vista denominata Reseller al fine di creare unʼanagrafica (dimensione) reseller completa.
# La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome del reseller, il nome della città
# e il nome della regione.
CREATE VIEW RIVENDITORI AS 
(
SELECT
R.ResellerKey,
R.ResellerName AS NomeRivenditore,
G.City AS CittaRivenditore,
G.StateProvinceName AS RegioneRivenditore
FROM dimreseller AS R
INNER JOIN 
dimgeography AS G
ON
R.GeographyKey = G.GeographyKey
);
# 3) Crea una vista denominata Sales che deve restituire la data dellʼordine, il codice documento, la riga di corpo del documento,
#la quantità venduta, lʼimporto totale e il profitto.
CREATE VIEW VENDITE AS
(
SELECT
ProductKey,
ResellerKey,
OrderDate AS DataOrdine,
SalesOrderNumber AS CodiceDocumento,
SalesOrderLineNumber AS RigadicorpoDocumento,
OrderQuantity AS QuantitaVenduta,
SalesAmount AS ImportoTotale,
(SalesAmount - TotalProductCost) AS Profitto
FROM 
factresellersales
);