<!DOCTYPE html>

<!-- JSTL Libraries -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<html>
	<head>
		<!-- Importing JQuery (CSS and javascripts) -->
		<link href="css/jquery.css" rel="stylesheet">
		<script src="js/jquery.js"></script>
		<script src="js/jquery-ui.js"></script>
		
		<meta charset="UTF-8">
		<title>Adiciona Contato</title>
	</head>
	<body>
		<!-- Importa cabecalho -->
		<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
		
		<h1>Adiciona Contato</h1>
		<hr />
		<form action="mvc?logica=ModificaContatoLogic&new=true" method="POST">
			Nome: <input type="text" name="nome" /><br />
			E-mail: <input type="text" name="email" /><br />
			Endereco: <input type="text" name="endereco" /><br />
			Data Nascimento: <caelum:campoData id="dataNascimento" /><br />
			
			<input type="submit" value="Gravar" />
		</form>
		
		<!-- Importa rodape -->
		<c:import url="/WEB-INF/jsp/rodape.jsp" />
	</body>
</html>