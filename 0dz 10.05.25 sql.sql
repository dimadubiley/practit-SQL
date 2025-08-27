USE Hospital2
--1. ������� �������� � ����������� �����, ������������� � 5-� �������,
   --������������ 5 � ����� ����, ���� � ���� ������� ���� ���� �� ���� ������ ������������ ����� 15 ����.
SELECT Name, Building FROM Departments
WHERE Building > 5

--2. ������� �������� ��������� � ������� ����������� ���� �� ���� ������������ �� ��������� ������.
SELECT Name FROM Departments
JOIN Surveys ON Departments.ID = Surveys.DepartmentID
WHERE Surveys.Date >= GETDATE() - 7


--3. ������� �������� �����������, ��� ������� �� ���������� ������������.
SELECT Name FROM Diseases
WHERE Surveys IS NULL

--4. ������� ������ ����� ������, ������� �� �������� ������������.
SELECT Name + Surname AS 'Doctor' FROM Doctors
WHERE isResearch IS NULL

--5. ������� �������� ���������, � ������� �� ���������� ������������.
SELECT Name FROM Diseases
WHERE isResearch IS NULL

--6. ������� ������� ������, ������� �������� ���������.
SELECT Surname FROM Doctors
WHERE Position = 'Intern'
  AND Rate > (
    SELECT MIN(Rate) 
    FROM Doctors d2 
    WHERE d2.Position != 'Intern'
);

--7. ������� ������� ��������, ������ ������� ������, ��� ������ ���� �� ������ �� ������.

--8. ������� �������� �����, ��� ����������� ������, ��� ����������� ������ ������, ����������� � 3-� �������.
SELECT Name FROM Palats
WHERE Capacity > ALL (
    SELECT Capacity
    FROM Palats
    WHERE Building = 3
);


--9. ������� ������� ������, ���������� ������������ � ���������� �Ophthalmology� � �Physiotherapy�.
SELECT DISTINCT Doctors.Surname FROM Doctors
JOIN DoctorsExaminations ON Doctors.Id = DoctorsExaminations.DoctorId
JOIN Departments ON DoctorsExaminations.DepartmentId = Departments.Id
WHERE Departments.Name IN ('Ophthalmology', 'Physiotherapy');


--10. ������� �������� ���������, � ������� �������� ������� � ����������.
SELECT Departments.Name FROM Departments
JOIN Doctors ON Departments.Id = Doctors.DepartmentId AND Doctors.Rank = 'Intern'
JOIN Doctors ON Departments.Id = Doctors.DepartmentId AND Doctors.Rank = 'Professor'
GROUP BY Departments.Name;


--11. ������� ������ ����� ������ � ��������� � ������� ��� �������� ������������, ���� ��������� �����
    --���� �������������� ����� 20000.

--12. ������� �������� ���������, � ������� �������� ������������ ���� � ���������� �������.

--13. ������� �������� ����������� � ���������� ���������� �� ��� ������������.