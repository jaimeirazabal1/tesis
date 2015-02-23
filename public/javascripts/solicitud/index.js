$(document).ready(function(){
	var socket = io('http://172.16.60.50:3000');
	socket.on('cambiar_status_solicitud',function(obj){
		var id_ = obj.id.id
		este = $("#"+id_);
		valor = este.val();
		if (valor == "Desactivar") {
			este.removeClass("btn-success")
			este.addClass("btn-danger")
			este.val("Activar")
			//socket.emit('cambiar_status_solicitud',{id:id});
		}else{
			este.addClass("btn-success")
			este.removeClass("btn-danger")
			este.val("Desactivar")
			//socket.emit('cambiar_status_solicitud',{id:id});
		}
	});


	$(document).on("click",".solicitud_activacion",function(){
		$(document).off("click",".solicitud_activacion",function(){})
		var id = $(this).attr("id")
		var este = $(this);
		console.log(id)
		$.ajax({
			url:"/solicitud/cambiarstatus/"+id,
			success:function(r){
				if (r.error) {
					alert("Ocurrio un error")
				}else{
					valor = este.val();
					if (valor == "Desactivar") {
						este.removeClass("btn-success")
						este.addClass("btn-danger")
						este.val("Activar")
						socket.emit('cambiar_status_solicitud',{id:id});
					}else{
						este.addClass("btn-success")
						este.removeClass("btn-danger")
						este.val("Desactivar")
						socket.emit('cambiar_status_solicitud',{id:id});
					}
				}
			}
		})
		return false;
	})
})