<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.model.ServicioLocal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%! ServicioLocal servicio; %>  
 <%
 	InitialContext ctx = new InitialContext(); 
   	servicio = (ServicioLocal) ctx.lookup("java:global/ProyectoFinal/ProyectoFinal_EJB/Servicio!cl.model.ServicioLocal");
  %>
    

<!DOCTYPE html>
  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    
    <body class="blue">
    
    <div class="row">
		<div class="col s6 offset-s3">
			<div class="card-panel z-depth-5">

		<p class="center-align">Registro Producto</p>
		<form action="control.do" method="post">

				<div class="input-field">
					<i class="material-icons prefix">account_circle</i> <input
						id="nombre" type="text" name="nombre"> <label
						for="nombre">Nombre</label>
				</div>
				<div class="input-field">
					<i class="material-icons prefix">group</i> <input
						id="precio" type="text" name="precio"> <label
						for="precio">Precio</label>
				</div>
				
				<div class="input-field">
					<i class="material-icons prefix">arrow_forward</i> <input
						id="stock" type="text" name="stock"> <label
						for="stock">Stock</label>
				</div>
				

				<button name="boton" value="guardar" type="submit" class="btn right">
				Guardar
				</button>
				<br><br>
		</form>


				<table class="bordered highlight">
					<tr>
						<th>Codigo</th>
						<th>Nombre</th>
						<th>Precio</th>
						<th>Stock</th>
						<th>Estado</th>
						<th></th>
						<th></th>
						
					</tr>
					<c:forEach items="${servicio.productos}" var="p">
						<tr>
							<td>${p.codigo}</td>
							<td>${p.nombre}</td>
							<td>${p.precio}</td>
							<td>${p.stock}</td>
							<td>${p.estado}</td>
							<td>
								<a href="" class="btn-floating blue">
									<i class="material-icons">mode_edit</i>
								</a>
							</td>
							<td>
								<a href="" class="btn-floating red">
									<i class="material-icons">delete</i>
								</a>
							</td>
						</tr>
					
					</c:forEach>
				</table>
			</div>
		</div>    
    </div>
    

    
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
  </html>