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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
        resp.setContentType("text/html;charset=utf-8");

//        业务
//        (1)拿数据
        String name = req.getParameter("username");
        String pwd = req.getParameter("password");
        System.out.println("用户交互数据:" + name + pwd);

//        (2)使用Jdbc
        Connection conn = null;
        User user = null;
        try {
            conn = JdbcUtil.getConnection();
            System.out.println("数据库连接成功！");
            String sql="select * from user where username=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,pwd);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                user = new User();
                String username = rs.getString("username");
                user.setName(username);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            JdbcUtil.closeAll(conn,null,null);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        Result result;
        if(user != null){
            result = new Result(200, "登录成功", user);
        }else{
            result = new Result(500, "登录失败", user);
        }
        ObjectMapper objectMapper = new ObjectMapper();
        String s = objectMapper.writeValueAsString(result);
        resp.getWriter().write(s);
    }
}
