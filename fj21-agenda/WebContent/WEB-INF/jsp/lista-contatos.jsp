<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- JSTL Libraries -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Lista de contatos</title>
	</head>
	<body>
		<!-- Importa Cabecalho da pagina -->
		<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
		
		<!-- Adiciona Contato -->
		<a href="/WEB-INF/jsp/adiciona-contato.jsp">Adiciona Novo Contato</a> <br />
		
		<!-- Set up Table -->
		<table border="1">
			<tr>
				<th>#</th>
				<th>ID</th>
				<th>Nome</th>
				<th>Email</th>
				<th>Endereco</th>
				<th>Data de Nascimento</th>
				<th></th>
				<th></th>
			</tr>
			
			<!-- percorre contatos montando as linhas da tabela -->
			<c:forEach var="contato" items="${contatos }"  varStatus="id">
				<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }" >
					<!-- Print out Contato's data -->
					<td>${id.count }</td>
					<td>${contato.id }</td>
					<td>${contato.nome }</td>
					<c:choose>
						<c:when test="${not empty contato.email }">
							<td><a href="mailto:${contato.email }">${contato.email }</a></td>
						</c:when>
						<c:otherwise>
							<td>E-mail nao informado</td>
						</c:otherwise>
					</c:choose>
					<td>${contato.endereco }</td>
					<td><fmt:formatDate value="${contato.dataNascimento.time }" pattern="dd/MM/yyyy" /></td>
					<td><a href="mvc?logica=ModificaContatoLogic&id=${contato.id }&new=false">Alterar</a></td>
					<td><a href="mvc?logica=RemoveContatoLogic&id=${contato.id }">Remover</a></td>
				</tr>
			</c:forEach>	
		</table>
		
		<c:import url="/WEB-INF/jsp/rodape.jsp" />
	</body>
</html>