package br.com.loja.controller;

import java.io.IOException;
import java.util.List;

import br.com.loja.dao.CategoriaDao;
import br.com.loja.dao.ProdutoDao;
import br.com.loja.model.Categoria;
import br.com.loja.model.Produto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Rota pública da loja
@WebServlet("/vitrine")
public class LojaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Busca todas as categorias
        CategoriaDao cd = new CategoriaDao();
        List<Categoria> categorias = cd.listar();
        
        // 2. Busca todos os produtos
        ProdutoDao pd = new ProdutoDao();
        List<Produto> produtos = pd.listar();
        
        // 3. Envia tudo para o JSP
        request.setAttribute("listaCategorias", categorias);
        request.setAttribute("listaProdutos", produtos);
        
        request.getRequestDispatcher("/vitrine.jsp").forward(request, response);
    }
}