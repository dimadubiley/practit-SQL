USE BookShop

--Показать все книги, количество страниц в которых больше 500, но меньше 650.
SELECT* FROM Books
WHERE Pages > 100 AND Pages < 700

--Показать все книги, в которых первая буква названия либо «А», либо «З».
SELECT* FROM Books
WHERE Name LIKE 'A%' 
		OR 
		Name LIKE 'F%'

--Показать все книги жанра «Детектив», количество проданных книг более 30 экземпляров.
SELECT* FROM Books, Themes
WHERE Themes.Name = 'Horror'
--Показать все книги, в названии которых есть слово «Microsoft», но нет слова «Windows».
SELECT* FROM Books
WHERE Name LIKE ('Microsoft')
		AND
		NAME NOT LIKE ('Windows')
--Показать все книги (название, тематика, полное имя автора в одной ячейке), цена одной страницы которых меньше 65 копеек.
SELECT Books.Name							AS 'Book name', 
	   Themes.Name							AS 'Themes',
	   Authors.Name + ' ' + Authors.Surname AS 'Autor'
FROM Books,
     Authors,
	 Themes

WHERE (Books.Pages / Books.Pages) < 1;

--Показать все книги, название которых состоит из 4 слов.
SELECT* FROM Books
WHERE Name LIKE '% % % %';

--Показать информацию о продажах в следующем виде:
--▷ Название книги, но, чтобы оно не содержало букву «А».
SELECT Name FROM Books
WHERE Name NOT LIKE 'A'
--▷ Тематика, но, чтобы не «Программирование».
SELECT Name FROM Themes
WHERE Name NOT LIKE 'Theory of algorithms'
--▷ Автор, но, чтобы не «Герберт Шилдт».
SELECT Name FROM Authors
WHERE Name NOT LIKE 'Michael Rouzon'
--▷ Цена, но, чтобы в диапазоне от 10 до 20 гривен.
SELECT Name FROM Books
WHERE Price BETWEEN 10 AND 20
--▷ Количество продаж, но не менее 8 книг.
--▷ Название магазина, который продал книгу, но он не должен быть в Украине или России.
SELECT Shops.Name FROM Shops, Countries
WHERE Countries.Name NOT LIKE 'Ukranian' OR Countries.Name NOT LIKE 'Russia' 