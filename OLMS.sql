--1.CREATE A PROJECT ON ONLINE BASED Library Management System on SQL
--An online library management system offers a user-friendly way of issuing books and also viewing 
--different books and titles available under a category. 

--Take the example of your college library, where both teachers and students can issue books. 
--Usually, the number of days within which you have to return the book varies for both the groups. 
--Also, each book has a unique ID, even if they are copies of the same book by the same author. So, 
--a library management system has an entry for every book, capturing who has issued it, the issue
--duration, and the amount of fine, if any.

--1. Analysing Database and Create Conceptual Schemas
--2. Decompose all table to minimum Space Oriented
--3. Describe all table Relationship
--4. Find all Super Keys
--5. Use All Types of Constraint on the Table
--6. Create a Procedure for Required function


--1. Analysing Database and Create Conceptual Schemas

--Entities Identified
  
  --Users(User_id,Name,User_type)
  --Books(Book_id,Title,Author_id,Publisher_id)
  --Authors(Author_id,name)
  --Publisher(Publisher_id,name)
  --Book Copies(copy_id,book_id,status)
  --Issue Record(issue_id,copy_id,user_id,issue_date,return_date,due_date,fine)
  --Fines(Fine_id,user_id,Amount)

  Create database OLMS


--2. Decompose all table to minimum Space Oriented(Normalization)

create table Users
(
user_id int primary key,
Name varchar(100),
User_type varchar(100)not null
)




Create Table Authors
(
Author_id int primary key,
Name varchar(100) not null
)



create table Publisher
(
Publisher_id int primary key,
Name varchar(100)
)




Create table Books
(
Book_id int primary key,
Title varchar(200),
Author_id int,
Publisher_id int,
Foreign key (Author_id) references Authors (Author_id),
Foreign key (Publisher_id) references Publisher (Publisher_id)
)



Create Table BookCopies
(
Copy_id int primary key,
Book_id int,
Status varchar(30),
Foreign key (Book_id) references Books (Book_id)
)


Create Table IssueRecords
(
Issue_id int primary key,
Copy_id int,
user_id int,
Issue_date date,
Due_date date,
Return_date date,
Fine decimal
Foreign key (Copy_id) references BookCopies (Copy_id),
Foreign key (user_id) references Users (user_id)
)

select * from Users
select * from Authors
select * from Publisher
select * from Books
select * from BookCopies
select * from IssueRecords



INSERT INTO Users (user_id, Name, User_type) VALUES
(1, 'Ravi Sharma', 'Student'),
(2, 'Ananya Gupta', 'Student'),
(3, 'Vikram Singh', 'Student'),
(4, 'Priya Mehta', 'Faculty'),
(5, 'Amit Verma', 'Faculty'),
(6, 'Neha Kapoor', 'Student'),
(7, 'Suresh Yadav', 'Student'),
(8, 'Manish Tiwari', 'Faculty'),
(9, 'Kavita Joshi', 'Student'),
(10, 'Arjun Nair', 'Faculty');

-- Insert into Authors
INSERT INTO Authors (Author_id, Name) VALUES
(1, 'Chetan Bhagat'),
(2, 'Arundhati Roy'),
(3, 'Ruskin Bond'),
(4, 'R.K. Narayan'),
(5, 'Jhumpa Lahiri'),
(6, 'A.P.J Abdul Kalam'),
(7, 'Amish Tripathi'),
(8, 'Kiran Desai'),
(9, 'Khushwant Singh'),
(10, 'Sudha Murty');

-- Insert into Publisher
INSERT INTO Publisher (Publisher_id, Name) VALUES
(1, 'Penguin India'),
(2, 'HarperCollins'),
(3, 'Oxford Press'),
(4, 'Rupa Publications'),
(5, 'Scholastic India'),
(6, 'Macmillan'),
(7, 'Random House'),
(8, 'Bloomsbury'),
(9, 'Jaico Publishing'),
(10, 'Hachette India');

-- Insert into Books
INSERT INTO Books (Book_id, Title, Author_id, Publisher_id) VALUES
(1, 'Five Point Someone', 1, 4),
(2, 'God of Small Things', 2, 1),
(3, 'Malgudi Days', 4, 3),
(4, 'Interpreter of Maladies', 5, 2),
(5, 'Wings of Fire', 6, 6),
(6, 'Immortals of Meluha', 7, 9),
(7, 'Train to Pakistan', 9, 3),
(8, 'Wise and Otherwise', 10, 5),
(9, 'The Inheritance of Loss', 8, 7),
(10, 'The Blue Umbrella', 3, 8);

-- Insert into BookCopies
INSERT INTO BookCopies (Copy_id, Book_id, Status) VALUES
(1, 1, 'Available'),
(2, 1, 'Issued'),
(3, 2, 'Available'),
(4, 3, 'Issued'),
(5, 4, 'Available'),
(6, 5, 'Issued'),
(7, 6, 'Available'),
(8, 7, 'Issued'),
(9, 8, 'Available'),
(10, 9, 'Available');

-- Insert into IssueRecords
INSERT INTO IssueRecords (Issue_id, Copy_id, user_id, Issue_date, Due_date, Return_date, Fine) VALUES
(1, 2, 1, '2025-01-10', '2025-01-20', '2025-01-22', 20.00),
(2, 4, 2, '2025-01-15', '2025-01-25', '2025-01-24', 0.00),
(3, 6, 3, '2025-02-01', '2025-02-10', NULL, 0.00),
(4, 8, 4, '2025-02-05', '2025-02-15', '2025-02-20', 50.00),
(5, 2, 5, '2025-03-01', '2025-03-10', NULL, 0.00),
(6, 4, 6, '2025-03-05', '2025-03-15', '2025-03-14', 0.00),
(7, 6, 7, '2025-03-10', '2025-03-20', '2025-03-25', 30.00),
(8, 8, 8, '2025-04-01', '2025-04-10', NULL, 0.00),
(9, 4, 9, '2025-04-05', '2025-04-15', '2025-04-18', 10.00),
(10, 6, 10, '2025-04-10', '2025-04-20', NULL, 0.00);


--3 Describe all types of Relationship

 One-to-Many = Authors to Books
 One-to-Many = Publishers to Books
 One-to_Many = BookCopies to Books
 One-to-Many = IssueRecord to Users




--4 Find all Super Keys


  --Users(User_id,Name,User_type)

     User_id - Primary key
     Name - Super key
     User_type - Super key


  --Books(Book_id,Title,Author_id,Publisher_id)

     Book_id - Primary key
	 Title - Super key
	 Author_id - Super key
	 Publisher_id - Super key


  --Authors(Author_id,name)
    
	 Author_id - Primary key
	 Name - Super key


  --Publisher(Publisher_id,name)
    
	 Publisher_id - Primary key
	 Name - Super key


  --Book Copies(copy_id,book_id,status)

    Copy_id - Primary key
	Book_id - Super key
	Status - Super key


  --Issue Record(issue_id,copy_id,user_id,issue_date,return_date,due_date,fine)
  
     Issue_id - Primary key
	 Id_copy - Super key
	 User_id - Super key
	 Issue_date - Super key
	 Due_date - Super key
	 Return_date - Super key
	 Fine - Super key





--5. Use All Types of Constraint on the Table

   -- Primary key:-

    -- Users       (User_id)
    -- Authors     (Author_id)
	-- Publishers  (Publisher_id)
	-- Books       (Book_id)
	-- BookCopies  (Copy_id)
	-- issueRcord  (Issue_Id)
	

  -- Not Null:-

    -- Users   (User_type)
	-- Authors (Name)



 -- Foreign Key:-

   -- Books  - Foreign key (Author_id) refernces Authors (Author_id)
   -- Books  - Foreign key (Publisher_id) references Publisher (Publisher_id)


   -- BookCopies - Foreign key (Book_id) references Books (Book_id)

   -- IssueRecord - Foreign key (Copy_id) references BookCopies (Copy_id)
   -- IssueRecord - Foreign key (User_id) references Users (User_id)


  -- 📊 Real-World & Business-Level SQL Questions


select * from Users
select * from Authors
select * from Publisher
select * from Books
select * from BookCopies
select * from IssueRecords

-- List all books that are currently available in the library.


select b.title as Books_Available
from books b
join bookcopies c on
b.Book_id = c.Book_id
where c.status = 'Available'

-- Find all students who have overdue books (Return_date > Due_date or NULL).

select u.Name
from users u
join IssueRecords i
on u.user_id = i.user_id
where Return_date > Due_date


-- Show the list of faculty members who borrowed books in 2025.


select u.user_type
from users u
join IssueRecords i
on u.user_id = i.user_id
where  u.user_type = 'Faculty' and
year(Issue_date) = '2025'


-- Find the top 3 most borrowed books (by title).

select top 3 b.Title ,count(*) as Number_of_issued
from books b 
join bookcopies c on b.Book_id = c.Book_id
join IssueRecords i on c.copy_id = i.copy_id
group by b.Title
order by count(*) desc 


-- List all books along with their author and publisher details.

select b.Title, a.Name as Author_Name, p.Name as Publisher_Name from books b
left join Authors a
on b.Author_id = a.Author_id
left join publisher p
on b.Publisher_id = p.Publisher_id

-- Show users who have paid a total fine greater than 50.


select user_id
from Issuerecords
where Fine >= 50

-- Count how many books each author has published in the library.

select * from books
select  * from authors

select b.Title ,count(*)
from Books b 
left join  Authors a on
b.Author_id = a.Author_id
join Publisher p on
b.publisher_id = p.publisher_id
group by b.Title



-- Identify the most popular author based on total borrowings.

select Top 1
a.Name as Author_Name, sum(Fine) as Total_Fine
from Authors a
join Books b on a.Author_id = b.Author_id
join BookCopies bc on b.Book_id = bc.Book_id
join IssueRecords i on bc.Copy_id = i.Copy_id
group by a.Name
order by Total_Fine desc


-- Find the average borrowing duration (days between Issue_date and Return_date) for students vs faculty.

select u.user_type,
Avg(datediff(day,i.issue_date,Return_date)) as Avg_Duration_Days
from Users u
join  IssueRecords i on
u.user_id = i.user_id
where datediff(day,i.issue_date,Return_date) is not null
group by u.user_type


-- Show the percentage of books currently issued vs available.(peding)

select Status,
count(Status) as Total_copies,
Round(100.0 * count(*) / (select Count(*) from BookCopies),2) as Percentage
from bookCopies
group by Status


-- Which publisher’s books are borrowed the most?


select Top 1
p.Name as Publisher_Name,Count(*) as Most_Borrowed
from Publisher p
join Books b on p.Publisher_id = b.Publisher_id
join BookCopies bc on b.Book_id = bc.Book_id
join IssueRecords i on bc.Copy_id = i.Copy_id
group by p.Name
order by Most_Borrowed desc




-- Identify users who borrowed books but never returned them (Return_date IS NULL).

select u.user_id as Never_Retur_Book
from Users u
join IssueRecords i
on u.user_id = i.user_id
where Return_date IS NULL


-- Calculate the monthly borrowing trend: number of books issued each month in 2025.

select 
format(Issue_date,'yyyy-MM') as MOnths,
count(*) as Number_of_Books
from Issuerecords
where year(Issue_date)= '2025'
Group by format(Issue_date,'yyyy-MM')


-- Find the top 5 users with the highest borrowing frequency.

select Top 5
u.user_id,Count(Issue_Date) as Maximum_borrowing_frequency
from Users u
join IssueRecords i
on u.user_id = i.user_id
group by u.user_id

-- Show the book copies that were borrowed multiple times by different users.(peding)

SELECT 
i.Copy_id,
b.Title,
COUNT(DISTINCT i.user_id) AS DistinctUsers,
COUNT(i.Issue_id) AS TotalBorrowings
FROM IssueRecords i
JOIN BookCopies bc ON i.Copy_id = bc.Copy_id
JOIN Books b ON bc.Book_id = b.Book_id
GROUP BY i.Copy_id, b.Title
HAVING COUNT(DISTINCT i.user_id) > 1;


-- Calculate the total revenue from fines per month in 2025.


select 
format(Return_date,'yyyy-MM') as Months,
sum(Fine) as Total_Fine
from Issuerecords
where year(Return_date) = 2025
group by format(Return_date,'yyyy-MM') 


-- Compare borrowing trends between Students and Faculty (number of books issued, average fine).

select u.user_type,
count(i.issue_id),
AVg(i.Fine) as Average_fine
from users u
join IssueRecords i 
on u.user_id = i.user_id
group by u.user_type


-- Identify which genre/author should the library invest in more (based on borrowings & popularity).

select a.Name as Authors_Name,
Count(i.Issue_id) as Total_Borrowing
from Authors a
join Books b on a.Author_id = b.Author_id
join BookCopies bc on b.Book_id = bc.Book_id
join IssueRecords i on bc.Copy_id = i.Copy_id
Group by a.Name
order by Count(i.Issue_id) desc


-- Predict resource utilization: if 70% of issued books are returned late, which users are contributing most to late returns?

select 
u.Name as users_name,
u.user_type,
count(i.issue_id) as Late_Returns
from Users u
join IssueRecords i on u.user_id = i.user_id
where i.Return_Date > i.Due_date
group by u.Name,u.user_type
order by Late_Returns



-- Find the top 3 high-value users (based on number of borrowings + fines paid).

select top 3
u.user_id,
u.Name,
u.user_type,
count(i.issue_id) as Total_Borrowing,
sum(Fine) as Total_Fine,
(count(i.issue_id) + sum(Fine)) as User_Value_Score
from Users u
join IssueRecords i on u.user_id = i.user_id
group by u.user_id,u.Name,u.user_type
order by User_Value_Score desc


