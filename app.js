'use strict';
const express = require('express');
const mysql = require('mysql');
const constants = require('./constants');
const secrets = require('./secrets');

const app = express();

const con = mysql.createConnection({
    host: secrets.sql_host,
    user: secrets.sql_user,
    password: secrets.sql_password,
    database: constants.db
});

function create_tables(con) {
    var customers =
    `CREATE TABLE IF NOT EXISTS ${constants.customer_table} 
    ( CustomerID int NOT NULL PRIMARY KEY,
        ContactNo mediumtext ,
        CustomerName varchar(50) ,
        Address varchar(100) ,
        City varchar(20)
    );`;
    con.query(customers, function (err, result) {
        if (err) throw err;
        console.log("Customers Table created");
	});
		
		var category =
    `CREATE TABLE IF NOT EXISTS ${constants.category_table} 
    ( CategoryID int NOT NULL PRIMARY KEY,
	CategoryName varchar(50)
    );`;
    con.query(category, function (err, result) {
        if (err) throw err;
		console.log("Category Table created");
		});

	var products =
    `CREATE TABLE IF NOT EXISTS ${constants.products_table} 
    ( ProductName varchar(50) , 
	Price int(11) ,
	Quantity_Available int(11) , 
	CategoryID int , 
	ProductID int NOT NULL PRIMARY KEY
    );`;
    con.query(products, function (err, result) {
        if (err) throw err;
		console.log("Products Table created");
	});

	var employee =
    `CREATE TABLE IF NOT EXISTS ${constants.employee_table} 
    ( EmployeeID int PRIMARY KEY NOT NULL , 
	contactno mediumtext ,
	EmployeeName varchar(50) ,
	Address varchar(100) ,
	City varchar(50) ,
	joindate date
    );`;
    con.query(employee, function (err, result) {
        if (err) throw err;
		console.log("Employee Table created");
	});

	var orderdetails =
    `CREATE TABLE IF NOT EXISTS ${constants.order_table} 
    ( ProductID int(11), 
	Cost int(11) ,
	Quantity int(11) ,
	total_cost int(11) ,
	OrderID int PRIMARY KEY,
	orderdate date ,
	CustomerID int(11)
    );`;
    con.query(orderdetails, function (err, result) {
        if (err) throw err;
		console.log("orderdetails Table created");
	});
}

con.connect(function (err) {
    if (err) throw err;
    console.log("Connected to MySQL!");
      con.query(`CREATE DATABASE IF NOT EXISTS ${constants.db}`, function (err, result) {
        if (err) throw err;
        console.log("Database created");
      });
     create_tables(con);
});

app.set("view engine", "ejs");
app.use(express.static(__dirname + "/public"));
app.use(express.urlencoded({
    extended: true
}));

app.get("/", (req, res) => {
    res.render("demo");
});

app.use("/customers", require("./routes/customers"));
app.use("/place_order", require("./routes/place_order"));

app.listen(3000);
