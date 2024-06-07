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
    <title>原神</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <style>
        .login{
            width:500px;
            height:450px;
            background-color: #F5F5DC;
            opacity: 0.8;
            margin:200px auto;
            border-radius: 15px 15px 15px 15px;
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
            padding-top: 20px;
        }
        button{
            width: 200px;
            height: 40px;
            border-radius: 10px;
            margin: auto;
        }
        span{
            margin-left: 50px;
        }
    </style>

</head>
<body>
    <video src="video/原神.mp4" style="width: 100%;height: 100%;object-fit: cover;position: fixed;top: 0;left: 0;z-index: -1" autoplay="autoplay" loop="loop" muted="muted"></video>
    <img src ="img/ys.png" alt="原神">

<div id="app">
    <div class="login">
        <h1><span style="font-size: 120%;margin: auto">登 录</span></h1>
        <el-form label-width="100px" class="login-form">
            <el-form-item>
                <el-input v-model="userInfo.username" placeholder="用户名" style="width: 300px"></el-input>
            </el-form-item>
            <el-form-item>
                <el-input v-model="userInfo.password" placeholder="密码" style="width: 300px"></el-input>
            </el-form-item>
            </el-form>
        <div class="l-bottom">
            <button @click="login"><span style="font-size: 130%;margin: auto">启 动 !</span></button>
        </div>
        <span>没有帐户？<a href="./register.jsp">立即注册！</a> </span>
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
                let _this = this
                console.log(this.userInfo.username)
                console.log(this.userInfo.password)
                $.ajax({
                    url: "http://localhost:8081/servlet_Web_exploded/login",
                    type: "post",
                    data: {
                        username: this.userInfo.username,
                        password: this.userInfo.password,
                    },
                    dataType:"JSON",    //返回的数据格式
                    success: function(data) {   //返回函数
                        console.log(data)
                        console.log(data.info)
                        if(data.code === 200){
                            _this.$message.success('欢迎来到提瓦特大陆！')
                            setTimeout(function (){
                                window.location.href = "./home.jsp"
                            },1000);
                        }else {
                            setTimeout(function (){
                                _this.$message.error('哎呀，登录失败了！');
                            },1000);
                        }

                    }
                })
            }
        }
    })
</script>
</html>
