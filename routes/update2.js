const express = require('express');
const mysql = require('mysql');
const constants = require('../constants');
const secrets = require('../secrets');

var router = express.Router({ mergeParams: true });

const con = mysql.createConnection({
    host: secrets.sql_host,
    user: secrets.sql_user,
    password: secrets.sql_password,
    database: constants.db
});

router.get("/", (req, res) => {             
    res.render("update2");
});

router.post("/", (req, res) => {
    console.log(req.body);
    let sql =` UPDATE employee
               SET   contactno = '${req.body.contact}', EmployeeName ='${req.body.name}', Address = '${req.body.address}', City='${req.body.city}' 
              WHERE  EmployeeID= ${req.body.e_id} ;`  ;
    con.query(sql, (err, result) => {
        if(err) res.redirect("/update2");
        else res.redirect("/display2");
    });
});

module.exports = router;
//router.get("\" , (req,res)) => {res.render("customer");})