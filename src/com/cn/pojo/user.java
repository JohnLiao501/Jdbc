package com.cn.pojo;

import javax.management.relation.Role;
import java.util.List;

public class user {
    private int userId;
    private String username;
    private int age;
    private String passwd;
    private List<Role> roles;

    public user(){}

    //构造函数
    public user(int userId, String username, int age, String passwd) {
        this.username = username;
        this.userId = userId;
        this.age = age;
        this.passwd = passwd;
    }

    //方法
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    public String toString() {
        return "user{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", age=" + age +
                ", passwd='" + passwd + '\'' +
                '}';
    }
}