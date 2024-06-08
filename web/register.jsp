<%--
  Created by IntelliJ IDEA.
  User: JohnLiao
  Date: 2024/6/8
  Time: 下午3:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <style>
        .login{
            width:600px;
            height:570px;
            background-color: #F5F5DC;
            opacity: 0.90;
            margin:0 auto;
            border-radius: 15px 15px 15px 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        }
        h1{
            text-align: center;
            padding-top: 50px;
        }
        .login-form{
            padding-top: 30px;
            margin: auto;
            margin-left: 50px;
        }
        .l-bottom{
            text-align: center;
            padding-top: 20px;
        }

        .my-button {
            width: 200px;
            height: 40px;
            border-radius: 10px;
            background-color: orange;
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin: auto;
            cursor: pointer;
            transition-duration: 0.4s;
        }
        .my-button:hover {
            background-color: black;
            color: orange;
        }
        .imgBox{
            padding: 60px 20px 20px;
            margin-bottom: 10px;
            display: flex;
            justify-content: center;
            img{
                width: 170px;
            }
        }
        span{
            margin-left: 420px;
        }
        .rounded-input .el-input__inner {
            border-radius: 10px !important;
        }
        .el-input__inner:hover {
            border-color:orange;
        }
    </style>

</head>
<body>
<video src="video/纺坠终久之梦.mp4" style="width: 100%;height: 100%;object-fit: cover;position: fixed;top: 0;left: 0;z-index: -1" autoplay="autoplay" loop="loop" muted="muted"></video>
<img src ="img/ys.png" alt="原神">
<div id="app">
    <div class="login">
        <div class="imgBox">
            <img src="img/mhyLogo2.png">
        </div>
        <el-form label-width="100px" class="login-form">
            <el-form-item>
                <el-input v-model="userInfo.username" placeholder="用户名" style="width: 300px" class="rounded-input" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
            <el-form-item>
                <el-input v-model="userInfo.password" placeholder="密码" style="width: 300px" class="rounded-input" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
            <el-form-item>
                <el-input v-model="phoneInfo.phoneNumber" placeholder="手机号" style="width: 300px" class="rounded-input" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
            <el-form-item>
                <el-input v-model="userInfo.email" placeholder="电子邮箱" style="width: 300px" class="rounded-input" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
        </el-form>
        <div class="l-bottom">
            <button @click="login" class="my-button" id="my-button"><span style="font-size: 130%;margin: auto;font-weight: bold">注 册</span></button>
        </div>
        <br>
        <br>
        <span>已有帐户？<a href="./index.jsp">立即登录！</a> </span>
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
                    email:"",
                },
                phoneInfo:{
                    phoneNumber: "",
                }
            }
        },
        methods: {
            login() {
                let _this = this
                console.log(this.userInfo.username)
                console.log(this.userInfo.password)
                console.log(this.phoneInfo.phoneNumber)
                console.log(this.userInfo.email)
                $.ajax({
                    url: "http://localhost:8081/servlet_Web_exploded/login",
                    type: "post",
                    data: {
                        username: this.userInfo.username,
                        password: this.userInfo.password,
                        phoneNumber: this.phoneInfo.phoneNumber,
                        email:this.userInfo.email,
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
            },
            handleEnter() {
                this.login();
            }
        }
    })
</script>
</html>
