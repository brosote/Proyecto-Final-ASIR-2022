<!DOCTYPE html>
<html>
		<link rel="stylesheet" type="text/css" href="css/stylemat.css">
			if (!$connection) {
				$insercionAlumno = "INSERT INTO alumno (`idAlumno`, `nombre`, `apellido1`, `apellido2`, `fecNacimiento`, `sexo`, `correo`, `nacionalidad`, `cp`, `direccion`) VALUES ('$dni', '$nombre', '$apellido1', '$apellido2', '$fecNacimiento', '$sexo', '$correo', '$nacionalidad', '$codigoPostal', '$direccion')";
				$insercionMatricula = "INSERT INTO matricula (`idAlumno`) VALUES ('$dni')";
				$registroAlumno = mysqli_query($connection,$insercionAlumno);
				$registroMatricula = mysqli_query($connection,$insercionMatricula);
			<div class="todofondo">
			<center>
			<?php
	<br>
	<br>
	<br>
	</center>