Create database library;
show  databases;
use library;
Create table Authores (Author_id int primary key, Author_Name varchar(30));
Create table Categories(Category_id int  primary key ,Category_Name varchar(30));
Create table Publishers(Publisher_id int primary key , Publisher_name varchar(30),Publisher_contact int);
Create table Books (Book_id int primary key ,Book_name varchar(20),Author_id int , Category_id int, Publisher_id int, 
foreign key(Author_id ) references Authores (Author_id ),
foreign key(Category_id) references Categories ( Category_id),
foreign key(Publisher_id) references Publishers( Publisher_id));
Create table Members(Member_id int primary key,Name varchar(30),join_Data datetime ,Email varchar(10),Member_Contact int);
Create table Suppliers(Supplier_id int primary key,Supplier_name varchar(30), supplier_contactinfo int);
Create table Book_issues(issue_ID int primary key , Book_id int,Member_id int, issue_date datetime,due_date datetime,
foreign key(Book_id) references Books(Book_id),
foreign key(Member_id) references Members(Member_id)
);
create table Retuens(Return_id int primary key, issue_id int ,Return_date datetime,fine int, 
foreign key(issue_id) references Book_issues (issue_id) 
);
create table Staff(Staff_id int primary key ,Name varchar(30),Role varchar(20),Hire_date datetime,Attandances char);
show tables;