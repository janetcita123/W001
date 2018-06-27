<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="Master.jsp" /> 
 
 <script type="text/javascript" src="../app/resources/bootstrap/js/jquery2.min.js"></script>
 <script type="text/javascript" src="../app/resources/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="../app/resources/bootstrap/js/bootstrap-select.js"></script>
 <script type="text/javascript" src="../app/resources/bootstrap/js/bootstrap-select.js"></script>
 <script type="text/javascript" src="../app/resources/bootstrap/js/bootstrap-select.min.js"></script>
 <link rel="stylesheet" href="resources/bootstrap/css/bootstrap-select.css">
  <link rel="stylesheet" href="resources/bootstrap/css/bootstrap-select.css.map">
   <link rel="stylesheet" href="resources/bootstrap/css/bootstrap-select.min.css">
   <script type="text/javascript" src="../app/resources/funciones.js"></script>
<title>Atenciones</title>
<style type="text/css">
.tablaOdo{
border: 2px solid black;
text-align: center;
border-collapse: collapse;
}
.tablaOdo td{
padding-left: 8px;
padding-right: 8px;
border: 1px solid black;

}
</style>
</head>
<body>


<c:if test="${sessionScope.usuario != null }">


<div class="container" style="padding: 50px;"> 
    <form class="form-horizontal" role="form" id="form1">
    <div class="form-group">      
        <div class="col-sm-2">
          <input type="text" class="form-control formcls" name="dni" id="dni" placeholder="DNI">
        </div>
        <div class="col-sm-1">
          <button type="button" id="buscar_afi" class="btn btn-primary btn-warning" value="buscar_afi">Buscar</button>
        </div>
        <div class="col-sm-1" style="padding-top:15px;">
        <span class="label label-danger" id="codAfilia"></span>
        </div>
       <div class="col-sm-offset-5 col-sm-3">   
		<button id="atencion" class="btn btn-lg btn-block btn-warning" disabled="disabled"  name="atencion">Guardar Atención</button>
		</div>
		
		
      </div>
     
     <script type="text/javascript">
     
     var allDiag = [{'DIA':'K020','VALOR':0},{'DIA':'K021','VALOR':0},{'DIA':'K040','VALOR':0},{'DIA':'K041','VALOR':0},
    		{'DIA':'K050','VALOR':0},{'DIA':'Z012','VALOR':0}];
    		
    	 	
    		
    var procedimientos = 
    			[{'DIA':'K020','PRO': 
    				[{'COD':'232101','PROC':'OBTURACION DENTAL POR SUPERFICIE CON AMALGAMA','VALOR':0},
    				 {'COD':'232102','PROC':'OBTURACION DENTAL POR SUPERFICIE CON RESINA DE FOTOCURADO','VALOR':0},
    				 {'COD':'232103','PROC':'OBTURACION DENTAL POR SUPERFICIE CON IONOMERO DE VIDRIO','VALOR':0},
    				 {'COD':'232200','PROC':'OBTURACION TEMPORAL POR DIENTE','VALOR':0}
    				],
    			},
    			{'DIA':'K021','PRO': 
    				[{'COD':'232101','PROC':'OBTURACION DENTAL POR SUPERFICIE CON AMALGAMA','VALOR':0},
    				 {'COD':'232102','PROC':'OBTURACION DENTAL POR SUPERFICIE CON RESINA DE FOTOCURADO','VALOR':0},
    				 {'COD':'232103','PROC':'OBTURACION DENTAL POR SUPERFICIE CON IONOMERO DE VIDRIO','VALOR':0},
    				 {'COD':'232200','PROC':'OBTURACION TEMPORAL POR DIENTE','VALOR':0},
    				 {'COD':'237102','PROC':'PULPOTOMIA CON PULPECTOMIA','VALOR':0}
    				] 
    			},
    			{'DIA':'K040','PRO': 
    				[{'COD':'237102','PROC':'PULPOTOMIA CON PULPECTOMIA','VALOR':0}
    				] 
    			},
    			{'DIA':'K041','PRO': 
    				[{'COD':'237102','PROC':'PULPOTOMIA CON PULPECTOMIA','VALOR':0}
    				] 
    			},
    			{'DIA':'K050','PRO': 
    				[{'COD':'240200','PROC':'DETARTRAJE SUBGINGIVAL (POR CUADRANTE)','VALOR':0},
    				 {'COD':'997301','PROC':'DETARTRAJE SUPRAGINGIVAL','VALOR':0},
    				 {'COD':'997500','PROC':'PROFILAXIS DENTAL','VALOR':0} 
    				] 
    			},		 
    			{'DIA':'Z012','PRO': 
    				[{'COD':'997102','PROC':'APLICACION DE SELLANTES DE FOTOCURADO','VALOR':0},
    				 {'COD':'997103','PROC':'TOPICACION DE FLUOR EN GEL','VALOR':0},
    				 {'COD':'997104','PROC':'TOPICACION DE FLUOR EN SOLUCION','VALOR':0},
    				 {'COD':'997301','PROC':'DETARTRAJE SUPRAGINGIVAL','VALOR':0},
    				 {'COD':'997500','PROC':'PROFILAXIS DENTAL','VALOR':0} 
    				] 
    			}
    			 
    			 
    			 ];

    		var variables =[{'ID':'M11','IDEN': 'O' ,'VALOR':0},
    			 {'ID':'M11','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M11','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M11','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M11','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M12','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M12','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M12','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M12','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M12','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M13','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M13','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M13','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M13','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M13','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M14','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M14','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M14','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M14','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M14','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M15','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M15','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M15','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M15','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M15','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M16','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M16','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M16','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M16','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M16','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M17','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M17','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M17','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M17','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M17','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M18','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M18','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M18','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M18','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M18','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M21','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M21','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M21','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M21','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M21','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M22','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M22','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M22','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M22','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M22','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M23','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M23','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M23','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M23','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M23','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M24','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M24','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M24','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M24','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M24','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M25','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M25','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M25','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M25','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M25','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M26','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M26','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M26','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M26','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M26','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M27','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M27','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M27','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M27','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M27','IDEN': 'P4' ,'VALOR':0},	
    			{'ID':'M28','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M28','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M28','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M28','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M28','IDEN': 'P4' ,'VALOR':0},	
    			{'ID':'M31','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M31','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M31','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M31','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M31','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M32','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M32','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M32','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M32','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M32','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M33','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M33','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M33','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M33','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M33','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M34','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M34','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M34','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M34','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M34','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M35','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M35','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M35','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M35','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M35','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M36','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M36','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M36','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M36','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M36','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M37','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M37','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M37','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M37','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M37','IDEN': 'P4' ,'VALOR':0},	
    			{'ID':'M38','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M38','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M38','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M38','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M38','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M41','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M41','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M41','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M41','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M41','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M42','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M42','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M42','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M42','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M42','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M43','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M43','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M43','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M43','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M43','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M44','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M44','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M44','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M44','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M44','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M45','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M45','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M45','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M45','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M45','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M46','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M46','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M46','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M46','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M46','IDEN': 'P4' ,'VALOR':0},
    			{'ID':'M47','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M47','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M47','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M47','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M47','IDEN': 'P4' ,'VALOR':0},	
    			{'ID':'M48','IDEN': 'O' ,'VALOR':0},
    			{'ID':'M48','IDEN': 'P1' ,'VALOR':0}, 
    			{'ID':'M48','IDEN': 'P2' ,'VALOR':0}, 
    			{'ID':'M48','IDEN': 'P3' ,'VALOR':0}, 
    			{'ID':'M48','IDEN': 'P4' ,'VALOR':0}
    			
    			];

     $("#buscar_afi").click(function(){
    		
    		var data = $("#form1").serialize();
    		$("#codAfilia")[0].innerHTML="";
    		$("#nombres")[0].value="";
    		$("#apaterno")[0].value="";
    		$("#amaterno")[0].value="";
    		$("#edad")[0].value="";
    		$("#fechaNac")[0].value="";
    		$("#telefono")[0].value="";
    		$("#dni")[0].value="";
    		$("#estado option[value="+ 1 +"]").attr("selected",true);
			$("#sexo option[value="+ "M" +"]").attr("selected",true);
    		
    		$.get("traerAfiliado", data, function(response){	
    			var arreglo = $.parseJSON(response); 
    			if(arreglo.length == 0){
    				$("#codAfilia")[0].innerHTML="Paciente no afiliado"
    				$('#diagnostico').find('option').remove().end().append('');
					$('#diagnostico').selectpicker('refresh');
					$('#procedimientos').find('option').remove().end().append('');
					$('#procedimientos').selectpicker('refresh');
					  $('#atencion').attr("disabled", true);
					  $("#odontograma").css("visibility", "hidden");
    			}else{ 
    				var codigo ="00000"+ arreglo[0].IDE;
    				$("#codAfilia")[0].innerHTML="COD: "+codigo.substr(codigo.length-5,codigo.length);    		
    				$("#nombres")[0].value= arreglo[0].NOMBRES;
    				$("#apaterno")[0].value= arreglo[0].APEPATERNO;
    				$("#amaterno")[0].value= arreglo[0].APEMATERNO; 
    				$("#estado option[value="+ arreglo[0].ESTADO +"]").attr("selected",true);
    				if (arreglo[0].ESTADO==1){    		
    					$("#estado option[value="+ 0 +"]").attr("selected",false);
    					$("#odontograma").css("visibility", "visible");
    					$('#atencion').attr("disabled", false);    					
    				}else{
    					$("#estado option[value="+ 1 +"]").attr("selected",false);
    					  $('#atencion').attr("disabled", true);
    					  $("#odontograma").css("visibility", "hidden");
    					  $('#diagnostico').find('option').remove().end().append('');
      					  $('#diagnostico').selectpicker('refresh');
      					  $('#procedimientos').find('option').remove().end().append('');
    					  $('#procedimientos').selectpicker('refresh');
    				}
    				
    				if (arreglo[0].SEXO=="M") {
    					
    					$("#sexo option[value="+ "F" +"]").attr("selected",false);
    				}else{
    					$("#sexo option[value="+  "M" +"]").attr("selected",false);
    				}
    				$("#sexo option[value="+  arreglo[0].SEXO +"]").attr("selected",true);
    				
    				$("#edad")[0].value=calcularEdad(arreglo[0].FECNAC);
    				var d = new Date(arreglo[0].FECNAC);
    				$("#fechaNac")[0].value=formatoFecha(d);
    				$("#telefono")[0].value=arreglo[0].TELEFONO;
    				$("#dni")[0].value=arreglo[0].DNI;
    			} 
    			 
    		});
    		limpiar_diagnosticos();
    	});
     
     $("#atencion").click(function(){
    	 var dataDia=[], dataProcedimiento = [];
    	 $("#dDia div button").each(function(){
    		 var texto = $(this).text();
    		 //falta esto para enviar a la base de datos    		
    		  if (texto.indexOf(",") != -1){
    			  var ss = texto.split(",");
    			  for (var i in ss) { 
    			      dataDia.push(ss[i].trim().substring(0,4));
				  }
    		  }  else {
    			  dataDia.push(texto.trim().substring(0,4));
    		  }	 
     	 });
    	 
    	 $("#pPro div button").each(function(){
    		 var texto2 = $(this).text();
    		 if (texto2.indexOf(",") != -1){
   			  var ss = texto2.split(",");
   			  for (var i in ss) { 
   				dataProcedimiento.push(ss[i].trim().substring(0,6));
				  }
   		  }  else {
   			dataProcedimiento.push(texto2.trim().substring(0,6));
   		  }	 
    	 });
    	 dataProcedimiento = removeDuplicates(dataProcedimiento);
    	 
    	 var data =[];
    	 data.push("value", dataDia);
    	 data.push("value" , dataProcedimiento);
    	 
    	 $.ajax({
             type: 'POST',
             url: '/guardaAtencion',
             data:  data,
             success: function (data) {
                 console.log('Submission was successful.');
                 console.log(data);
             },
             error: function (data) {
                 console.log('An error occurred.');
                 console.log(data);
             },
             beforeSend: function (data) {
                 console.log('Before sending data ... ');
                 console.log(data);
             }
         });



    	 
    	 
    	 $.get("guardaAtencion", data.toString(), function(response){	
 			var arreglo = $.parseJSON(response); 
 			
    	 });
    
    	 
     });
     
     function removeDuplicates(originalArray) {
         var newArray = [];
         var lookupObject  = {};

         for(var i in originalArray) {
            lookupObject[originalArray[i]] = originalArray[i];
         }

         for(i in lookupObject) {
             newArray.push(lookupObject[i]);
         }
          return newArray;
     }
     
     	function calcularEdad(fecha) {
    	    var hoy = new Date();
    	    var cumpleanos = new Date(fecha);
    	    var edad = hoy.getFullYear() - cumpleanos.getFullYear();
    	    var m = hoy.getMonth() - cumpleanos.getMonth();

    	    if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
    	        edad--;
    	    } 
    	    return edad;
    	}
     	
     	function formatoFecha(d) {     		   		
     		  var month = String(d.getMonth() + 1);
     		  var day = String(d.getDate());
     		  var year = String(d.getFullYear());
		
     		  if (month.length < 2) month = '0' + month;
     		  if (day.length < 2) day = '0' + day;
		 
     		  return day+"/"+month+"/"+year;
     		}
	
     	
     	function limpiar_diagnosticos(){
     		
     		for (var z = 0; z < allDiag.length; z++) {
     			allDiag[z].VALOR=0;     			
     		}
     		
     		 $('#diagnostico').find('option').remove().end().append('');    	 
		     $("#diagnostico").append('<option value="K020">K020-CARIES DEL ESMALTE</option>');
			 $("#diagnostico").append('<option value="K021">K021-CARIES DENTINA</option>'); 
			 $("#diagnostico").append('<option value="K040">K040-PULPITIS</option>'); 
			 $("#diagnostico").append('<option value="K041">K041-NECROSIS PULPAR</option>'); 
			 $("#diagnostico").append('<option value="K050">K050-GINGIVITIS AGUDA</option>'); 
			 $("#diagnostico").append('<option value="Z012">Z012-SANO</option>'); 
     		 $('#diagnostico').selectpicker('refresh');
     		
     	}
     	
     	 function diagnosticos(dia){ 	
     		 
     	 if (dia.length==6){  
     			for (var z = 0; z < allDiag.length; z++) {
     				if(allDiag[z].VALOR=1){
     					for (var i = 0; i < procedimientos.length; i++) { 
     						if(procedimientos[i].DIA==allDiag[z].DIA){  	 
         	     			  for (var j = 0; j <procedimientos[i].PRO.length; j++) {
         	     				if(procedimientos[i].PRO[j].COD==dia){
         	     					procedimientos[i].PRO[j].VALOR=1;
         	     					 
         	     				}
         	     			  }         	     				
     						}     	     				
     	       		   	  }     					
     					}
     				if(allDiag[z].VALOR=0){     					
     					for (var i = 0; i < procedimientos.length; i++) { 
     						if(procedimientos[i].DIA==allDiag[z].DIA){  	 
         	     			  for (var j = 0; j <procedimientos[i].PRO.length; j++) {
         	     				if(procedimientos[i].PRO[j].COD==dia){
         	     					procedimientos[i].PRO[j].VALOR=0;
         	     					 
         	     				}
         	     			  }         	     				
     						}     	     				
     	       		   	  }  
     				}
     				}
     			
     			 		
     		 }else{
  		   
  		   $('#procedimientos').find('option').remove().end().append('');
  		   $('#procedimientos').selectpicker('refresh');
  		   
  			  for (var i = 0; i < allDiag.length; i++) {
  				  if (allDiag[i].DIA == dia){ 
  						if (allDiag[i].VALOR==1) {
  							allDiag[i].VALOR=0;
  						break;
  						} else{		
  							allDiag[i].VALOR=1;
  						break;
  						}
  						
  					}
  			   }
  			  
  	
  			  for (var f = 0; f < allDiag.length; f++) {
  				  
  				  if (allDiag[f].VALOR == 1){ 
  					 //alert(allDiag[f].DIA);
  					  for (var i = 0; i < procedimientos.length; i++) {						 
  						  if (procedimientos[i].DIA == allDiag[f].DIA){ 
  							  
  							  var varProc = procedimientos[i].PRO;							 
  							  for (var j = 0; j < varProc.length; j++) {
  								  var cuenta = 0;
  								  $("#procedimientos option").each(function(){
  								        if ($(this).val() == varProc[j].COD ){        
  								         cuenta=cuenta+1;
  								        }
  								     });
  								 
  								 if (cuenta==0){ 
  									 $("#procedimientos").append('<option value='+varProc[j].COD+'>'+varProc[j].COD+'-'+varProc[j].PROC+'</option>');
  									 $('#procedimientos').selectpicker('refresh');
  								 }
  								  					 
  							  }				  
  							  
  						  }
  						  
  					  }  					  
  				  }  				  
  			    } 
     		 }
  		  }	   
  	 
  	   
  	   
  	   function marca(val, muelita){

  		   var valorFinal="";
  		    
  		   	for (var i = 0; i < variables.length; i++) {

  		   	if (variables[i].ID == muelita){	
  		   		if (variables[i].IDEN == val){ 
  		   			if (variables[i].VALOR==1) {
  		   			variables[i].VALOR=0;
  		   			break;
  		   			} else{		
  		   			variables[i].VALOR=1;
  		   			break;
  		   			}
  		   			
  		   		}
  		   	
  		   	} 
  		   	
  		   	}
  		   valorFinal="";
  		   	for (var i = 0; i < variables.length; i++) {
  		   	if (variables[i].ID == muelita){	 
  		   		if (variables[i].VALOR == 1){
  		   			valorFinal=valorFinal+variables[i].IDEN;
  		   			}
  		   		}
  		   	}

  		   	if (valorFinal==""){
  		   	valorFinal="blanco"
  		   	};
  		   var rutaImg = "../app/resources/imagenes/muestra_"+valorFinal+".svg";
  		    
  		   //alert(variables[0].IDEN);
  		   document.getElementById(muelita).src=rutaImg;
  		   }
  		    
  	   
     	
     </script>
     
      <div class="form-group">
        <div class="col-sm-3">
          <label for="nombres" class="col-sm-5-new control-label">Nombres:</label>
          <input type="text" disabled="disabled"  class="form-control formcls" id="nombres" name ="nombres"  placeholder="--">
        </div>
         <div class="col-sm-3">
          <label for="apellidos" class=".col-sm-4-new control-label">Ape. Paterno:</label>
          <input type="text" disabled="disabled"  class="form-control formcls" id="apaterno" name ="apaterno"  placeholder="--">
        </div>
         <div class="col-sm-3">
          <label for="apellidos" class=".col-sm-4-new control-label">Ape. Materno:</label>
          <input type="text" disabled="disabled"  class="form-control formcls" id="amaterno" name ="amaterno" placeholder="--">
        </div>
        
        <div class="col-sm-3">
          <label for="estado"  class=".col-sm-4-new control-label">Estado:</label>
         <select class="form-control formcls" id="estado" name="estado" disabled="disabled" >
          <option value="1">Activo</option>
          <option value="0">Inactivo</option>
        </select>   
        </div>
      </div>
      
        <div class="form-group">
        <div class="col-sm-3">
          <label for="sexo" class="col-sm-1-new control-label">Sexo:</label>
          <select class="form-control formcls" id="sexo" name="sexo" disabled="disabled" >
          <option value="M">Masculino</option>
          <option value="F">Femenino</option>
        </select>   
        </div>
         
         <div class="col-sm-3">
          <label for="edad" class=".col-sm-4-new control-label">Edad:</label>
          <input type="text" disabled="disabled"  class="form-control formcls" id="edad" name="edad" placeholder="">
        </div> 
          <div class="col-sm-3">
          <label for="fechaNac"   class=".col-sm-4-new control-label">Fecha Nacimiento:</label>
          <input type="text" disabled="disabled" class="form-control formcls" id="fechaNac" name="fechaNac" placeholder="">
        </div>
         <div class="col-sm-3" >
          <label for="telefono"   class=".col-sm-5-new control-label">Telefono:</label>
          <input type="text" disabled="disabled" class="form-control formcls" id="telefono" name="telefono" placeholder="">
        </div>
      </div>
       
       <div class="form-group">
        <div class="col-sm-6" id="dDia">
          <label for="diagnostico" class="col-sm-5-new control-label">DIAGNÓSTICOS</label> <br>           
          <select class="selectpicker"  id="diagnostico"  multiple data-actions-box="false" style="width: 600px;">
	
		  </select>   
		  
		  
        </div>
         <div class="col-sm-6 "  id="pPro">
          <label for="PROCEDIMIENTOS" class="col-sm-5-new control-label">PROCEDIMIENTOS</label> <br>           
          <select id="procedimientos" class="selectpicker" multiple data-actions-box="false" style="width: 600px;">
			  
		  </select>   
		  
		  
        </div>
       </div>
       
        <div class="form-group" id="odontograma" style="visibility: hidden;">
        
        <div class="col-sm-12 alert alert-block alert-info"  style="text-align: center;" >      
        <h2>ODONTOGRAMA</h2>   
        <table  class="tablaOdo" >
        	<tr>
        		<td>18</td><td>17</td><td>16</td><td>15</td><td>14</td><td>13</td><td>12</td><td  style="border-right: 3px solid red;">11</td>        		
        		<td>21</td>
        		<td>22</td><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td><td>28</td>
        	</tr>        
        	<tr>
        		<td>
        		<div class="capa" " >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M18" width="50" height="40" alt="Odonto"
					usemap="#M18"> 
					<map name="M18">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M18');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M18');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M18');" title="Mesial"  /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M18');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M18');" title="Distal"/> 					
					</map>	
				</div>	
        		</td>
        		<td>
        		<div class="capa"  >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M17" width="50" height="40" alt="Odonto"
					usemap="#M17"> 
					<map name="M17">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M17');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M17');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M17');" title="Mesial"  /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M17');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M17');" title="Distal"/> 					
					</map>	
				</div>			
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M16" width="50" height="40" alt="Odonto"
					usemap="#M16"> 
					<map name="M16">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M16');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M16');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M16');" title="Mesial"  /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M16');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M16');" title="Distal"/> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa"  >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M15" width="50" height="40" alt="Odonto"
					usemap="#M15"> 
					<map name="M15">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M15');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M15');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M15');" title="Mesial"  /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M15');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M15');" title="Distal"/> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa"  >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M14" width="50" height="40" alt="Odonto"
					usemap="#M14"> 
					<map name="M14">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M14');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M14');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M14');" title="Mesial"  /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M14');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M14');" title="Distal"/> 					
					</map>	
				</div>			
        		</td>
        		<td>
        		<div class="capa"  >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M13" width="50" height="40" alt="Odonto"
					usemap="#M13"> 
					<map name="M13">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M13');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M13');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M13');" title="Mesial"  /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M13');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M13');" title="Distal"/> 					
					</map>	
				</div>
        		</td>
        		<td>
        		<div class="capa"  >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M12" width="50" height="40" alt="Odonto"
					usemap="#M12"> 
					<map name="M12">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M12');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M12');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M12');" title="Mesial"  /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M12');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M12');" title="Distal"/> 					
					</map>	
				</div>			
        		</td>
        		<td  style="border-right: 3px solid red;"><div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M11" width="50" height="40" alt="Odonto"
					usemap="#M11">
					
					<map name="M11">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M11');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M11');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M11');" title="Mesial"  /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M11');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M11');" title="Distal"/> 
					</map>
				</div>
				</td>
        		<td>
				<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M21" width="50" height="40" alt="Odonto"
					usemap="#M21">
					
					<map name="M21">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M21');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M21');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M21');" title="Distal" /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M21');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M21');" title="Mesial"/> 
					</map>
				</div>
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M22" width="50" height="40" alt="Odonto"
					usemap="#M22"> 
					<map name="M22">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M22');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M22');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M22');" title="Distal" /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M22');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M22');" title="Mesial"/> 					
					</map>	
				</div>			
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M23" width="50" height="40" alt="Odonto"
					usemap="#M23"> 
					<map name="M23">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M23');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M23');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M23');" title="Distal" /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M23');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M23');" title="Mesial"/> 					
					</map>	
				</div>			
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M24" width="50" height="40" alt="Odonto"
					usemap="#M24"> 
					<map name="M24">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M24');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M24');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M24');" title="Distal" /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M24');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M24');" title="Mesial"/> 					
					</map>	
				</div>			
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M25" width="50" height="40" alt="Odonto"
					usemap="#M25"> 
					<map name="M25">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M25');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M25');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M25');" title="Distal" /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M25');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M25');" title="Mesial"/> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M26" width="50" height="40" alt="Odonto"
					usemap="#M26"> 
					<map name="M26">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M26');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M26');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M26');" title="Distal" /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M26');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M26');" title="Mesial"/> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M27" width="50" height="40" alt="Odonto"
					usemap="#M27"> 
					<map name="M27">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M27');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M27');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M27');" title="Distal" /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M27');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M27');" title="Mesial"/> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M28" width="50" height="40" alt="Odonto"
					usemap="#M28"> 
					<map name="M28">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M28');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M28');" title="Vestibular" /> 
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M28');" title="Distal" /> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M28');" title="Palatino" />  
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M28');" title="Mesial"/> 					
					</map>	
				</div>		
        		</td>
        	</tr> 
        	<tr >
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M48" width="50" height="40" alt="Odonto"
					usemap="#M48"> 
					<map name="M48">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M48');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M48');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M48');" title="Mesial"/> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M48');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M48');" title="Distal" /> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M47" width="50" height="40" alt="Odonto"
					usemap="#M47"> 
					<map name="M47">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M47');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M47');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M47');" title="Mesial"/> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M47');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M47');" title="Distal" /> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M46" width="50" height="40" alt="Odonto"
					usemap="#M46"> 
					<map name="M46">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M46');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M46');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M46');" title="Mesial"/> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M46');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M46');" title="Distal" /> 					
					</map>	
				</div>	
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M45" width="50" height="40" alt="Odonto"
					usemap="#M45"> 
					<map name="M45">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M45');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M45');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M45');" title="Mesial"/> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M45');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M45');" title="Distal" /> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M44" width="50" height="40" alt="Odonto"
					usemap="#M44"> 
					<map name="M44">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M44');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M44');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M44');" title="Mesial"/> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M44');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M44');" title="Distal" /> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M43" width="50" height="40" alt="Odonto"
					usemap="#M43"> 
					<map name="M43">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M43');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M43');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M43');" title="Mesial"/> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M43');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M43');" title="Distal" /> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M42" width="50" height="40" alt="Odonto"
					usemap="#M42"> 
					<map name="M42">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M42');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M42');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M42');" title="Mesial"/> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M42');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M42');" title="Distal" /> 					
					</map>	
				</div>		
        		</td>
        		<td  style="border-right: 3px solid red;">
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M41" width="50" height="40" alt="Odonto"
					usemap="#M41"> 
					<map name="M41">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M41');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M41');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M41');" title="Mesial"/> 
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M41');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M41');" title="Distal" /> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M31" width="50" height="40" alt="Odonto"
					usemap="#M31"> 
					<map name="M31">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M31');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M31');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M31');" title="Distal" />  
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M31');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M31');" title="Mesial"/> 					
					</map>	
				</div>			
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M32" width="50" height="40" alt="Odonto"
					usemap="#M32"> 
					<map name="M32">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M32');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M32');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M32');" title="Distal" />  
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M32');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M32');" title="Mesial"/> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M33" width="50" height="40" alt="Odonto"
					usemap="#M33"> 
					<map name="M33">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M33');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M33');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M33');" title="Distal" />  
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M33');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M33');" title="Mesial"/> 					
					</map>	
				</div>	
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M34" width="50" height="40" alt="Odonto"
					usemap="#M34"> 
					<map name="M34">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M34');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M34');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M34');" title="Distal" />  
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M34');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M34');" title="Mesial"/> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M35" width="50" height="40" alt="Odonto"
					usemap="#M35"> 
					<map name="M35">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M35');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M35');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M35');" title="Distal" />  
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M35');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M35');" title="Mesial"/> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M36" width="50" height="40" alt="Odonto"
					usemap="#M36"> 
					<map name="M36">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M36');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M36');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M36');" title="Distal" />  
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M36');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M36');" title="Mesial"/> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M37" width="50" height="40" alt="Odonto"
					usemap="#M37"> 
					<map name="M37">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M37');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M37');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M37');" title="Distal" />  
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M37');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M37');" title="Mesial"/> 					
					</map>	
				</div>		
        		</td>
        		<td>
        		<div class="capa" >
					<img src="../app/resources/imagenes/muestra_blanco.svg" id="M38" width="50" height="40" alt="Odonto"
					usemap="#M38"> 
					<map name="M38">
					<area shape="circle" coords="25,20,8" onclick="marca('O','M38');" title="Oclusal"  />
					<area shape="Square" coords="16,3,34,11" onclick="marca('P1','M38');" title="Lingual"  />
					<area shape="Square"   coords="37,13,48,27" onclick="marca('P2','M38');" title="Distal" />  
					<area shape="Square" coords="16,28,34,37" onclick="marca('P3','M38');" title="Vestibular"  />
					<area shape="Square" coords="4,13,15,27" onclick="marca('P4','M38');" title="Mesial"/> 					
					</map>	
				</div>		
        		</td>
        	</tr> 
        	<tr>
        		<td>48</td><td>47</td><td>46</td><td>45</td><td>44</td><td>43</td><td>42</td><td  style="border-right: 3px solid red;" >41</td>
        		<td>31</td><td>32</td><td>33</td><td>34</td><td>35</td><td>36</td><td>37</td><td>38</td>
        	</tr> 
        </table>
        </div>
        </div>
       
  

    </form>
   </div>  
 </c:if>
</body>
</html>