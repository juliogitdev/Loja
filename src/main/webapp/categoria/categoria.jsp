<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.*, br.com.loja.model.Categoria" %>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Gerenciar Categorias</title>
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

                <h1>Categorias</h1>

                <div class="card">
                    <h2>Criar nova categoria</h2>
                    <form action="categorias" method="post" class="form">

                        <div class="row-flex">
                            <div class="col form-group">
                                <label for="name">Nome:</label>
                                <input type="text" name="name" id="name" required placeholder="Ex: Eletrônicos">
                            </div>

                            <div class="col form-group">
                                <label for="description">Descrição:</label>
                                <input type="text" name="description" id="description" placeholder="Descrição breve...">
                            </div>

                            <div class="col form-group"
                                style="flex: 0; min-width: auto; display: flex; align-items: flex-end;">
                                <input type="submit" value="Criar">
                            </div>
                        </div>

                    </form>
                </div>

                <br>
                <hr><br>

                <h2>Lista de Categorias</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Descrição</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");

                                if(categorias != null && !categorias.isEmpty()){
                                for(Categoria c : categorias){
                                %>
                                <tr>
                                    <td style="text-align:center;">
                                        <%= c.getId() %>
                                    </td>
                                    <td>
                                        <%= c.getName() %>
                                    </td>
                                    <td>
                                        <%= (c.getDescription()==null) ? "-" : c.getDescription() %>
                                    </td>
                                    <td style="text-align:center;">
                                        <form action="categorias/excluir" method="post">
                                            <input type="hidden" name="id" value="<%= c.getId() %>">
                                            <button type="submit" class="btn-excluir"
                                                onclick="return confirm('Tem certeza?');">Excluir</button>
                                        </form>
                                    </td>
                                </tr>
                                <% } } else { %>
                                    <tr>
                                        <td colspan="4" style="text-align:center; padding: 15px;">Nenhuma categoria
                                            encontrada.</td>
                                    </tr>
                                    <% } %>
                    </tbody>
                </table>

            </div>
        </body>

        </html>