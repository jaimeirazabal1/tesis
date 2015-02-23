$(document).ready(function(){
    $('#datetimepicker1').datetimepicker({
    	format : 'DD-MM-YYYY HH:mm'
    });
    $(document).on("submit","form",function(){
    	$(document).off("submit","form",function(){})
    	var data = $(this).serialize();
    	$.ajax({
    		type:"POST",
    		url:"/solicitud/nueva",
    		data:data,
    		success:function(r){
    			if (r.correcto) {
    				
    			}else{
    				alert("Ocurrio un error")
    				console.log(r.error);
    			}
    		}
    	});
    	return false;
    });
})
