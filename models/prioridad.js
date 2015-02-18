var client = require("../db")();
var prioridad = function(){
	var respuesta;
	var obj = {};
	obj.find = function(callback){
		client.query('SELECT * from "prioridad"',function(err,result){
			if (err) {
				console.log(err)
			};
			callback(result,err)
		});
	}
	return obj;
}
module.exports = prioridad;