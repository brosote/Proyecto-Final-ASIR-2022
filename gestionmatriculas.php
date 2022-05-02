<?php 
	session_start();
	if (isset($_SESSION['id']) && isset($_SESSION['usuario'])) {
		include "db_conn.php";
?>
<!doctype html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<title>IES Luís Vélez de Guevara</title>

		<link rel="stylesheet" type="text/css" href="css/stylemat.css">
		<link rel="stylesheet" type="text/css" href="css/styleind.css">
		<link rel="stylesheet" type="text/css" href="css/fondo.css">
		<link rel="stylesheet" type="text/css" href="css/tablas.css">
		
		<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>

		<script>
				$(document).ready(function(){
				$("#menu").load("menuAdmin.html");//cargando el menu en el header
				$("#pie").load("pie.html");//cargando el pie en el footer
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
	<!-- ..................................................... ............-->
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
	<center>
		<table class="styled-table" border="1">
			<thead>
				<tr>
					<th>ID</th>
					<th>DNI</th>
					<th>Apellidos</th>
					<th>Nombre</th>
					<th>Sexo</th>
					<th>Nacionalidad</th>
					<th>Situación</th>
					<th>Fecha de nacimiento</th>
					<th>Localidad</th>
					<th>Provincia</th>
					<th>Código Postal</th>
					<th>Domicilio</th>
					<th>Correo electrónico</th>
					<th>Grado</th>
					<th>Ciclo</th>
					<th>Curso</th>
					<th>Jornada</th>
					<th>Fecha matrícula</th>
					<th>Estado matrícula</th>
					<th>Aprobar</th>
					<th>Eliminar</th>
				</tr>
			</thead>
				<?php
					$sql = "SELECT * FROM matriculas";
					$resultadoSql = mysqli_query($connection, $sql);
					
					while($mostrar=mysqli_fetch_array($resultadoSql)){
				?>
					<tr>
						<td><?php echo $mostrar['id'] ?></td>
						<td><?php echo $mostrar['dni'] ?></td>
						<td><?php echo ''. $mostrar['primer_apellido'].' '.$mostrar['segundo_apellido'] ?></td>
						<td><?php echo $mostrar['nombre'] ?></td>
						<td><?php echo $mostrar['sexo'] ?></td>
						<td><?php echo $mostrar['nacionalidad'] ?></td>
						<td><?php echo $mostrar['situacion'] ?></td>
						<td><?php echo $mostrar['fecha_nacimiento'] ?></td>
						<td><?php echo $mostrar['localidad'] ?></td>
						<td><?php echo $mostrar['provincia'] ?></td>
						<td><?php echo $mostrar['codigo_postal'] ?></td>
						<td><?php echo $mostrar['direccion'] ?></td>
						<td><?php echo $mostrar['correo_electronico'] ?></td>
						<td><?php echo $mostrar['grado'] ?></td>
						<td><?php echo $mostrar['ciclo'] ?></td>
						<td><?php echo $mostrar['curso'] ?></td>
						<td><?php echo $mostrar['jornada'] ?></td>
						<td><?php echo $mostrar['fecha_matricula'] ?></td>
						<td><?php echo $mostrar['estado_mat'] ?></td>
						<td>
							<a href="aprobar.php?dni=<?php echo $mostrar['dni']; ?>" onclick="return confirm('¿Está seguro de querer aprobar el registro <?php echo $mostrar['id'];?> con DNI <?php echo $mostrar['dni'];?>?')">
								<img alt="tick" src="img/tick.png" width="80" height="70">
							</a>
						</td>
						<td>
							<a href="borrar.php?dni=<?php echo $mostrar['dni']; ?>" onclick="return confirm('¿Está seguro de querer eliminar el registro <?php echo $mostrar['id'];?> con DNI <?php echo $mostrar['dni'];?>?')">
								<img alt="x" src="img/x.webp" width="80" height="70">
							</a>
						</td>
						<?php
							}
						?>
						
					</tr>
		</table>
	<center>

	<footer id="pie"></footer>
	
	</body>
	<?php 
		}else{
				header("Location: iniciosesion.php?error=Debe iniciar sesión");
		}
	?>
</html>