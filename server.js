const { eachOf } = require('async');
const { title } = require('process');
const bodyParser = require('body-parser');
const con = require("./connection");

var express = require('express');
var sesstion = require('express-session');
var app = express();
var session = require('express-session');
var mysql = require('mysql');
var fs = require("fs");
const { count, error, Console } = require('console');
const { render } = require('ejs');


app.set('view engine', 'ejs');
app.set('views', './views');
app.use(session({secret: 'ssshhhhh',saveUninitialized: true,resave: true}));


app.use(express.static('public'));
app.use(express.static('../public'));
app.use(express.static(__dirname + '/public'));
app.use(express.static(__dirname + '../public'));
//body-parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));


var sess;
var username_display;
var user_id;


app.get('/', function(req, res){
         res.render("home" );
});


// app.get('/main/:idUser', function(req, res){
//       res.render("mainn", {page : 'homepage' ,  iduser : req.params.idUser, user : username_display});
// });

// app.get('/main/:idUser/:p', function(req, res){
//       var data = {};
//       con.query(" SELECT COUNT(t.tag_id) AS totalTerms FROM tag AS t WHERE t.set_id IN ( SELECT set_id FROM `set`  WHERE owner_id = '1' )",  function (err, rows, fields) {
//             if (err) throw err
//             data =  rows;
//             console.log(data[0].totalTerms);
//             res.render("mainn", {page : req.params.p  , iduser : req.params.idUser,  user : username_display , countTerm : data[0].totalTerms} );
//       })

// });

app.get('/main/:idUser/:p', function(req, res){
      var data = {};
      var queries = "SELECT set_name AS termName FROM `set` AS t WHERE owner_id = ?;SELECT set_id, COUNT(tag_id) as totalTerms FROM tag AS t WHERE t.set_id IN ( SELECT set_id FROM `set`  WHERE owner_id = ? ) GROUP BY set_id";
      con.query( queries,[req.params.idUser, req.params.idUser], function(error, results, fields){
            if( error){
                  throw error;
            }
            data = results;
            console.log("data :" ,data[0][1],  data[1]);
            res.render("mainn", {page : req.params.p ,
                   iduser : req.params.idUser,
                   user : username_display ,
                  setName :data[0],
                  countTerm : data[1]
                  });
      })
});
// nghĩa viết
app.get('/learning/:idUser:s/:p', function(req, res){
      var data = {};
      var queries = "SELECT set_name AS termName FROM `set` AS t WHERE owner_id = ?;SELECT set_id, COUNT(tag_id) as totalTerms FROM tag AS t WHERE t.set_id IN ( SELECT set_id FROM `set`  WHERE owner_id = ? ) GROUP BY set_id;select term,definition from tag where set_id = ?";
      con.query( queries,[req.params.idUser, req.params.idUser,req.params.s], function(error, results, fields){
            if( error){
                  throw error;
            }
            data = results;
            console.log(req.originalUrl);
            res.render("learning", {page : req.params.p ,
                  set_id : req.params.s,
                   iduser : req.params.idUser,
                   user : username_display ,
                  setName :data[0],
                  countTerm : data[1],
                  tagdataDef : data[2],
                  curUrl : req.originalUrl
                  });
      })
});
// kết thúc nghĩa viết

// app.post('/learning/:idUser:s/:p', function(req,res){
//       var word = req.body.word;
//       console.log(word);
//       res.render('/learning/:idUser:s/:p', {
//             page : req.params.p ,
//             set_id : req.params.s,
//             iduser : req.params.idUser,
//             user : username_display ,
//             wordLearn: word
//       })
// })



app.get('/main/:idUser/create-set', function(req, res){
      res.render("mainn", {iduser : req.params.idUser, page : 'create-set' , user : username_display});
});

app.post('/main/:idUser/create-set', function(req, res){

      var TieuDe = req.body.TieuDe;
      var MoTa = req.body.MoTa;
      var ThuatNgu1 = req.body.ThuatNgu1;
      var DinhNghia1 = req.body.DinhNghia1;
      var ThuatNgu2 = req.body.ThuatNgu2;
      var DinhNghia2 = req.body.DinhNghia2;
      var ThuatNgu3 = req.body.ThuatNgu3;
      var DinhNghia3 = req.body.DinhNghia3;
      var ThuatNgu4 = req.body.ThuatNgu4;
      var DinhNghia4 = req.body.DinhNghia4;
      var ThuatNgu5 = req.body.ThuatNgu5;
      var DinhNghia5 = req.body.DinhNghia5;     
      var checkInput = "";
      if(TieuDe && MoTa){
            if(ThuatNgu1 && DinhNghia1 && ThuatNgu2 && DinhNghia2 ){
                  var queries = "INSERT INTO `set`(`set_id`, `set_name`, `description`, `image_url`, `owner_id`, `date_created`) VALUES (null,?,?,'abc', ?, now()) ; INSERT INTO `tag`(`tag_id`, `term`, `definition`, `image_url`, `set_id`) VALUES (null, ? , ? , 'abc', )";
                  con.query( queries, [TieuDe, MoTa, req.params.idUser], function(error, results, fields){
                        if( error){
                              throw error;
                        }
                        console.log("insert data to set successfull");
                        res.render("mainn", {iduser : req.params.idUser, page : 'create-set' , user : username_display, checkInput : checkInput});
                  });
                  // res.render("mainn", {iduser : req.params.idUser, page : 'create-set' , user : username_display, checkInput : checkInput});
            }

            else{
                  checkInput = "Phải thêm ít nhất 2 thẻ";
                  res.render("mainn", {iduser : req.params.idUser, page : 'create-set' , user : username_display, checkInput : checkInput});
                  // res.render("mainn", {iduser : req.params.idUser, page : 'create-set' , user : username_display, checkInput : checkInput});
            }
      }
      console.log(checkInput);
});

app.get("/learning/:idUser", function(req, res){

      res.render("learning", { iduser : req.params.idUser, user : username_display, page: 'memory-card'});
});


// app.get("/learning/:idUser/:page", function(req, res){

//       res.render("learning", { iduser : req.params.idUser, user : username_display , page : req.params.page });
// });


app.get("/learning", function(req, res){
      res.render("try");
});

app.get('/login', function(req, res){
      res.render("login" );
});

app.post('/login', function(request, response){

	var username = request.body.userName;
      var password = request.body.passWord;

      sess = request.session;
      sess.username = request.body.userName;

      var data = {};
	if (username && password) {
		con.query("SELECT * FROM user where user_name = '"+username+"'", function(error, results, fields) {
                  data =  results;
                  console.log(username);
                  console.log(password);
                  console.log(data[0].user_name);
                  console.log(data[0].password);
                  sess.user_id = data[0].user_id;

			if (username == data[0].user_name && password == data[0].password) {
                        console.log("login succesfully");
                        username_display = sess.username;
                        user_id = sess.user_id;
                        response.redirect("http://localhost:8081/main/" + sess.user_id + "/homepage" );
				// response.render("mainn" ,  {page : 'homepage' , user : data[0].username });
                  }
                   else {
                  console.log('Incorrect Username and/or Password!');
                        response.redirect("login");
                   }
			response.end();
		});
	} else {
		console.log('Please enter Username and Password!');
		response.end();
      }

});


app.get('/signup', function(req, res){
      res.render("signup" );
});

app.post('/signup', function(request, response) {
	var username = request.body.UserName;
      var password = request.body.PassWord;
      var firstname = request.body.FirstName;
      var lastname = request.body.LastName;

      console.log( 'input signup :' , username , ' ', password, ' ', firstname, ' ', lastname );
      var query_check = " SELECT * FROM user WHERE user_name = ? ";
//      var query  = "INSERT INTO `user`(`user_id`, `first_name`, `last_name`, `password`, `username`, `email`, `date_of_birth`, `avatar_url`, `type_account`) VALUES ('6', ?, ?, ?, ? , null, null, null, null )";
      var query = "INSERT INTO `user`(`user_id`, `user_name`, `first_name`, `last_name`, `password`, `email`, `date_of_birth`, `avatar_url`, `type_account`) VALUES (null, ?, ?, ?, ?, null, null, null, null)";
      con.query(query_check, [username], function(error, results, fields){
            if(error){
                  throw error;
            }
            if( results.length >  0){
                  console.log('username exists');
            }

            else{
                  con.query(query, [username, firstname, lastname, password], function(err, result){
                        if(err){
                              throw err;
                        }
                        console.log("signup successfully!");
                        response.render('home');

                  });
            }

      });
      // con.query(query, function (error, results, fields) {
      //       if (error) {
      //        console.log("err");
      //       message =  "failed";
      //       response.render("signup");
      //       }
      //       else {
      //             console.log("user registered sucessfully");
      //             message = "sucessfully";
      //             response.render("home");
      //         }
      //     });
});



app.get('/login_learning', function(req, res){
      res.render("login_learning" );
});

app.post('/login_learning', function(request, response) {
	
      var username = request.body.userName;
      var password = request.body.passWord;

      sess = request.session;
      sess.username = request.body.userName;

      console.log("ssss" , sess.username);

      var data = {};
	if (username && password) {
		con.query("SELECT * FROM user where username = '"+username+"'", function(error, results, fields) {
                  data =  results;
                  console.log(username);
                  console.log(password);
                  console.log(data[0].username);
                  console.log(data[0].password);
                  sess.user_id = data[0].user_id;
			if (username == data[0].username && password == data[0].password) {
                        console.log("login succesfully");
                        username_display = sess.username;
                        user_id = sess.user_id;
                        response.redirect("http://localhost:8081/main/" + sess.user_id + "/homepage" );
				// response.render("mainn" ,  {page : 'homepage' , user : data[0].username });
                  }
                   else {
                  console.log('Incorrect Username and/or Password!');
                        response.redirect("login_learning");
			}
			response.end();
		});
	} else {
		console.log('Please enter Username and Password!');
		response.end();
      }
});



var server = app.listen(8081, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Example app listening at http://%s:%s", host, port)
})