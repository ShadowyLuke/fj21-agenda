package br.com.caelum.mvc.logica;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.agenda.dao.ContatoDao;
import br.com.caelum.agenda.modelo.Contato;

public class AlteraContatoLogic implements Logica {

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {

		long id = Long.parseLong(req.getParameter("id"));
		boolean newContato = Boolean.parseBoolean(req.getParameter("new"));
		
		Connection connection = (Connection) req.getAttribute("conn");
		ContatoDao dao = new ContatoDao(connection);

		if(newContato) {
			Contato contato = new Contato();
			
			// Lee informacao do contato
			contato.setId(id);
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
			
			System.out.println("criou contato");
			// Chama o DAO e atualiza o Contato
			dao.atualiza(contato);
			
			// Volta a lista de Contatos
			return "mvc?logica=ListaContatoLogic";
		} else {
			// Recebe o contato original com o DAO
			Contato contato = dao.get(id);
			
			// Poe o Contato no request
			req.setAttribute("contato", contato);
			
			// Redireciona pra a pagina de alteracao de contatos
			return "altera-contato.jsp";
		}
		
	}

}
