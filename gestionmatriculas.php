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
		<form action="" method="post">
			<p>DNI: <input type="text" name="busqueda"></p>
			<?php 
				$busqueda = @$_POST['busqueda'];
				if(isset($busqueda)){
					echo "<b>Buscando registros con DNI = -$busqueda-</b>";
				}
			?>
			<p><input type="submit" name="enviar"></p>
		</form>
		
		<table class="styled-table" border="1">
			<thead>
				<tr>
					<th>DNI</th>
					<th>Apellidos</th>
					<th>Nombre</th>
					<th>Fecha de nacimiento</th>
					<th>Sexo</th>
					<th>Correo electrónico</th>
					<th>Nacionalidad</th>
					<th>Código Postal</th>
					<th>Domicilio</th>
					<th>Estado Matricula</th>
					<th>Aprobar</th>
					<th>Eliminar</th>
				</tr>
			</thead>
				<?php
					if(isset($_POST['enviar'])){
						$busqueda = $_POST['busqueda'];
						$consulta = "SELECT * FROM alumno WHERE idAlumno LIKE '%$busqueda%'";
						$sql2 = "SELECT * FROM matricula";
						$resultadoSql2 = mysqli_query($connection, $sql2);
						$mostrar2 = mysqli_fetch_array($resultadoSql2);
						$resultadoConsulta = mysqli_query($connection, $consulta);
						while($mostrar=mysqli_fetch_array($resultadoConsulta)){
				?>
					<tr>
						<td><?php echo $mostrar['idAlumno'] ?></td>
						<td><?php echo ''. $mostrar['apellido1'].' '.$mostrar['apellido2'] ?></td>
						<td><?php echo $mostrar['nombre'] ?></td>
						<td><?php echo $mostrar['fecNacimiento'] ?></td>
						<td><?php echo $mostrar['sexo'] ?></td>
						<td><?php echo $mostrar['correo'] ?></td>
						<td><?php echo $mostrar['nacionalidad'] ?></td>
						<td><?php echo $mostrar['cp'] ?></td>
						<td><?php echo $mostrar['direccion'] ?></td>
						<td><?php echo $mostrar2['estado'] ?></td>
						<td>
							<a href="aprobar.php?idAlumno=<?php echo $mostrar['idAlumno']; ?>" onclick="return confirm('¿Está seguro de querer aprobar el registro <?php echo $mostrar['idAlumno'];?> con DNI <?php echo $mostrar['idAlumno'];?>?')">
								<img alt="tick" src="img/tick.png" width="80" height="70">
							</a>
						</td>
						<td>
							<a href="borrar.php?idAlumno=<?php echo $mostrar['idAlumno']; ?>" onclick="return confirm('¿Está seguro de querer eliminar el registro <?php echo $mostrar['idAlumno'];?> con DNI <?php echo $mostrar['idAlumno'];?>?')">
								<img alt="x" src="img/x.webp" width="80" height="70">
							</a>
						</td>
						<?php
							}
					}elseif(empty($_POST['enviar'])){
					$sql = "SELECT * FROM alumno";
					$sql2 = "SELECT * FROM matricula";
					$resultadoSql = mysqli_query($connection, $sql);
					$resultadoSql2 = mysqli_query($connection, $sql2);
					$mostrar2 = mysqli_fetch_array($resultadoSql2);
					while($mostrar=mysqli_fetch_array($resultadoSql)){
				?>
					<tr>
						<td><?php echo $mostrar['idAlumno'] ?></td>
						<td><?php echo ''. $mostrar['apellido1'].' '.$mostrar['apellido2'] ?></td>
						<td><?php echo $mostrar['nombre'] ?></td>
						<td><?php echo $mostrar['fecNacimiento'] ?></td>
						<td><?php echo $mostrar['sexo'] ?></td>
						<td><?php echo $mostrar['correo'] ?></td>
						<td><?php echo $mostrar['nacionalidad'] ?></td>
						<td><?php echo $mostrar['cp'] ?></td>
						<td><?php echo $mostrar['direccion'] ?></td>
						<td><?php echo $mostrar2['estado'] ?></td>
						<td>
							<a href="aprobar.php?idAlumno=<?php echo $mostrar['idAlumno']; ?>" onclick="return confirm('¿Está seguro de querer aprobar el registro con DNI <?php echo $mostrar['idAlumno'];?>?')">
								<img alt="tick" src="img/tick.png" width="80" height="70">
							</a>
						</td>
						<td>
							<a href="borrar.php?idAlumno=<?php echo $mostrar['idAlumno']; ?>" onclick="return confirm('¿Está seguro de querer eliminar el registro con DNI <?php echo $mostrar['idAlumno'];?>?')">
								<img alt="x" src="img/x.webp" width="80" height="70">
							</a>
						</td>
						<?php
							}}
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