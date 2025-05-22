use library;
show tables;
/* disply Books table */
SELECT * FROM books;
/* describe Structure of books table */
DESC Books;
/*display colums of Authores table */
show columns FROM authores;
/*display Authores table */
SELECT * FROM authores;
/* display  all from authore where authore name is Tony Robbins*/
SELECT * FROM authores WHERE Name = "Tony Robbins";
/*add to new Columns  Total_Copy & Avalable_Copy in Books table*/  
alter table Books 
add Total_Copy varchar(6), add Avalable_Copy varchar(6);
/*add new Column Field in Authores table */
  alter table Authores
add 
   Field varchar(50);
/*drop Publisher Contact Number from Punlishers table */
ALTER table Publishers
drop column  Publisher_contact ;
/*drop Attandances column  from  Staff table */
Alter table staff drop  column Attandances;
/*describe Structure of Staff trable */
DESC Staff;
/*display Books name ,Authore name & Field  (using Join )*/
SELECT books.Book_name, authores.Name, authores.Field
from books join authores ON books.Author_id = authores.Author_id
WHERE Field = "Personal Development";
/* perfome to right join of Books table with Authore table */
Select *
from books right join authores ON books.Author_id=authores.Author_id;
/*display  all unique fields*/   
Select distinct(Field) From authores;
/*display total number of unique fields */
Select count(distinct(Field)) From authores;
/* displsy Fields in Assending order*/
select Field from authores
order by Field asc;
/* displsy Fields in Desending order*/
select Field from authores
order by Field desc;
/*check in books table Rich Dad Poor Dad & Atomic Habits are there in library */
select Book_name from books 
WHERE book_name IN ("Rich Dad Poor Dad", "Atomic Habits");
/* display all from Categories in Assending order*/
SELECT * from  Categories
ORDER BY Category_Name ASC;
/* Display all that book name which are Commom in Books table  and Category table */
SELECT books.book_name from books right join Categories ON Books.Category_id=Categories.Category_id ;
/*Find members who have not yet returned any books*/
/*Add new column in Returns table name Returned*/
 alter table Retuens add Returned varchar(10);
/*insert YES in Returned column if  the member has 0 Fine & insert NO if Fine is 100 */
UPDATE Returns
SET Returned = 'NO'
WHERE Fine = 100;
UPDATE Retuens
SET Returned = 'Yes'
WHERE Fine = 0;
/*display Book name which was issued by member from libarary and member name , contact no who have not returned the book yat*/
Select books.Book_name, members.Name ,members.Member_Contact
from Members Members
 join Book_issues issues on members.Member_id=issues.Member_id
join
Books books on issues.Book_id=books.book_id
left join retuens R on issues.issue_id=r.issue_id
where r.Returned='No';
/*identify which books was issued by a specific member (e.g., Member_ID = 99)*/
select b.Book_name , bi.Member_id , bi.issue_date from Books b
join Book_issues bi on b.book_id=bi.Book_id
where member_id=99;
/*Find all authors whose names start with the letter "A".*/
select Name from authores
where Name like "A%";
/*List all books with their authors' names.*/
Select b.Book_name,a.Name from Books b
join authores a on b.author_id=a.author_id
order by a.name asc;
/*Show the names of staff who were hired in the last year.*/
desc staff;
/*How many books are written by each author?*/
select author_id,count(*) as No_Book from Books
group by author_id; 
/*Total fine collected per member*/
SELECT Member_id, SUM(Fine) AS Total_Fine
FROM Book_issues
JOIN Retuens ON Book_issues.issue_id = Retuens.issue_id
GROUP BY Member_id;
s
