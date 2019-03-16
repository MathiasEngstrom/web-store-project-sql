SELECT Description
FROM Department WHERE Department_ID = 0;

SELECT Department.Title, Department.Short_description
FROM Department
Where Department_ID = 1 or Department_ID = 2;

SELECT Product.Product_title, Product.Description, Product.Price_without_tax * Product.Tax * Product.Discount
FROM Product
WHERE Product.Featured = true;

SELECT DISTINCT Product.Product_ID, Product.Product_title, Product.Description, Product.Price_without_tax * Product.Tax * Product.Discount AS Price
FROM Product_Keyword, Product
WHERE (Keyword_ID IN (SELECT Keyword_ID FROM Product_Keyword WHERE Product_Keyword.Product_ID = 111) AND
Product_Keyword.Product_ID = Product.Product_ID) AND Product.Product_ID != 111;

SELECT Product.Product_title, Product.Description, Product.Price_without_tax * Product.Tax * Product.Discount AS Price, avg(User_Product.Rating) AS Average_rating
FROM Product
LEFT JOIN User_Product ON Product.Product_ID = User_Product.Product_ID 
WHERE Product.Department_ID = 21
GROUP BY Product.Product_ID;

SELECT *
FROM Product
WHERE Discount != 1 
ORDER BY Discount;

SELECT `Order`.Order_ID, Order_date, First_name, Last_name, City, Actual_price
FROM `Order`, User, Order_Product, Product
WHERE `Order`.User_ID = User.User_ID AND Order_Product.Product_ID = Product.Product_ID AND `Order`.Order_ID = Order_Product.Order_ID AND `Order`.Status_ID = 1
ORDER BY Order_date;

SELECT Product.Product_Title, SUM(Order_Product.Quantity) AS Sold
FROM Product, Order_Product
WHERE Product.Product_ID = Order_Product.Product_ID
AND (
SELECT Order_date
FROM `Order`
WHERE Order_Product.Order_ID=`Order`.Order_ID
) >= curdate() - INTERVAL 30 DAY
GROUP BY Order_Product.Product_ID
ORDER BY Sold
LIMIT 10;
