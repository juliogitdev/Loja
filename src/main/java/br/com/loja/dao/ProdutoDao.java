package br.com.loja.dao;

import br.com.loja.model.Produto;
import br.com.loja.util.ConnectionFactory;
import java.sql.*;
import java.util.*;

public class ProdutoDao {
    
    public void inserir(Produto p) {
        String sql = "INSERT INTO Produto (name, description, price, stock, url_image, id_categoria) VALUES (?,?,?,?,?,?)";
        
        try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, p.getName());
            stmt.setString(2, p.getDescription());
            stmt.setFloat(3, p.getPrice());
            stmt.setInt(4, p.getStock());
            stmt.setString(5, p.getUrl_image());
            stmt.setInt(6, p.getId_categoria());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Produto> listar() {
        List<Produto> lista = new ArrayList<>();
        String sql = "SELECT * FROM Produto";
        
       try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
               ResultSet rs = stmt.executeQuery()) {
           while (rs.next()) {
               Produto p = new Produto();
               p.setId(rs.getInt("id"));
               p.setName(rs.getString("name"));
               p.setDescription(rs.getString("description"));
               p.setPrice(rs.getFloat("price"));
               p.setStock(rs.getInt("stock"));
               p.setUrl_image(rs.getString("url_image"));
               p.setId_categoria(rs.getInt("id_categoria"));
               lista.add(p);
           }
       } catch (Exception e) {
           e.printStackTrace();;
       }
       return lista;
    }
    
    public void excluir(int id) {
        String sql = "DELETE FROM Produto WHERE id=?";
        
         try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
             stmt.setInt(1, id);
             stmt.executeUpdate();
         } catch (Exception e) {
             e.printStackTrace();
         }
    }
    
}
