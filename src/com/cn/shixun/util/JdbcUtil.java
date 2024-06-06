package com.cn.shixun.util;

import java.sql.*;

public class JdbcUtil {
    //1 静态注册驱动

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }


    static String url = "jdbc:mysql://localhost:3306/johnliao?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    static String username="root";

    static String password="GYljh20040501?";


    public static Connection getConnection()throws SQLException {
        return DriverManager.getConnection(url,username,password);
    }

    public static void closeAll(Connection conn, PreparedStatement pst, ResultSet re) throws SQLException {
        if(conn!= null) {
            conn.close();
        }
        if(pst!= null) {
            pst.close();
        }
        if(re!= null) {
            re.close();
        }
    }
}
