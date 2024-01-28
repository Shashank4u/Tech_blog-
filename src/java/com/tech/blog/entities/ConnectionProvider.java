/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.entities;

import java.sql.*;

/**
 *
 * @author shash
 */
public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnections() {
        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "root");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

        }
        return con;
    }

}
