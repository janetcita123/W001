<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sistema de Atenciones Odontologicas</title>
<style type="text/css">
.nomUsu {
font-family:Helvetica Neue",Helvetica,Arial,sans-serif;
font-size: 8px;
color: #FFFFFF;
line-height: 1.42857143;
text-align: -webkit-match-parent; 
padding-bottom: 15px; 

}
.labUsu {
font-weight: 300;
}
</style>
</head>
<body>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/bootstrap/css/NavBar.css">

  
</head>
<body> 
<header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner"> 

  <div class="container" style="width: auto;">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
        <span class="sr-only">Navegacion</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="./" class="navbar-brand" style="font-size:large;padding-left: 150px;">ATENCIONES ODONTOLOGICAS</a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse"  role="navigation">
      <ul class="nav navbar-nav" style="text-align:right;">
        <li class="active">
          <a href="getAtencion">Atencion</a>
        </li>
				 
        <li>
          <a href="getAfiliado">Afiliado</a>
        </li>
        <li>
          <a href="getConsulta">Consultas</a>
        </li>
        <li >
          <a href="getCuenta">Cuenta</a>
        </li> 
        <li style="padding-left:200px;">
         <a href="cerrarSesion">Salir</a>
        </li>
        <li>
          <div class="form-group nomUsu" style="width: 100%;text-align: center;">
      		<div class="col-sm-12">
        		<label class=".col-sm-3 control-label labUsu">${usuario.getNombres()} ${usuario.getApellidos()}</label>
      		</div> <br>        
      		<div class="col-sm-12">
      			<label  class=".col-sm-3 control-label labUsu">${usuario.getRol()}</label>
      		</div>
 		  </div>
        </li>
      </ul>
       
    </nav>
   
  </div>
  
 
</header>   
<br>

</body>
</html>