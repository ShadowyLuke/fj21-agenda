package br.com.caelum.mvc.logica;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.agenda.dao.ContatoDao;
import br.com.caelum.agenda.modelo.Contato;

public class ModificaContatoLogic implements Logica {

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// Check if it has a new parameter
		if (req.getParameter("new") == null) {
			throw new ServletException("Needed new parameter wasn't set!");
		}
		
		// Get the new parameter
		boolean newContato = Boolean.parseBoolean(req.getParameter("new"));
		
		// Create DAO Connection
		Connection connection = (Connection) req.getAttribute("conn");
		ContatoDao dao = new ContatoDao(connection);

		// Check if it is an newContato
		// If it isn't new, check if it has an ID attached and pull Contato info
		if(!newContato && req.getParameter("id") != null) {
			// Find original Contato using ID
			Long id = Long.parseLong(req.getParameter("id"));
			Contato contato = dao.get(id);
			
			// Set the Contato to request
			req.setAttribute("contato", contato);
			
			System.out.println("Redirecionando para alterar Contato... ");
			
			// Redirect to the Contato modification page
			return "/WEB-INF/jsp/altera-contato.jsp";
		} else {
			// Create the new Contato
			Contato contato = new Contato();
			
			// Read Contato info
			//contato.setId(id);
			contato.setNome(req.getParameter("nome"));
			contato.setEmail(req.getParameter("email"));
			contato.setEndereco(req.getParameter("endereco"));
			
			String dataEmTexto = req.getParameter("dataNascimento");
			Calendar dataNascimento = null;
			
			try {
				Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
				dataNascimento = Calendar.getInstance();
				dataNascimento.setTime(date);
			} catch (ParseException e) {
				res.getWriter().println("Erro na conversao da data");
				return "error/error.html"; // para a execucao do metodo
			}
			
			contato.setDataNascimento(dataNascimento);

			if (req.getParameter("id") == null) {
				// Call DAO and add the new Contato
				dao.adiciona(contato);
				
				System.out.println("Adicionando novo Contato... ");
				
			} else {
				// Since it has an ID, get it and update the Contato with it
				Long id = Long.parseLong(req.getParameter("id"));
				contato.setId(id);
				
				// Call DAO and update the Contato
				dao.atualiza(contato);
				
				System.out.println("Atualizando Contato... ");
			}
			
			// Return to the list of Contatos
			return "mvc?logica=ListaContatoLogic";
			
		}		
	}
}
