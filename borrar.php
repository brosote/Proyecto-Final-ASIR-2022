<?php
	session_start();
	include "db_conn.php";
	$idAlumno = $_GET['idAlumno'];
	
	$sql = "DELETE FROM alumno WHERE idAlumno = '$idAlumno'";
	$borrado = mysqli_query($connection,$sql);
	
	header("location:gestionmatriculas.php");
?>