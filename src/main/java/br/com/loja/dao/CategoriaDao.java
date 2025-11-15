
package br.com.loja.dao;

import br.com.loja.model.Categoria;
import br.com.loja.util.ConnectionFactory;
import java.sql.*;
import java.util.*;

public class CategoriaDao {
    
    public void inserir(Categoria c) {
        String sql = "INSERT INTO Categoria (name, description) VALUES (?,?)";
        
        try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, c.getName());
            stmt.setString(2, c.getDescription());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Categoria> listar() {
        List<Categoria> lista = new ArrayList<>();
        String sql = "SELECT * FROM Categoria";
        
       try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
               ResultSet rs = stmt.executeQuery()) {
           while (rs.next()) {
               Categoria c = new Categoria();
               c.setId(rs.getInt("id"));
               c.setName(rs.getString("name"));
               c.setDescription(rs.getString("description"));
               lista.add(c);
           }
       } catch (Exception e) {
           e.printStackTrace();;
       }
       return lista;
    }
    
    public void excluir(int id) {
        String sql = "DELETE FROM Categoria WHERE id=?";
        
         try (Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
             stmt.setInt(1, id);
             stmt.executeUpdate();
         } catch (Exception e) {
             e.printStackTrace();
         }
    }
    
}
