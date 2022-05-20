<!DOCTYPE html>
<html>
    <head>
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/styleind.css">
		<link rel="stylesheet" type="text/css" href="css/stylemat.css">
	</head>
    <body>
	
		<?php
			$user= "root";
			$pass = "";
			$host= "localhost";
			$db_nombre = "velez";
			$connection = @mysqli_connect($host, $user, $pass, $db_nombre);

			if (!$connection) {
				echo "Connection failed!";
			}else{
				$nombre = $_REQUEST['nombre'];
				$apellido1 = $_REQUEST['apellido1'];
				$apellido2 = $_REQUEST['apellido2'];
				$sexo = $_REQUEST['sexo'];
				$dni = $_REQUEST['dni'];
				$nacionalidad = $_REQUEST['nacionalidad'];
				$fecNacimiento = $_REQUEST['fecNacimiento'];
				$codigoPostal = $_REQUEST['codigoPostal'];
				$direccion = $_REQUEST['direccion'];
				$correo = $_REQUEST['correo'];
				$grado = $_REQUEST['grado'];
				$ciclo = $_REQUEST['ciclo'];
				$curso = $_REQUEST['curso'];

				$insercionAlumno = "INSERT INTO alumno (`idAlumno`, `nombre`, `apellido1`, `apellido2`, `fecNacimiento`, `sexo`, `correo`, `nacionalidad`, `cp`, `direccion`) VALUES ('$dni', '$nombre', '$apellido1', '$apellido2', '$fecNacimiento', '$sexo', '$correo', '$nacionalidad', '$codigoPostal', '$direccion')";
				$insercionMatricula = "INSERT INTO Matricula (`idAlumno`) VALUES ('$dni')";
				$registroAlumno = mysqli_query($connection,$insercionAlumno);
				$registroMatricula = mysqli_query($connection,$insercionMatricula);
			?>
			<div class="todofondo">
			<center>
			<?php
			if($registroAlumno && $registroMatricula){
				echo "Haga clic en el siguiente botón para volver atrás";
				echo "<p><a href=\"index.html\" class=\"botonazul2\">Usuario registrado con éxito</a></p>";
			}else{
				echo "Haga clic en el siguiente botón para volver atrás";
				echo "<p><button class=\"botonazul2\" onclick=\"history.back()\">No se ha podido registrar</button></p>";
			}
		}
		mysqli_close($connection); //Cerrar la conexión a la base de datos
	?>
	<br>
	<br>
	<br>
	</center>
</div>
	</body>
</html>
