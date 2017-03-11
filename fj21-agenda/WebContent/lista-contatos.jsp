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
		<c:import url="cabecalho.jsp" />
		
		<!-- Cria o DAO -->
		<jsp:useBean id="dao" class="br.com.caelum.agenda.dao.ContatoDao" />
		
		<!-- Set up Table -->
		<table border="1">
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>Email</th>
				<th>Endereco</th>
				<th>Data de Nascimento</th>
			</tr>
			
			<!-- percorre contatos montando as linhas da tabela -->
			<c:forEach var="contato" items="${dao.lista }"  varStatus="id">
				<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }" >
					<!-- Print out Contato's data -->
					<td>${id.count }</td>
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
				</tr>
			</c:forEach>	
		</table>
		
		<c:import url="rodape.jsp" />
	</body>
</html>