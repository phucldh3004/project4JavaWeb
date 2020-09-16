/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phucldh.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import phucldh.utils.DBAcess;

/**
 *
 * @author nkokp
 */
public class AccountDAO implements Serializable {

    private Connection conn;
    private PreparedStatement ptm;
    private ResultSet rs;

    private void closeConnection() throws SQLException {
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

    public boolean checkLogin(String username, String password) throws SQLException, Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT username FROM Users WHERE username = ? AND password = ?";
            conn = DBAcess.getMyConnection();
             if (conn != null) {
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, username);
            ptm.setString(2, password);
            rs = ptm.executeQuery();
            if (rs.next()) {
                System.out.println("true");
                check = true;
            }
             }
        } finally {
            closeConnection();
        }
        return check;
    }
}
