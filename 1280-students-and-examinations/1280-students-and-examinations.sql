SELECT s.student_id, s.student_name, s.subject_name, COALESCE(e.attended_exams, 0) attended_exams
FROM (
    SELECT *
    FROM Students 
    CROSS JOIN Subjects
) s
LEFT JOIN (
    SELECT student_id, subject_name, COUNT(*) attended_exams
    FROM Examinations
    GROUP BY student_id, subject_name
) e ON s.student_id = e.student_id AND s.subject_name = e.subject_name
ORDER BY s.student_id, s.subject_name