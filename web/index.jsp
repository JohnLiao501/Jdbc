<%--
  Created by IntelliJ IDEA.
  User: JohnLiao
  Date: 2024/6/6
  Time: 下午3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <style>
        body{
            background-color: cornsilk;
        }

        .login{
            width:500px;
            height:450px;
            background-color: aqua;
            margin:200px auto;
            box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        }

        h1{
            text-align: center;
            padding-top: 50px;
        }
        .login-form{
            padding-top: 50px;
            margin: auto;
        }
        .l-bottom{
            text-align: center;
            padding-top: 50px;
        }
        button{
            width: 100px;
            height: 40px;
            border-radius: 10px;
        }
        span{
            margin-left: 20px;
        }

    </style>

</head>
<body>
<div id="app">
    <h1>Hello and Welcome!</h1>
    <div class="login">
        <h1>登录</h1>

        <el-form label-width="100px" class="login-form">
            <el-form-item label="用户名">
                <el-input v-model="userInfo.username" placeholder="请输入用户名" style="width: 300px"></el-input>
            </el-form-item>
            <el-form-item label="用户密码">
                <el-input v-model="userInfo.username" placeholder="请输入用户密码" style="width: 300px"></el-input>
            </el-form-item>
            </el-form>
        <div class="l-bottom">
            <button @click="login">登录</button>
        </div>
        <span>忘记密码？<a href="#">立即注册！</a> </span>
    </div>

</div>
</body>
<script src="./js/jquery-3.5.0.js"></script>
<script src="https://unpkg.com/vue@2/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui/lib/index.js"></script>

<script>
    new Vue({
        el: '#app',
        data() {
            return {
                userInfo:{
                    username:"",
                    password:"",
                }
            }
        },
        methods: {
            login() {
                console.log(this.userInfo.username)
                console.log(this.userInfo.password)
                $.ajax({
                    url: "http://localhost:8081/S2024LJ/login",
                    type: "post",
                    data: {
                        username: this.userInfo.username,
                        password: this.userInfo.password,
                    },
                    dataType:"JSON",    //返回的数据格式
                    success: function(data) {   //返回函数
                        console.log(data)
                        console.log(data.code)
                        if(data.code === 200){
                            window.location.href = "./login.jsp"
                        }
                        setTimeout(function (){
                            this.$message('哎呀，登录失败了！');
                        },2000);
                    }
                })
            }
        }
    })
</script>
</html>
