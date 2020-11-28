var mysql = require('mysql');
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    // database: "quizlet"

    database: "quizlet",
    multipleStatements: true
  });



  con.connect((err) => {
        if(!err){
            console.log("connected");
        }  
        else{
            console.log("connection failed");
        }

    });

    module.exports = con;