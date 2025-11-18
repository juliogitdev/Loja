<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, br.com.loja.model.Produto, br.com.loja.model.Categoria" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minha Loja Virtual</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

    <nav class="store-navbar">
        <a href="<%= request.getContextPath() %>/vitrine" class="store-brand">🛍️ Minha Loja</a>
        
        <a href="<%= request.getContextPath() %>/produto/produto.jsp" class="btn-admin">⚙️ Gerenciar Loja</a>
    </nav>

    <div class="container">
        
        <div style="text-align:center; padding: 40px 0;">
            <h1 style="color:#2c3e50; font-size: 2.5rem;">Bem-vindo às compras!</h1>
            <p style="color:#7f8c8d;">Confira nossas ofertas abaixo separadas por setor.</p>
        </div>

        <%
            List<Categoria> categorias = (List<Categoria>) request.getAttribute("listaCategorias");
            List<Produto> todosProdutos = (List<Produto>) request.getAttribute("listaProdutos");

            if (categorias != null && todosProdutos != null) {
                // LOOP 1: Para cada Categoria
                for (Categoria cat : categorias) {
                    
                    // LÓGICA DE FILTRO: 
                    // Vamos criar uma lista temporária só com produtos DESTA categoria atual
                    List<Produto> produtosDaCategoria = new ArrayList<>();
                    for (Produto p : todosProdutos) {
                        if (p.getCategoria() != null && p.getCategoria().getId() == cat.getId()) {
                            produtosDaCategoria.add(p);
                        }
                    }

                    // Só exibe a seção se a lista NÃO estiver vazia
                    if (!produtosDaCategoria.isEmpty()) {
        %>
            
            <div class="category-section">
                <h2 class="category-title"><%= cat.getName() %></h2>
                
                <div class="products-grid">
                    <% 
                        // LOOP 2: Exibe apenas os produtos filtrados
                        for (Produto p : produtosDaCategoria) { 
                    %>
                        <div class="product-card">
                            <% if(p.getUrl_image() != null && !p.getUrl_image().isEmpty()) { %>
                                <img src="<%= p.getUrl_image() %>" class="product-img" alt="<%= p.getName() %>">
                            <% } else { %>
                                <div class="product-img" style="display:flex;align-items:center;justify-content:center;color:#ccc;">Sem Foto</div>
                            <% } %>
                            
                            <div class="product-info">
                                <h4><%= p.getName() %></h4>
                                <div class="product-price">R$ <%= String.format("%.2f", p.getPrice()) %></div>
                                <div style="font-size:0.8rem; color:#888; margin-bottom:10px;">
                                    Estoque: <%= p.getStock() %> un.
                                </div>
                            </div>

                            <a href="#" class="btn-buy" onclick="alert('Produto adicionado ao carrinho! (Simulação)'); return false;">Comprar</a>
                        </div>
                    <% } // Fim do for produtos %>
                </div> </div> <% 
                    } // Fim do if !isEmpty
                } // Fim do for categorias
            } else {
        %>
            <p style="text-align:center">Nenhum produto cadastrado na loja.</p>
        <% } %>

    </div>

</body>
</html>