package com.cn;
import com.cn.pojo.user;

import java.lang.ClassNotFoundException;
import java.sql.*;
import java.util.ArrayList;

public class Jdbc {
    public static void main(String[] args)  {
        //连接数据库
        String url="jdbc:mysql://localhost:3306/johnliao?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        String user ="root";
        String password="GYljh20040501?";
        Connection connection=null;
        String sql=null;
        PreparedStatement pst=null;
        ResultSet resultSet=null;

        try {
            //注册驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
            sql="select * from student";
            //路由对象
            pst = connection.prepareStatement(sql);
            pst.executeQuery();
            //结果集
            resultSet=pst.executeQuery();
            ArrayList<user>users=new ArrayList<>();
            //user的对象集合（结构体数组）
            while(resultSet.next())
            {
                String username = resultSet.getString("username");
                int age = resultSet.getInt("age");
                String pwd=resultSet.getString("password");
                int userId=resultSet.getInt("userId");
                //封装
                com.cn.pojo.user user1=new user();
                user1.setUserId((userId));
                user1.setUsername(username);
                user1.setPasswd(pwd);
                user1.setAge(age);
                System.out.println("用户对象："+user1);
                users.add(user1);
                System.out.println("用户对象集合："+users);
            }
            System.out.println("连接成功!");
        }
        catch (ClassNotFoundException e)
        {
            throw new RuntimeException(e);
        }
        catch(SQLException e)
        {
            throw new RuntimeException(e);
        }
        //资源关闭
        //连接对象
        finally
        {
            if(connection!=null)
            {
                try{connection.close();}
                catch(SQLException e){throw new RuntimeException(e);}
            }

            if(pst!=null)
                try{pst.close();}
                catch(SQLException e){throw new RuntimeException(e);}

            if(resultSet!=null)
                try{resultSet.close();}
                catch(SQLException e){throw new RuntimeException(e);}
        }
    }
}