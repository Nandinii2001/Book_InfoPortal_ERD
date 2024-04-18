/*ENTITY RELATIONSHIP DESIGN (ERD)/ DATABASE SCHEMA*/

/*creating a databse for books and making it default*/
create database books;
use books;

/*creating table to store books information*/
create table books_table(isbn varchar(13) primary key, title char(55) not null, genre char(20));
describe books_table;

/*creating table to store authors details*/
create table authors(ID integer primary key not null, author_Name char(50), Country char(50));
describe authors;

/*creating table to store publishers details*/
create table publisher(pub_ID int primary key, pub_name char(50) not null, pub_date date not null, isbn varchar(13));
describe publisher;
/*drop table publisher;*/

/*create relation b/w books and publisher table*/
alter table publisher 
add constraint fk_isbn foreign key(isbn) references books_table(isbn);

/*create relation b/w authors and books table. Since these two tables have many to many realtion, we need to create another table
and also create realtion with both the books and authors table seperately*/
create table book_author(isbn varchar(13), ID int,
 constraint pk_iI primary key (isbn, ID),
 constraint fk_isbn1 foreign key(isbn) references books_table(isbn), 
 constraint fk_ID foreign key(ID) references authors(ID));

describe book_author;


