package br.com.loja.controller;

import java.io.IOException;
import java.util.List;

import br.com.loja.dao.CategoriaDao;
import br.com.loja.model.Categoria;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/categorias")
public class CategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public CategoriaServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CategoriaDao cd = new CategoriaDao();
		List<Categoria> categorias = cd.listar();
		
		request.setAttribute("categorias", categorias);
		
		System.out.print("");
		request.getRequestDispatcher("/categoria/categoria.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//recebendo dados do formulário
		String nameCategoria = request.getParameter("name");
		String descriptionCategoria = request.getParameter("description");

		//montando objetos
        Categoria c = new Categoria();
        CategoriaDao cd = new CategoriaDao();
        
        c.setName(nameCategoria);
        c.setDescription(descriptionCategoria);
        
		//inserindo no banco de dados
        cd.inserir(c);
		
		
		doGet(request, response);
	}

}
