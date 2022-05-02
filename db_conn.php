<?php
	$user= "root";
	$pass = "";
	$host= "localhost";
	$db_nombre = "velez";
	$connection = @mysqli_connect($host, $user, $pass, $db_nombre);
	if (!$connection) {
		echo "No se ha podido conectar a la base de datos";
	}	
?>