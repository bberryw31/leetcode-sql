select teacher_id, count(DISTINCT(subject_id)) cnt
from teacher
group by teacher_id