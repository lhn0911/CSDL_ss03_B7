create table Students(
student_id int primary key auto_increment,
name varchar(255) not null,
email varchar(255) not null unique,
date_of_birth date not null,
gender enum('male', 'female','other') not null,
gpa decimal(3,2) check (0<=gpa<=4)
);
INSERT INTO Students (name, email, date_of_birth, gender, gpa)
VALUES
('Nguyen Van A', 'nguyenvana@example.com', '2000-05-15', 'Male', 3.50),
('Tran Thi B', 'tranthib@example.com', '1999-08-22', 'Female', 3.80),
('Le Van C', 'levanc@example.com', '2001-01-10', 'Male', 2.70),
('Pham Thi D', 'phamthid@example.com', '1998-12-05', 'Female', 3.00),
('Hoang Van E', 'hoangvane@example.com', '2000-03-18', 'Male', 3.60),
('Do Thi F', 'dothif@example.com', '2001-07-25', 'Female', 4.00),
('Vo Van G', 'vovang@example.com', '2000-11-30', 'Male', 3.20),
('Nguyen Thi H', 'nguyenthih@example.com', '1999-09-15', 'Female', 2.90),
('Bui Van I', 'buivani@example.com', '2002-02-28', 'Male', 3.40),
('Tran Thi J', 'tranthij@example.com', '2001-06-12', 'Female', 3.75);
select *from Students where gpa >3 and gender = 'female';
SELECT *from Students where gpa = (select MAX(gpa) from Students)and year(date_of_birth) > 2000;
select * from Students where date_of_birth = (select date_of_birth from Students where student_id = 1);
update Students set gpa = least(gpa + 0.5, 4.0) where gpa < 2.5;
update Students set gender = 'Other' where email like '%test%';
delete from Students where student_id = (select student_id from (select student_id from Students order by date_of_birth asc limit 1) as temp);
select student_name, floor(datediff(curdate(), date_of_birth) / 365) as age from Students;