<?php
	session_start();
	include "db_conn.php";
	$dni = $_GET['dni'];
	
	$sql = "DELETE FROM matriculas WHERE dni = '$dni'";
	$borrado = mysqli_query($connection,$sql);
	
	header("location:gestionmatriculas.php");
?>