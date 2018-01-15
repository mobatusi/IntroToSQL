-- CREATE TABLE CUSTOMERS 
create table customers(
    customer_id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
    PRIMARY KEY (customer_id));
    
insert into customers(first_name, last_name, email) 
	values ('Roy', 'George', 'george@gmail.com'), 
	('George', 'Michael', 'gm@gmail.com'), 
	('David', 'Bowie', 'david@gmail.com'), 
	('Blue', 'Steele', 'blue@gmail.com');
	
create table orders(
    order_id INT NOT NULL AUTO_INCREMENT,
	order_date VARCHAR(100),
	amount FLOAT,
	customer_id INT,
    PRIMARY KEY (order_id));
    
insert into orders(order_date, amount, customer_id) 
	values ('2016/02/10', 99.90, 1), 
	('2017/11/11', 35.50, 1), 
	('2014/12/12', 800.67, 2), 
	('2015/01/03', 12.50, 2);
	
-- Select all records from A and B where the join condition is met
 select first_name, last_name, email from customers 
	join orders on customers.customer_id = orders.customer_id;

-- Select all records from A, along with any mathching records in B
 select * from customers 
	LEFT join orders on customers.customer_id = orders.customer_id;

-- Select all records from B, along with any mathching records in A
 select * from customers 
	RIGHT join orders on customers.customer_id = orders.customer_id;

-- CREATE TABLE STUDENT 
create table students(
    id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(100),
    PRIMARY KEY (id));	
    
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

    
-- CREATE TABLE STUDENT 
create table papers(
	title VARCHAR(100),
	grade INT,
	student_id INT,
    FOREIGN KEY (student_id) 
    	REFERENCES students(id)
    	ON DELETE CASCADE);		

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89); 

select first_name, title, grade from students
	right join papers on students.id = papers.student_id
	ORDER BY grade desc;

-- Alt solution
SELECT first_name, title, grade FROM students
inner join papers
on students.id = papers.student_id
order by grade desc;