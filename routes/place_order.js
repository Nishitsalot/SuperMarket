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
    res.render("Order");
});

router.post("/", (req, res) => {
    console.log(req.body);
    let sql = `INSERT INTO orderdetails VALUES (${req.body.id}, '${req.body.cost}', '${req.body.quantity}', '${req.body.total_cost}', '${req.body.NULL}', '${req.body.date}', '${req.body.c_id}');`;
    con.query(sql, (err, result) => {
        if(err) res.send(err);
        else res.redirect("/place_order");
    });
});

module.exports = router;
//router.get("\" , (req,res)) => {res.render("customer");});