package br.com.loja.controller;

import java.io.IOException;

import br.com.loja.dao.ProdutoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/produtos/excluir")
public class RemoveProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        ProdutoDao pd = new ProdutoDao();
        pd.excluir(id);
        
        response.sendRedirect(request.getContextPath() + "/produtos");
    }
}