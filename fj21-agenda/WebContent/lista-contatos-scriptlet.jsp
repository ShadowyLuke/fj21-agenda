<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%@ page import="java.util.*,
		java.sql.Connection,
		br.com.caelum.agenda.dao.ContatoDao,
		br.com.caelum.agenda.modelo.*" 
	%>
	<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	</head>
	<body>			
		<table>
			<tr>
				<th>Nome</th>
				<th>Email</th>
				<th>Endereco</th>
				<th>Data de Nascimento</th>
			</tr>
			<%
				Connection connection = (Connection) request.getAttribute("conn");
				ContatoDao dao = new ContatoDao(connection);
				List<Contato> contatos = dao.getLista();
				
				for (Contato contato : contatos ) {
			%>
				<tr>
					<td><%=contato.getNome() %></td>
					<td><%=contato.getEmail() %></td>
					<td><%=contato.getEndereco() %></td>
					<td><%=contato.getDataNascimento().getTime() %></td>
				</tr>
			<%
				}
			%>
		</table>
	</body>
</html>