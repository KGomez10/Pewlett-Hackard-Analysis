CREATE TABLE retirement_titles(
     emp_no INT NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
	 title VARCHAR NOT NULL,
	 from_date DATE NOT NULL,
	 to_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

-- retiring titles
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- Joining titles and employees tables
SELECT employees.emp_no,
     employees.first_name,
	 employees.last_name,
	 titles.title,
     titles.from_date,
     titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no ASC
;

SELECT * FROM retirement_titles;

SELECT DISTINCT ON (retirement_titles.emp_no) emp_no,first_name, last_name,title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;