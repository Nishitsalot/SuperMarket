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
    res.render("employee");
});

router.post("/", (req, res) => {
    console.log(req.body);
    let sql = `INSERT INTO employee VALUES (${req.body.e_id}, '${req.body.contact}', '${req.body.name}', '${req.body.address}', '${req.body.city}', 04/04/2019);`;
    con.query(sql, (err, result) => {
        if(err) res.redirect("/employee");
        else res.redirect("/display1");
    });
});

module.exports = router;
//router.get("\" , (req,res)) => {res.render("customer");});
