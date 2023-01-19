-- 1 selezionare tutti gli studenti nati nel 1990(160)
SELECT *
FROM students
WHERE date_of_birth
    BETWEEN '1990-01-01' AND '1991-01-01';

-- 2 selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * 
FROM courses
WHERE cfu > 10;

-- 3 selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM students
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURRENT_DATE()) = 30;


-- 4 selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT *
FROM courses
WHERE period = 'I semestre'
    AND year = 1;

-- 5 selezionare tutti gli appelli d'esame che avvengono nel pomeriggio dopo le 14 del 20/06/2020 (21)
SELECT *
FROM exams
WHERE date = '2020-06-20'
    AND hour > '14:00:00';

-- 6 selezionare tutti i corsi di laurea magistrale (38)
SELECT *
FROM degrees
WHERE level = 'magistrale';

-- 7 da quanti dipartimenti è composta l'università (12)
SELECT COUNT(*)
FROM departments;

-- 8 quanti sono gli insegnati che non hanno un numero di telefono (50)
SELECT *
FROM teachers
WHERE phone IS null;