<?php
	session_start();
	include "db_conn.php";
	$idAlumno = $_GET['idAlumno'];
	
	$sql = "UPDATE matricula SET estado = 'Aceptada' WHERE idAlumno = '$idAlumno'";
	$aprobar = mysqli_query($connection,$sql);
	
	header("location:gestionmatriculas.php");
?>