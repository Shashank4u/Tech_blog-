/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.entities;

/**
 *
 * @author shash
 */
public class Message {

    private String ContentString;
    private String type;
    private String cssClass;

    public Message(String ContentString, String type, String cssClass) {
        this.ContentString = ContentString;
        this.type = type;
        this.cssClass = cssClass;
    }
    
    //getter  and setter

    public String getContentString() {
        return ContentString;
    }

    public void setContentString(String ContentString) {
        this.ContentString = ContentString;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }
    
    
    
    
}
