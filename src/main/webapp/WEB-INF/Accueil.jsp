<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="ISO-8859-1" />

<title></title>

<!--  BOOTSTRAP ET  CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="Style.css" />
<!-- FIN BOOTSTRAP ET CSS -->

</head>
<body>
	<!-- HEADER -->
	<header>
		<!-- Titre pages + menu-->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<h1>ENI-Ench�res</h1>
<a href="https://zupimages.net/viewer.php?id=22/02/vjjd.gif"><img src="https://zupimages.net/up/22/02/vjjd.gif" alt="" /></a>
					
				</div>
				<div class="col-md-6">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link active"
							href="http://localhost:8080/ProjetEncheres/Connexion">S'inscrire
								- Se connecter</a></li>
					</ul>
				</div>
			</div>
			<!--Sous titre-->
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h2>Liste des ench�res</h2>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- FIN DU HEADER -->	

	<!--Recherche-->
	<section class="search-sec">
		<div class="container-fluid">

			<form action="AccueilServlet" method="post" novalidate="novalidate">
				<dv class="row">
				<div class="col-md-6">
					<p>Filtres</p>
					<!-- Formulaire de recherche-->
					<input type="text" class="form-control search-slt"
						placeholder="Le nom de l'article contient" name="nomArticle" >
					<!-- Choix des cat�gories-->
					<div class="row">
						<div class="col-md-6">
							<p>Cat�gories</p>
						</div>
						<div class="col-md-6">
							<select name="listeDeroulante" value="listeDeroulante" class="form-control search-slt">
								<option value="Toutes">
									<!-- Toutes les cat�gories--> <a><p>Toutes</p></a>
								</option>
								 <c:forEach items="${lstCategories}" var="categorie">
						 			 <option value="${categorie.libelle}">${categorie.libelle}</option>
						 		</c:forEach>			
							</select>
						</div>
					</div>
				</div>
				<!--Boutons Rechercher-->
				<div class="col-md-6 text-center">
					<button type="submit" class="btn btn-primary search-btn"
						name="recherche" value="recherche">Rechercher</button>
				</div>
			</form>
		</div>
	</section>
	<!-- Fin du formulaire de recherche-->


	<!-- D�but Affichage des Articles -->
	<c:forEach items="${Liste}" var="sc">
		<p>-------------------------------------------------------</p>
		<p>${sc.nomArticle}</p>
		<p>Prix :${sc.miseAPrix}</p>
		<p>Fin de l'ench�re : ${sc.dateFinEncheres}</p>
		<p>Vendeur : ${sc.utilisateur.pseudo}</p>
		<p>-------------------------------------------------------</p>
	</c:forEach>
	<!-- Fin Affichage des Articles-->
</body>
</html>