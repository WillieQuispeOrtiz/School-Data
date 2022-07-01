SELECT FirstName, ClassName, SubjectName, Score
FROM Student S
JOIN Grades G ON S.GradesId = G.GradesId
JOIN Subject SJ ON G.SubjectId = SJ.SubjectId
JOIN Class C ON S.ClassId= C.ClassId
WHERE SCORE>17
GROUP BY FirstName, ClassName, SubjectName, Score
ORDER BY Score DESC;

SELECT FirstName, ClassName, SubjectName, Score
FROM Student S
JOIN Grades G ON S.GradesId = G.GradesId
JOIN Subject SJ ON G.SubjectId = SJ.SubjectId
JOIN Class C ON S.ClassId= C.ClassId
WHERE SCORE<13
GROUP BY FirstName, ClassName, SubjectName, Score
ORDER BY Score ASC;

SELECT SubjectName, FirstName, AVG(Score)
From Subject SJ
JOIN Grades G ON SJ.SubjectId= G.SubjectId
JOIN Teacher T ON SJ.TeacherId=T.TeacherId
GROUP BY SubjectName, FirstName
ORDER BY AVG(Score) ASC;

SELECT FirstName, GradeTypeName, Score
From Student S
JOIN Grades G ON S.GradesId= G.GradesId
JOIN GradeType GT ON G.GradeTypeId=GT.GradeTypeId
GROUP BY FirstName, GradeTypeName,Score;