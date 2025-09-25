1.CREATE A PROJECT ON ONLINE BASED Library Management System on SQL
An online library management system offers a user-friendly way of issuing books and also viewing different books and titles available under a category. 
Take the example of your college library, where both teachers and students can issue books. Usually, the number of days within which you have to return the book 
varies for both the groups. Also, each book has a unique ID, even if they are copies of the same book by the same author. So, a library management system has
an entry for every book, capturing who has issued it, the issue duration, and the amount of fine, if any.

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

insert into Users values
(101,'Aashirwad Patel','Teacher')

insert into Authors values
(1001,'Ramakrishan')

insert into Publisher values
(001,'Rakesh enterprises')

insert into Books values
(1111,'Rich Dad Poor Dad',1001,001)

insert into BookCopies values
(2010,1111,'Available')

insert into IssueRecords values
(9191,2010,101,'15-jun-2015','15-jul-2015','30-jun-2015',0)




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





