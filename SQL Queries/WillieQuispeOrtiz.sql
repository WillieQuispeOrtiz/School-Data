/* 1. Retorna una tabla con las notas superiores a 17 con los nombres, seccion, curso y nota, para asi poder tener conocimiento de los alumnos sobresalientes 
y brindarles apoyo para su ingreso a la universidad*/
SELECT FirstName, ClassName, SubjectName, Score
FROM Student S
JOIN Grades G ON S.GradesId = G.GradesId
JOIN Subject SJ ON G.SubjectId = SJ.SubjectId
JOIN Class C ON S.ClassId= C.ClassId
WHERE SCORE>17
GROUP BY FirstName, ClassName, SubjectName, Score
ORDER BY Score DESC;

/*2. Retorna una tabla con las notas inferiores a 13 con los nombres, seccion, curso y nota, para asi poder darles apoyo creando un salon de nivelacion, 
y asi tengan un mejor rendimiento */
SELECT FirstName, ClassName, SubjectName, Score
FROM Student S
JOIN Grades G ON S.GradesId = G.GradesId
JOIN Subject SJ ON G.SubjectId = SJ.SubjectId
JOIN Class C ON S.ClassId= C.ClassId
WHERE SCORE<13
GROUP BY FirstName, ClassName, SubjectName, Score
ORDER BY Score ASC;

/*3. Retorna una tabla con los cursos, nombres de profesor y promedio de notas ordenados desde el curso con menor nota al curso con mejor nota, con esto
podremos saber que cursos estan teniendo un bajo rendimiento e investigar si se trata de la enseñanza del profesor o el curso es muy exigente*/
SELECT SubjectName, FirstName, AVG(Score)
From Subject SJ
JOIN Grades G ON SJ.SubjectId= G.SubjectId
JOIN Teacher T ON SJ.TeacherId=T.TeacherId
GROUP BY SubjectName, FirstName
ORDER BY AVG(Score) ASC;

/*4. Retorna una tabla con los nombres, tipo de nota, y nota de la seccion A que sean Trabajos Finales, para pasarlas al registro de notas de una forma
mas sencilla*/
SELECT ClassName, FirstName, GradeTypeName, Score
From Class C
JOIN Student S ON C.ClassId=S.ClassId
JOIN Grades G ON S.GradesId= G.GradesId
JOIN GradeType GT ON G.GradeTypeId=GT.GradeTypeId
WHERE ClassName="A" && GradeTypeName="TF"
GROUP BY ClassName, FirstName, GradeTypeName,Score;
