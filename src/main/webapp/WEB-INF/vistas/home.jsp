<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inicio</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/estilos.css" />
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

</head>

<body>

	<header>

		<nav class="navbar navbar-expand-lg bg-primary">
			<div class="container">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">

						<li class="nav-item mx-2"><a class="nav-link" href="home">Inicio
						</a></li>

						<c:if test="${usuarioActual.nombre != null}">
							<li class="nav-item mx-2 dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> ${usuarioActual.nombre} </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="perfil">Perfil</a> <a
										class="dropdown-item" href="cerrar-sesion">Cerrar sesion</a>
								</div></li>

							<li class="nav-item mx-2 dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> Registrar </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="registro-peli-serie">Pelicula</a>
									<a class="dropdown-item" href="registro-peli-serie">Serie</a> <a
										class="dropdown-item" href="registro-videojuego">VideoJuego</a>
								</div></li>
						</c:if>
					</ul>

					<form action="buscar" method="GET">
						<input type="text" placeholder="Buscar contenido" class="search">
					</form>

					<c:if test="${usuarioActual.nombre == null}">
						<a href="registro-usuario" class="nav-link">Register</a>
						<a href="login" class="nav-link">Log In</a>
					</c:if>

				</div>
			</div>
		</nav>
	</header>

	<div class="boton-container">
	<div class="boton mx-3">
		<h2>Disfruta de tu tiempo libre</h2>
		<p> Encuentra el contenido que mejor se adapte a tus tiempos</p>
		</div>
		
		<div class="boton mx-3 form-tiempo">
			<form action="buscar-recomendaciones" method="GET" class="time-form">
				<div class="tipos">
				<label for="horas" class="time">Cantidad de horas</label>
				<input type="number" name="horas" class="horas">
				</div>
				<div class="tipos">
				<label for="tipo" class="time">Tipo de contenido</label>
				<input type="radio" name="tipo" value="pelicula">
				<label for="pelicula">Peliculas</label><br>
				<input type="radio" name="tipo" value="serie">
				<label for="serie">Series</label><br>
				<input type="radio" name="tipo" value="videojuego">
				<label for="videojuego">Videojuegos</label><br>
				<input type="radio" name="tipo" value="todos">
				<label for="todos">Todos</label><br>
				</div>
				<button type="submit" class="empezar">�Empezar!</button>
			</form>
		</div>
		
	</div>

	<div class="container">
		<div class="recomendaciones-container">

			<h1>Videojuegos</h1>

			<table class="table-responsive table-borderless">
				<c:forEach items="${videojuegos}" var="videojuego">
					<td><a href="videojuego?id=${videojuego.id}"> <img
							src="images/${videojuego.poster}">
					</a>
						<p class="titulo">${videojuego.nombre}</p></td>
				</c:forEach>
			</table>
		</div>
	</div>

	<div class="container">
		<div class="recomendaciones-container">

			<h1>Peliculas</h1>

			<table class="table-responsive table-borderless">
				<c:forEach items="${peliculas}" var="pelicula">
					<td><a href="perfil-fvs?id=${pelicula.id}"> <img
							src="images/${pelicula.poster}">						
					</a>
					<p class="titulo">${pelicula.nombre}</p>
					</td>
				</c:forEach>
			</table>

		</div>
	</div>
	<%-- 		<div class="recomendaciones-container">

		<h1>Series</h1>

		<div class="table-responsive">
			<table>
				<tbody>
					<c:forEach items="${series}" var="serie">
						<td>${serie.nombre}</td>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div> --%>

	<footer class="footer">
		<div class="container">
			<div class="column1">
				<h4 class="mx-2" style="text-align: center; margin: 1em;">Redes
					Sociales</h4>
				<div class="social">
					<div class="item mx-2">
						<a href="https://www.facebook.com/" target="_blank"> <i
							class="fa fa-facebook-square" aria-hidden="true"></i>
						</a>
					</div>
					<div class="item mx-2">
						<a href="https://www.instagram.com/" target="_blank"> <i
							class="fa fa-instagram" aria-hidden="true"></i>
						</a>
					</div>
					<div class="item">
						<a href="https://www.twitter.com/" target="_blank"> <i
							class="fa fa-twitter-square" aria-hidden="true"></i>
						</a>
					</div>
				</div>
			</div>

		</div>
		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">
			<a class="enlaceDeCopy" href="/">PaginaGenericaDeTaller.com</a>
		</div>
		<!-- Copyright -->
	</footer>


	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>