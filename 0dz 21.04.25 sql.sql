USE Shop

--1.Хранимая процедура отображает полную информацию о всех товарах
CREATE PROC firstTask
AS
SELECT * FROM Product

EXEC firstTask

--2. Хранимая процедура показывает полную информацию о товаре конкретного вида.
-- Вид товара передаётся в качестве параметра. Например, если в качестве параметра
-- указана обувь, нужно показать всю обувь, которая есть в наличии

CREATE PROC secondTask @infoAboutProduct nvarchar(10)
AS
SELECT * FROM Product WHERE Product.Name = @infoAboutProduct

EXEC secondTask 'Yoga'
--3. Хранимая процедура показывает топ-3 самых старых клиентов. Топ-3 определяется по дате регистрации
CREATE PROC thirdTask
AS
SELECT * FROM Clients
WHERE [Date] = (SELECT MIN([Date]) FROM Clients)


EXEC thirdTask
--4. Хранимая процедура показывает информацию о самом успешном продавце. Успешность определяется по общей
-- сумме продаж за всё время

CREATE PROC fourtTask
AS
SELECT * FROM Customers
WHERE Discount = (SELECT MAX(Discount) FROM Customers);

EXEC fourtTask