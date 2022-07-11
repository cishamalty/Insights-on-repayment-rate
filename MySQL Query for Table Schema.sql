Create Database if not exists Table_schema;
Use Table_schema;

Create table if not exists Loans
(
Loan_id int not null auto_increment,
Loan_Account varchar(20),
Loan_Amount Decimal,
primary key( Loan_id)
) 
engine = innodb;

Create table if not exists  Loan_Repayments
(
Loan_Repayments_id int not null auto_increment,
Loan_id int,
Repayment_Date  date,
Repayment_Amount Decimal,
primary key(Loan_Repayments_id,Loan_id),
index (Loan_id),
foreign key (Loan_id) references Loans (Loan_id)
) 
engine = innodb;


Create table if not exists sales_Person
(
sales_Person_id int not null auto_increment,
sales_Person_Name varchar(20),
Date_Active_From datetime,
sales_Person_Phone varchar(20),
sales_Person_DOB Date,

primary key ( sales_Person_id)
) 
engine = innodb;


Create table if not exists Outlet
(
Organisation_id int not null auto_increment,
Service_Centre_Name varchar(20),
Region varchar(20),
Sub_Region varchar(20),

primary key(Organisation_id)
) 
engine = innodb;


Create table if not exists Customer
(
Customer_ID int not null auto_increment,
Customer_Names varchar(20),
Customer_DOB Date,
Customer_Gender varchar(20),
Customer_Phone varchar(20),

primary key(Customer_ID)
) 
engine = innodb;


Create table if not exists Products
(
Product_id int not null auto_increment,
Product_Name varchar(20),
Product_Type varchar(20),
Product_Model varchar(20),


primary key(Product_id)
) 
engine = innodb;

Create Table If not exists sales
(
sales_ID int not null auto_increment,
Loan_id int,
Date_of_sale datetime,
sales_Person_id int,
Organisation_id int, 
Customer_id int,
Product_id int,
primary key (sales_ID, Loan_id,sales_Person_id,
Organisation_id,Customer_id,Product_id), 
index (Loan_id), Index(sales_Person_id),
Index(Customer_id),Index(Product_id),
foreign key (Loan_id) references Loans (Loan_id),
foreign key (sales_Person_id) references sales_Person(sales_Person_id),
foreign key (Organisation_id) references Outlet (Organisation_id),
foreign key (Customer_id) references Customer(Customer_id),
foreign key (Product_id) references Products (Product_id)

) engine = innodb;

DESCRIBE sales;
