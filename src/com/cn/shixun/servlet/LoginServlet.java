package com.cn.shixun.servlet;

import com.cn.shixun.pojo.Result;
import com.cn.shixun.pojo.User;
import com.cn.shixun.util.JdbcUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
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
        req.setCharacterEncoding("utf-8");   //防止中文乱码
        resp.setCharacterEncoding("utf-8");

//        业务

//        (1)拿数据
        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");
        System.out.println("用户交互数据:"+name+pwd);

//        (2)使用Jdbc
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

//        (3)响应

//        注释：前端数据 三要素：状态码、信息、数据
        User user = new User("John");
        Result result = new Result(500, "登录成功", user);
        ObjectMapper objectMapper = new ObjectMapper();
        String s = objectMapper.writeValueAsString(result);
        resp.getWriter().write(s);
    }
}
