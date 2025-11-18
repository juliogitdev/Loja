<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.*, br.com.loja.model.Produto, br.com.loja.model.Categoria" %>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="UTF-8">
            <title>Gerenciar Produtos</title>
            <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
        </head>

        <body>

            <div class="container">

                <div class="navbar">
                    <a href="<%= request.getContextPath() %>/vitrine" class="btn-ver-loja">
                        🛍️ Ver Loja
                    </a>
                    <a href="<%= request.getContextPath() %>/categorias">Categorias</a>
                    <a href="<%= request.getContextPath() %>/produtos">Produtos</a>
                </div>

                <h1>Produtos</h1>

                <div class="card">
                    <h2>Cadastrar Produto</h2>
                    <form action="<%= request.getContextPath() %>/produtos" method="post" class="form">

                        <div class="form-group">
                            <label>Nome:</label>
                            <input type="text" name="name" required>
                        </div>

                        <div class="form-group">
                            <label>Descrição:</label>
                            <input type="text" name="description">
                        </div>

                        <div class="row-flex">
                            <div class="col form-group">
                                <label>Preço (R$):</label>
                                <input type="number" name="price" step="0.01" required class="input-medium">
                            </div>
                            <div class="col form-group">
                                <label>Estoque:</label>
                                <input type="number" name="stock" required class="input-short">
                            </div>
                        </div>

                        <div class="row-flex">
                            <div class="col form-group">
                                <label>URL Imagem:</label>
                                <input type="text" name="url_image" placeholder="http://...">
                            </div>

                            <div class="col form-group">
                                <label>Categoria:</label>
                                <select name="idCategoria" required class="input-medium">
                                    <option value="">Selecione...</option>
                                    <% List<Categoria> listaCats = (List<Categoria>) request.getAttribute("categorias");
                                            if(listaCats != null) {
                                            for(Categoria c : listaCats) {
                                            %>
                                            <option value="<%= c.getId() %>">
                                                <%= c.getName() %>
                                            </option>
                                            <% } } %>
                                </select>
                            </div>
                        </div>

                        <div class="btn-container">
                            <input type="submit" value="Salvar Produto">
                        </div>
                    </form>
                </div>

                <br>
                <hr><br>

                <h2>Lista de Produtos</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Imagem</th>
                            <th>Nome</th>
                            <th>Preço</th>
                            <th>Estoque</th>
                            <th>Categoria</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<Produto> listaProds = (List<Produto>) request.getAttribute("produtos");
                                if(listaProds != null && !listaProds.isEmpty()){
                                for(Produto p : listaProds){
                                %>
                                <tr>
                                    <td style="text-align:center;">
                                        <%= p.getId() %>
                                    </td>
                                    <td style="text-align:center;">
                                        <% if(p.getUrl_image() !=null && !p.getUrl_image().isEmpty()) { %>
                                            <img src="<%= p.getUrl_image() %>" height="40">
                                            <% } else { %> - <% } %>
                                    </td>
                                    <td>
                                        <%= p.getName() %>
                                    </td>
                                    <td>R$ <%= String.format("%.2f", p.getPrice()) %>
                                    </td>
                                    <td style="text-align:center;">
                                        <%= p.getStock() %>
                                    </td>

                                    <td>
                                        <%= (p.getCategoria() !=null) ? p.getCategoria().getName() : "S/ Categoria" %>
                                    </td>

                                    <td style="text-align:center;">
                                        <form action="<%= request.getContextPath() %>/produtos/excluir" method="post">
                                            <input type="hidden" name="id" value="<%= p.getId() %>">
                                            <button type="submit" class="btn-excluir"
                                                onclick="return confirm('Apagar este produto?');">Excluir</button>
                                        </form>
                                    </td>
                                </tr>
                                <% } } else { %>
                                    <tr>
                                        <td colspan="7" style="text-align:center; padding: 15px;">Nenhum produto
                                            cadastrado.</td>
                                    </tr>
                                    <% } %>
                    </tbody>
                </table>
            </div>

        </body>

        </html>