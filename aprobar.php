<?php
	session_start();
	include "db_conn.php";
	$dni = $_GET['dni'];
	
	$sql = "UPDATE matriculas SET estado_mat = 'matriculado' WHERE dni = '$dni'";
	$aprobar = mysqli_query($connection,$sql);
	
	header("location:gestionmatriculas.php");
?>