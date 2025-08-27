USE Hospital2
--1. Вывести названия и вместимости палат, расположенных в 5-м корпусе,
   --вместимостью 5 и более мест, если в этом корпусе есть хотя бы одна палата вместимостью более 15 мест.
SELECT Name, Building FROM Departments
WHERE Building > 5

--2. Вывести названия отделений в которых проводилось хотя бы одно обследование за последнюю неделю.
SELECT Name FROM Departments
JOIN Surveys ON Departments.ID = Surveys.DepartmentID
WHERE Surveys.Date >= GETDATE() - 7


--3. Вывести названия заболеваний, для которых не проводятся обследования.
SELECT Name FROM Diseases
WHERE Surveys IS NULL

--4. Вывести полные имена врачей, которые не проводят обследования.
SELECT Name + Surname AS 'Doctor' FROM Doctors
WHERE isResearch IS NULL

--5. Вывести названия отделений, в которых не проводятся обследования.
SELECT Name FROM Diseases
WHERE isResearch IS NULL

--6. Вывести фамилии врачей, которые являются интернами.
SELECT Surname FROM Doctors
WHERE Position = 'Intern'
  AND Rate > (
    SELECT MIN(Rate) 
    FROM Doctors d2 
    WHERE d2.Position != 'Intern'
);

--7. Вывести фамилии интернов, ставки которых больше, чем ставка хотя бы одного из врачей.

--8. Вывести названия палат, чья вместимость больше, чем вместимость каждой палаты, находящейся в 3-м корпусе.
SELECT Name FROM Palats
WHERE Capacity > ALL (
    SELECT Capacity
    FROM Palats
    WHERE Building = 3
);


--9. Вывести фамилии врачей, проводящих обследования в отделениях «Ophthalmology» и «Physiotherapy».
SELECT DISTINCT Doctors.Surname FROM Doctors
JOIN DoctorsExaminations ON Doctors.Id = DoctorsExaminations.DoctorId
JOIN Departments ON DoctorsExaminations.DepartmentId = Departments.Id
WHERE Departments.Name IN ('Ophthalmology', 'Physiotherapy');


--10. Вывести названия отделений, в которых работают интерны и профессоры.
SELECT Departments.Name FROM Departments
JOIN Doctors ON Departments.Id = Doctors.DepartmentId AND Doctors.Rank = 'Intern'
JOIN Doctors ON Departments.Id = Doctors.DepartmentId AND Doctors.Rank = 'Professor'
GROUP BY Departments.Name;


--11. Вывести полные имена врачей и отделения в которых они проводят обследования, если отделение имеет
    --фонд финансирования более 20000.

--12. Вывести название отделения, в котором проводит обследования врач с наибольшей ставкой.

--13. Вывести названия заболеваний и количество проводимых по ним обследований.