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
			<h1>Comprobar estado de matriculación</h1>
			<div class="verificacion">
				<form name="f1" action="" method="post">
					<center>
						<table>
					    	<th>DATO DEL SOLICITANTE</th>
								<tr>
									<td>DNI / NIE / Pasaporte:</td><td><input type="text" name="dni" required /></td>
								</tr>
							<td><br><input type="submit" class="botonazul" value="Enviar"></td>
						</table>
					</center>
				</form>
			</div>
			
			<br><br><br><br><br><br><br>
			
		</div><br>
		
		<?php
			if(isset($_POST['dni'])){
				
				echo "<div class=\"verificacion\">";
				echo "<h2>DATOS DE LA MATRICULA</h2>";
				$dni = $_POST['dni'];
		
				$consulta = "SELECT * FROM matriculas WHERE dni = '$dni'";
				$consulta = mysqli_query($connection,$consulta);
				$row=mysqli_fetch_array($consulta);
				
				if($consulta){
					echo "<h2><p><b>Estado de la matriculación:</b> $row[19]</h2></p>";
					echo "<p><b>Nombre:</b> $row[1]</p>";
					echo "<p><b>Apellidos:</b> $row[2] $row[3]</p>";
					echo "<p><b>Sexo:</b> $row[4]</p>";
					echo "<p><b>DNI:</b> $row[5]</p>";
					echo "<p><b>Nacionalidad:</b> $row[6]</p>";
					echo "<p><b>Situación profesional:</b> $row[7]</p>";
					echo "<p><b>Fecha de Nacimiento:</b> $row[8]</p>";
					echo "<p><b>Localidad:</b> $row[9]</p>";
					echo "<p><b>Provincia:</b> $row[10]</p>";
					echo "<p><b>Código Postal:</b> $row[11]</p>";
					echo "<p><b>Domicilio:</b> $row[12]</p>";
					echo "<p><b>Correo electrónico:</b> $row[13]</p>";
					echo "<p><b>Ciclo:</b> $row[14]</p>";
					echo "<p><b>Curso:</b> $row[15]</p>";
					echo "<p><b>Año:</b> $row[16]</p>";
					echo "<p><b>Fecha realización matrícula:</b> $row[17]</p>";
					echo "<p><b>Jornada:</b> $row[18]</p>";
					
				}else{
					echo "Algo ha fallado, vuelva a realizar la consulta";
					echo "<p><button class=\"botonazul2\" onclick=\"history.back()\">No se han encontrado datos</button></p>";
				}
				mysqli_close($connection); //Cerrar la conexión a la base de datos
			}
		?>
		</div>
		<footer id="pie"></footer>
	</body>
</html>