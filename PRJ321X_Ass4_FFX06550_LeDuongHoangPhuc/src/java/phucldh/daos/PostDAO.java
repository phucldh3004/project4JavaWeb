/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phucldh.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import phucldh.dtos.PostDetailDTO;
import phucldh.utils.DBAcess;

/**
 *
 * @author nkokp
 */
public class PostDAO implements Serializable {

    ArrayList<PostDetailDTO> listPost;
    Connection conn;
    PreparedStatement ptm;
    ResultSet rs;

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (ptm != null) {
            ptm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public ArrayList LoadPost() throws Exception {
        PostDetailDTO result = null;
        listPost = new ArrayList();
        conn = DBAcess.getMyConnection();
        try {
            String sql = ("SELECT idPostDetail, title, author, content, publishedTime FROM Postdetail");
            ptm = conn.prepareStatement(sql);
            rs = ptm.executeQuery();
            while (rs.next()) {
                result = new PostDetailDTO(rs.getInt("idPostDetail"), rs.getString("title"), rs.getString("author"), rs.getString("Content"), rs.getString("publishedTime"));
                listPost.add(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }

        return listPost;
    }
    
    public PostDetailDTO loadPostbyID(int id) throws Exception {
        PostDetailDTO result = null;
        try {
            String sql = ("Select idPostDetail, title, author, content, publishedTime from Postdetail where idPostDetail=?");
            conn = DBAcess.getMyConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                result = new PostDetailDTO(rs.getInt("idPostDetail"), rs.getString("title"), rs.getString("author"), rs.getString("content"), rs.getString("publishedTime"));
            }
        } catch (Exception e) {
            e.printStackTrace();

        }finally{
            closeConnection();
        }
        return result;
    }
    
    public String Update(String Content, int id) throws SQLException, Exception {
        String mess = "";
        try {
            String sql = "UPDATE Postdetail set content=? WHERE idPostDetail=?";

            conn = DBAcess.getMyConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, Content);
            ptm.setInt(2, id);
            ptm.executeUpdate();
            mess = "Update Success";
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return mess;
    }
    
    public String AddPost(int id, String title, String author, String content, java.sql.Timestamp ourJavaTimestampObject) throws Exception {
        String mess = "Error";
        try {
            String sql =    "INSERT into Postdetail(idPostDetail,title,author,content,publishedTime) values(?,?,?,?,?)";
            conn = DBAcess.getMyConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setInt(1, id);
            ptm.setString(2, title);
            ptm.setString(3, author);
            ptm.setString(4, content);
            ptm.setTimestamp(5, ourJavaTimestampObject);
            ptm.executeUpdate();
            ptm.close();
            mess = "Insert successfully!";

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

        } finally {
            closeConnection();

        }
        return mess;
    }

}
