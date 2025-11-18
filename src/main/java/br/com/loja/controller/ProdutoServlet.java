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

@WebServlet("/produtos")
public class ProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Lista os Produtos para a tabela
        ProdutoDao pd = new ProdutoDao();
        List<Produto> produtos = pd.listar();
        request.setAttribute("produtos", produtos);

        // 2. Lista as Categorias para o <select> do formulário
        CategoriaDao cd = new CategoriaDao();
        List<Categoria> categorias = cd.listar();
        request.setAttribute("categorias", categorias); // Nome importante para o JSP

        request.getRequestDispatcher("/produto/produto.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Recebendo dados do formulário
        String nome = request.getParameter("name");
        String desc = request.getParameter("description");
        // Conversões de String para números
        float preco = Float.parseFloat(request.getParameter("price"));
        int estoque = Integer.parseInt(request.getParameter("stock"));
        String img = request.getParameter("url_image");
        int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));

        // Criando os objetos
        Produto p = new Produto();
        p.setName(nome);
        p.setDescription(desc);
        p.setPrice(preco);
        p.setStock(estoque);
        p.setUrl_image(img);

        // Vinculando a Categoria ao Produto
        Categoria c = new Categoria();
        c.setId(idCategoria);
        p.setCategoria(c);

        // Salvando
        ProdutoDao pd = new ProdutoDao();
        pd.inserir(p);

        response.sendRedirect(request.getContextPath() + "/produtos");
    }
}