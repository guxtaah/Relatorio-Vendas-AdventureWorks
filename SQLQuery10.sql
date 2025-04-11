-- Vendas por Categoria do Produto

CREATE OR ALTER VIEW Vendas_Internet AS
(SELECT 
	SalesOrderNumber AS 'Nº do Pedido',
	OrderDate AS 'Data do Pedido',
	EnglishProductCategoryName AS 'Categoria Produto',
	FirstName + ' ' + LastName AS 'Nome',
	Gender AS 'Genero',
	SalesTerritoryCountry AS 'Pais',
	OrderQuantity AS 'Qtd. Pedido',
	TotalProductCost AS 'Custo p/ Venda',
	SalesAmount AS 'Receita Venda'
FROM FactInternetSales fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
INNER JOIN DimSalesTerritory dst ON fis.SalesTerritoryKey = dst.SalesTerritoryKey
WHERE YEAR(OrderDate) = 2013)

SELECT * FROM Vendas_Internet