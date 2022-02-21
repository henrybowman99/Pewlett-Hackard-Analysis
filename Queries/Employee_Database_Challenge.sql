--Get retirees into new table with titles included
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

--Filter previous table to include only most recent emp_no and employees who are still with the company
SELECT DISTINCT ON (emp_no)
					emp_no,
					first_name,
					last_name,
					title,
					from_date,
					to_date
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;
SELECT COUNT(emp_no) FROM unique_titles;
SELECT count (emp_no), title FROM unique_titles
GROUP BY title;



--Create table showing count of retirees grouped by title
SELECT COUNT(title), title
INTO retiring_titles_count
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles_count

--Get list of employees born in 1965 (mentornship eligible)
SELECT DISTINCT ON(e.emp_no)
	   e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE ti.to_date = '9999-01-01' AND 
(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;
SELECT title, count(emp_no) FROM mentorship_eligibility
GROUP BY title;

SELECT count(emp_no) FROM mentorship_eligibility;

--Get list of retirement candidates from previous year (Aug 2001-July 2002)
SELECT DISTINCT ON (e.emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_candidates_previous_year
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1951-01-01' AND '1954-12-31')
ORDER BY e.emp_no, to_date DESC;

SELECT (SELECT CAST(COUNT(emp_no) AS DECIMAL(10,2)) FROM retirement_candidates_previous_year WHERE to_date < '9999-01-01')/
(SELECT CAST(COUNT(emp_no) AS DECIMAL(10,2)) FROM retirement_candidates_previous_year)*100 AS retirement_percentage
INTO expected_retirement_percentage;

SELECT * FROM expected_retirement_percentage;

-- Get prediction for number of upcoming retirees
SELECT .1987 * 72458;













