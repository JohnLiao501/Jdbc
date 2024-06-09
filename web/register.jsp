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
    <title>《原神》注册页面</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <style>
        .login{
            width:600px;
            height:570px;
            background-color: #F5F5DC;
            opacity: 0.80;
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
                width: 180px;
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
        .input-error .el-input__inner {
            border-color: red;
        }
    </style>

</head>
<body>
<video src="video/跨越尘世,于此相遇.mp4" style="width: 100%;height: 100%;object-fit: cover;position: fixed;top: 0;left: 0;z-index: -1" autoplay="autoplay" loop="loop" muted="muted"></video>
<img src ="img/ys.png" alt="原神">
<div id="app">
    <div class="login">
        <div class="imgBox">
            <img src="img/mhyLogo.png">
        </div>
        <el-form label-width="100px" class="login-form">
            <el-form-item>
                <el-input v-model="userInfo.username" placeholder="用户名" style="width: 300px" class="rounded-input" :class="{ 'input-error': userInfo.usernameError }" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
            <el-form-item>
                <el-input v-model="userInfo.password" placeholder="密码" style="width: 300px" class="rounded-input" :class="{ 'input-error': userInfo.passwordError }" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
            <el-form-item>
                <el-input v-model="phoneInfo.phoneNumber" placeholder="手机号" style="width: 300px" class="rounded-input" :class="{ 'input-error': phoneInfo.phoneNumberError }" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
            <el-form-item>
                <el-input v-model="userInfo.email" placeholder="电子邮箱" style="width: 300px" class="rounded-input" :class="{ 'input-error': userInfo.emailError }" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
        </el-form>
        <div class="l-bottom">
            <button @click="login" class="my-button" id="my-button"><span style="font-size: 130%;margin: auto;font-weight: bold">注 册</span></button>
        </div>
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
                    usernameError: false,
                    passwordError: false,
                    emailError:false
                },
                phoneInfo:{
                    phoneNumber: "",
                    phoneNumberError: false
                }
            }
        },
        methods: {
            resetErrors() {
                this.userInfo.usernameError = false;
                this.userInfo.passwordError = false;
                this.phoneInfo.phoneNumberError = false;
                this.phoneInfo.captchaError = false;
            },
            login() {
                let username = this.userInfo.username.trim();
                let password = this.userInfo.password.trim();
                let phoneNumber = this.phoneInfo.phoneNumber.trim();
                let email = this.userInfo.email.trim();
                if (!username) {
                    this.userInfo.usernameError = true;
                    this.$message.error('请输入用户名');
                    return;
                }
                this.resetErrors();
                if (!password) {
                    this.userInfo.passwordError = true;
                    this.$message.error('请输入密码');
                    return;
                }
                this.resetErrors();
                if (!phoneNumber) {
                    this.phoneInfo.phoneNumberError = true;
                    this.$message.error('请输入手机号');
                    return;
                }
                this.resetErrors();
                if (!email) {
                    this.userInfo.emailError = true;
                    this.$message.error('请输入电子邮箱');
                    return;
                }
                this.resetErrors();

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
                    dataType:"JSON",
                    success: function(data) {
                        console.log(data)
                        console.log(data.info)
                        if(data.code === 200){
                            _this.$message.success('注册成功！即将返回登录页面')
                            setTimeout(function (){
                                window.location.href = "./home.jsp"
                            },2500);
                        }else {
                            setTimeout(function (){
                                _this.$message.error('抱歉，当前无法注册！');
                            });
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        // 这里可以添加处理 AJAX 请求失败的情况
                        _this.$message.error('注册请求失败：' + textStatus);
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
