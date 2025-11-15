package br.com.loja;

import br.com.loja.dao.CategoriaDao;
import br.com.loja.dao.ProdutoDao;
import br.com.loja.model.Categoria;
import br.com.loja.model.Produto;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
       /*
       Categoria categoriaNova = new Categoria();
       categoriaNova.setName("Brinquedos");
       
       Produto produtoNovo = new Produto();
       produtoNovo.setName("Carrinho");
       produtoNovo.setPrice(19);
       produtoNovo.setStock(0);
       
       
       CategoriaDao cd = new CategoriaDao();
       ProdutoDao pd = new ProdutoDao();
       cd.inserir(categoriaNova);
       
       categoriaNova = cd.buscar(1);
       
       produtoNovo.setCategoria(categoriaNova);
       pd.inserir(produtoNovo);
       */
        
        System.out.println("Hello World!");
    }
}
