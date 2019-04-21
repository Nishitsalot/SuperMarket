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
    res.render("Delete");
});

router.post("/", (req, res) => {
    console.log(req.body);
    let sql =` DELETE From orderdetails
                    WHERE  CustomerID= ${req.body.c_id}  ;`  ;
    
    con.query(sql, (err, result) => {
        if(err) res.redirect("/delete");
        else res.redirect("/");
    });
});

module.exports = router;
//router.get("\" , (req,res)) => {res.render("customer");})