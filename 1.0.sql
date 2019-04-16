select * from category;
select * from customers;	
select * from employee;
select * from orderdetails;
select * from products;


ALTER TABLE orderdetails
ADD CONSTRAINT CustomerID
FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID);

ALTER TABLE orderdetails
ADD CONSTRAINT ProductID
FOREIGN KEY (ProductID) REFERENCES products(ProductID);

ALTER TABLE customers
modify COLUMN CustomerID int AUTO_INCREMENT;

alter table orderdetails
add orderdate date ;

INSERT INTO orderdetails 
VALUES(2 , 108 , 1 , 108 ,null ,  12/12/18);

select * from orderdetails where productId =1 or productId =2 or productId =8 or productId =11;

select * from products where categoryID = 1 ;

Select  * from customers where Address = "Powai";
	
select  * from customers where CustomerID in(select distinct A.CustomerID from Customers A,Customers B where A.City=B.City and A.CustomerID != B.CustomerID);

Select * from customers 
where CustomerID in (select distinct A.CustomerID from customers A, customers B 
where A.CustomerID!=B.CustomerID and A.City = B.City);

select * from orderdetails where CustomerID in(select CustomerID from customers where Address = "Mumbai");

Select * from customers 
where CustomerID in 
(select distinct A.CustomerID from customers A, customers B 
		where A.CustomerID!=B.CustomerID 
and A. ContactNo=B. ContactNo);

select * from orderdetails where CustomerID in
(select CustomerID from customers where City = "Mumbai");

select * from orderdetails where orderdate = "2018-11-15";

select sum(total_cost) from orderdetails where orderdate="2018-11-15";

   select * from orderdetails where orderdate like "2018-11-%";
   
   select * from customers 
   where CustomerID in (select CustomerID 
		from orderdetails where orderdate not like "2018-11-%");
        
select CustomerID,sum(total_cost) from orderdetails group by CustomerID;
    
select CustomerID,count(OrderID) from orderdetails group by CustomerID;

select CustomerID,sum(total_cost) from orderdetails where CustomerID=101;

select products.ProductID,products.ProductName,Quantity from products,orderdetails
where OrderID in(select OrderID from orderdetails where orderdate="2019-02-14") 
and products.ProductID = orderdetails.ProductID;


insert into orderdetails values(1,60,20,1200,null,"2019-02-24",102);

delete from orderdetails where order_id=11;

alter table orderdetails add check(CustomerID>0);

select * from orderdetails order by total_cost;

select sum(Quantity) from orderdetails;

select * from orderdetails where total_cost in(select max(total_cost) from orderdetails);

select * from orderdetails where total_cost in(select min(total_cost) from orderdetails);

select * from orderdetails where total_cost between 100 and 300;

select * from orderdetails where CustomerID not in
(select a.CustomerID from orderdetails a,orderdetails b 
where a.CustomerID=b.CustomerID and a.OrderID != b.OrderID);

select distinct CustomerID from orderdetails
 where CustomerID in(select a.CustomerID from orderdetails a,orderdetails b 
where a.CustomerID!=b.CustomerID and a.OrderID<>b.OrderID);

select * from orderdetails where orderdate like "%11%";

update orderdetails set orderdate=curdate() where CustomerID=102;

select orderdetails.OrderID , products.ProductID ,c.CustomerName , products.ProductName ,
	orderdetails.Cost , orderdetails.total_cost,orderdate 
 from orderdetails , products , customers as c 
 where orderdetails.ProductID = products.ProductID and c.CustomerID = orderdetails.CustomerID;
 
 select count(distinct(OrderID)) from orderdetails,category,products where products.CategoryID = 1 and products.ProductID=orderdetails.ProductID;  
 
 select category.CategoryName , count(ProductID) from category, products 
 where category.CategoryID = products.CategoryID 
 group by products.CategoryID;
 
  
 select category.CategoryName , count(OrderID) from category, products ,orderdetails
 where category.CategoryID = products.CategoryID and products.ProductID = orderdetails.ProductID
 group by products.CategoryID;	
 
 select sum(Quantity_Available), CategoryName from products,category where products.CategoryID=category.CategoryID group by products.CategoryID ;

select sum(Quantity), CategoryName from products,category,orderdetails where products.CategoryID=category.CategoryID and products.ProductID=orderdetails.ProductID group by products.CategoryID ;

select CustomerID,count(*) from orderdetails where CustomerID in(select a.CustomerID from orderdetails a,orderdetails b where a.CustomerID=b.CustomerID and a.OrderID<>b.OrderID) group by CustomerID;

Select * from customers where CustomerName like "% Shah";

select customers.CustomerName , employee.EmployeeName , employee.Address from customers ,employee where customers.Address = employee.Address ;

select distinct A.CustomerName  , B.CustomerName , A.City  from customers A , customers B where A.City = B.City and A.CustomerID <> B.CustomerID order by A.CustomerName;

delete from products where ProductName = "Book";

update products set Quantity_Available = 10 where ProductID=9;

Select * from products order by Quantity_Available DESC ;

Select max(Price*Quantity_Available),ProductName from products;

Select max(Price) as a,ProductName from products;

Select max(Quantity) ,ProductName from orderdetails,products where products.ProductID=orderdetails.ProductID;

select CustomerName , sum(total_cost) from orderdetails,customers group by orderdetails.CustomerID;

select sum(total_cost), CustomerName 
from customers,orderdetails 
where customers.CustomerID = orderdetails.CustomerID 
group by customers.CustomerID;

select max(total_cost) from orderdetails where orderdate like "%-11-%";

select sum(total_cost) from orderdetails where orderdate like "%-11-%";

select CustomerName from customers where CustomerID in (select CustomerID from orderdetails where orderdate like "2019-%-%");

select EmployeeName from employee where City not in (Select City from customers);

select EmployeeName,CustomerName from employee,customers where employee.City = customers.City;

Select Count(EmployeeName),city from employee 
where EmployeeID in (select distinct A.EmployeeID from employee A, employee B 
where A.EmployeeID!=B.EmployeeID and A. City=B. City) group by City;

select count(EmployeeID) , city from employee 
where EmployeeID in(Select Distinct A.EmployeeID from employee A, employee B 
where A.EmployeeID!=B.EmployeeID) group by City;

Insert into employee
Values(15,9323255661,"Nishit Salot","Mulund West","Mumabi");

select EmployeeName from employee where EmployeeName in (Select CustomerName from customers);

Select count(EmployeeID) from employee ;
select count(distinct(city)) from employee;

SELECT * FROM products where Price >50 ;

Select orderdetails.ProductID,ProductName,sum(Quantity) from orderdetails,products where orderdetails.ProductID=products.ProductID group by ProductID order by Quantity DESC;

select * from employee where joindate > '2018-11-01';

select * from employee where employee.joindate > (select orderdate from orderdetails where OrderID = 1);

select * from products left join category on products.CategoryID = category.CategoryID;

select * from orderdetails inner join products on products.ProductID = orderdetails.ProductID;

select * from products left join orderdetails on products.ProductID = orderdetails.ProductID order by products.ProductID;

select * from customers left join orderdetails on customers.CustomerID= orderdetails.CustomerID order by customers.CustomerID;

select customers.CustomerName , sum(total_cost) from customers left join orderdetails on customers.CustomerID= orderdetails.CustomerID group by customers.CustomerName;

select products.ProductName , sum(quantity) from products left join orderdetails on products.ProductID = orderdetails.ProductID group by products.ProductName;

select products.ProductName , sum(quantity*price) A from products left join orderdetails on products.ProductID = orderdetails.ProductID group by products.ProductName order by A DESC;

select products.ProductName , sum(Quantity_Available*Price) A from products group by products.ProductName order by A DESC;

select category.CategoryName , sum(Quantity_Available*Price) A from products,category where products.CategoryID=category.CategoryID group by category.CategoryName order by A DESC;

select sum(quantity),CustomerID from orderdetails A where A.OrderID in (select a.OrderID from orderdetails a,orderdetails b 
where a.CustomerID=b.CustomerID and a.OrderID<>b.OrderID);
   
select ProductName ,Price from products where CategoryID=1;

select count(CustomerID) , city from customers 
where CustomerID in(Select Distinct A.CustomerID from customers A , customers B 
where A.CustomerID!=B.CustomerID) group by City order by count(CustomerID) DESC;

select ProductName from products where ProductName like "%t";

select products.ProductName,orderdetails.ProductID from orderdetails inner join products where orderdetails.ProductID = products.ProductID and orderdate > '2018-11-07';

select customers.City from customers where City not in (Select City from employee);

select CustomerName Names from customers 
union select EmployeeName from employee order by Names;

select CustomerName A from customers where city = 'Mumbai' union select EmployeeName from employee where City = 'Mumbai';

select distinct customers.CustomerName from orderdetails join customers,products where customers.CustomerID = orderdetails.CustomerID and orderdetails.ProductID = (select ProductID from products where ProductName = 'Maggi');

Select *
From orderdetails
Where  orderdate between ('2018-11-06') and ('2018-12-31');

Select AVG( price) AS  "Average Price"
From Products
Where price > 10;