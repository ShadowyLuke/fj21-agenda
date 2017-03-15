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
		<title>Altera Contato</title>
	</head>
	<body>
		<!-- Importa cabecalho -->
		<c:import url="cabecalho.jsp" />
		
		<h1>Altera Contatos</h1>
		<hr />
		<form action="mvc?logica=ListaContatoLogic">
			Nome: <input type="text" name="nome" value="${contato.nome }"/><br />
			E-mail: <input type="text" name="email" value="${contato.email }"/><br />
			Endereco: <input type="text" name="endereco" value="${contato.endereco }"/><br />
			Data Nascimento: <caelum:campoData id="dataNascimento" value="${contato.dataNascimento }"/><br />
			
			<input type="submit" value="Gravar" />
		</form>
		
		<!-- Importa rodape -->
		<c:import url="rodape.jsp" />
	</body>
</html>