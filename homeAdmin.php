<?php 
	session_start();
	if (isset($_SESSION['id']) && isset($_SESSION['usuario'])) {
?>
<!doctype html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<title>IES Luís Vélez de Guevara</title>

		<link rel="stylesheet" type="text/css" href="css/stylemat.css">
		<link rel="stylesheet" type="text/css" href="css/styleind.css">
		<link rel="stylesheet" type="text/css" href="css/fondo.css">
		
		<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>

		<script>
				$(document).ready(function(){
				$("#menu").load("menuAdmin.html");
				$("#pie").load("pie.html");
				});	
			
				$(function(){
				$("#slider div:gt(0)").hide();
				setInterval(function(){
				$("#slider div:first-child").fadeOut(1000)
				.next("div").fadeIn(900)
				.end().appendTo("#slider");
				},2000);
				})
				
				$(document).ready(function(){
				$('#b1').click(function(){
				$('.sombra').fadeIn(1000);	
				})

				$('#b2').click(function(){
				$('.sombra').fadeOut(1000);	
				})

				})
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
		<?php
			echo "<center>";
				echo "<h3><p>Bienvenido, ";
					echo $_SESSION['usuario'];
			echo "</h3></p></center>";
		?>
		<header id="menu"></header>
		<div class="container" >
			<div id ="slider">
				<div><img src="img/foto1.jpg" height="400px" width="600px"></div>
				<div><img src="img/foto2.jpg" height="400px" width="600px"></div>
				<div><img src="img/uno.jpg" height="400px" width="600px"></div>
				<div><img src="img/foto3.jpg" height="400px" width="600px"></div>
			</div>
		</div>
		<footer id="pie"></footer>
	</body>
	<?php 
		}else{
				header("Location: iniciosesion.php?error=Debe iniciar sesión");
		}
	?>
</html>