const express = require("express");
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
    con.query(`SELECT * FROM employee`, (err, result) => {
        console.log(result);
        res.render("results1",{result});
    });
});

module.exports = router;