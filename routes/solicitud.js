var express = require('express');
var router = express.Router();
var model_user = require("../models/user")();
var model_prioridad = require("../models/prioridad")();

/* GET home page. */
router.get('/', function(req, res) {
  	res.render('solicitud/index');
});
router.get('/nueva', function(req, res) {
	model_prioridad.find(function(r,err){
		if (req.session.user) {
			res.render('solicitud/nueva',{prioridad:r.rows});
		}else{
 			res.redirect("/");
		}
	})
  	
});

module.exports = router;
