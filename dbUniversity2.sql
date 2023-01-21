-- Query
-- Group By
-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date), COUNT(*)
FROM students
GROUP BY YEAR(enrolment_date);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT office_address, COUNT(*)
FROM teachers
GROUP BY office_address;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT exam_id, AVG(vote) AS media_voti
FROM exam_student
GROUP BY exam_id;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT department_id, COUNT(*)
FROM degrees
GROUP BY department_id;

-- Join
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT degrees.name, students.*
FROM degrees
JOIN students
    ON degrees.id = students.degree_id
WHERE degrees.name LIKE 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT departments.name, degrees.*
FROM degrees
 JOIN departments
  ON departments.id = degrees.department_id
  WHERE departments.name LIKE 'Dipartimento di Neuroscienze'
   AND degrees.level LIKE 'magistrale';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT teachers.name, courses.*
FROM teachers
    JOIN course_teacher
        ON teachers.id = course_teacher.teacher_id
    JOIN courses
     ON course_teacher.course_id = courses.id
WHERE teachers.name LIKE 'Fulvio'
 AND teachers.surname LIKE 'Amato';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.name, students.surname, degrees.*, departments.name
FROM students
    JOIN degrees
        ON students.degree_id = degrees.id
    JOIN departments
        ON degrees.department_id = departments.id
        ORDER BY students.name ASC;

-- BONUS
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


-- 7. Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

