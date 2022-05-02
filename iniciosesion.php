<?php
	include "db_conn.php";
?>
<!DOCTYPE HTML>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<title>Matrícula - IES Luís Vélez de Guevara</title>
		<link rel="stylesheet" type="text/css" href="css/styleind.css">
		<link rel="stylesheet" type="text/css" href="css/stylemat.css">
		<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
		<script>
			$(document).ready(function(){
				$("#menu").load("menu.html");
				$("#pie").load("pie.html");
			});
		</script>
	</head>
	<body>
		<div id="inicio">	
			<div class="titulo">
				<h1><em>I.E.S Luis Velez de Guevara</em></h1>
			</div>
			<div class="logo">
				<center><img src="img/watermark.svg" height="100px"></center>
			</div>
		</div>
		<header id="menu"></header>
		<br>
		<div class="todofondo">
			<h1>Iniciar sesión</h1>
			<div class="verificacion">
				<form name="f1" action="login.php" method="post">
					<center>
						<table>
					    	<th>DATO DEL USUARIO:</th>
								<tr>
									<td><b>Usuario:</b></td><td><input type="text" name="usuario" required /></td>
								</tr>
								<tr>
									<td><b>Contraseña:</b></td><td><input type="password" name="passwd" required /></td>
								</tr>
							<td><br><input type="submit" class="botonazul" value="Enviar"></td>
						</table>
					</center>
				</form>
			</div>
			
			<br><br><br><br><br><br><br>
			
		</div><br>
		<footer id="pie"></footer>
	</body>
</html>