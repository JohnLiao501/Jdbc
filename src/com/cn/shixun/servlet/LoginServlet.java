package com.cn.shixun.servlet;

import com.cn.shixun.util.JdbcUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //业务
        System.out.println("欢迎登录！");

        Connection conn = null;
        try {
            conn = JdbcUtil.getConnection();
            System.out.println("数据库连接成功！");
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        try {
            JdbcUtil.closeAll(conn,null,null);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
