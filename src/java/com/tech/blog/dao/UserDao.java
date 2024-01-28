/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
/**
 *
 * @author shash
 */
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user to data base:
    
    public boolean saveUser(User user){
        boolean f=false;
        try{
            //user ---->database
            String query="insert into user(name,email,password,gender,about) value(?,?,?,?,?)";
            PreparedStatement ps=this.con.prepareStatement(query);
                    ps.setString(1, user.getName());
                    ps.setString(2, user.getEmail());
                    ps.setString(3, user.getPassword());
                    ps.setString(4, user.getGender());
                    ps.setString(5, user.getAbout());
                    ps.executeUpdate();
                    f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    //get user by useremail and userpasswoprd:
    
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        try{
            String query="select *from user where email=? and password=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2,password);
            ResultSet set=ps.executeQuery();
            if(set.next()){
                user=new User();
                //data from data base
                String name=set.getString("name");
                //set to user object
                user.setName(name);
                
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
     return user;   
    }
    
    
    
}
