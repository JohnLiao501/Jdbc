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
            height:470px;
            background-color: #F5F5DC;
            opacity: 0.8;
            margin:0 auto;
            border-radius: 15px 15px 15px 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        }
        h1{
            text-align: center;
            padding-top: 50px;
        }
        .login-form{
            /*padding-top: 50px;*/
            margin: auto;
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
        span{
            margin-left: 30px;
        }
        .imgBox{
            padding: 40px 20px 20px;
            margin-bottom: 10px;
            display: flex;
            justify-content: center;
            img{
                width: 170px;
            }
        }
        .choiceBox{
            display: flex;
            justify-content: center;
            .itemBox:hover{
                cursor: pointer;
            }
            .itemBox{
                width: 300px;
                display: flex;
                justify-content: space-around;
                .choiceItem{
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    .text{
                        margin-bottom: 10px;
                        font-weight: bolder;
                    }
                    .active{
                        color: black;
                    }
                    .noActive{
                        color: gray;
                    }
                    .line{
                        width: 40px;
                        height: 3px;
                        border-radius: 15px;
                        background-color: orange;
                        transition: opacity 0.5s ease-in-out, transform 0.5s ease-in-out;
                        transform: translateX(0);
                    }
                }
            }
            margin-bottom: 30px;
        }
        .line-move {
            transform: translateX(100px);
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
    <video src="video/原神.mp4" style="width: 100%;height: 100%;object-fit: cover;position: fixed;top: 0;left: 0;z-index: -1" autoplay="autoplay" loop="loop" muted="muted"></video>
    <img src ="img/ys.png" alt="原神">

<div id="app">
    <div class="login">
        <div class="imgBox">
            <img src="img/mhyLogo2.png">
        </div>
        <div class="choiceBox">
            <div class="itemBox">
                <div class="choiceItem" @click="switchLoginType(true)">
                    <div class="text" :class="isMessage?'active':'noActive'">短信登录</div>
                    <div class="line" :style="{ transform: isMessage ? 'translateX(0)' : 'translateX(150px)', transition: 'transform 0.3s ease-in-out' }"></div>
                </div>
                <div class="choiceItem" @click="switchLoginType(false)">
                    <div class="text" :class="!isMessage?'active':'noActive'">密码登录</div>
                </div>
            </div>
        </div>
        <el-form label-width="100px" class="login-form" v-show="isMessage">
            <el-form-item>
                <el-input v-model="phoneInfo.phoneNumber" placeholder="手机号" style="width: 300px" class="rounded-input" :class="{ 'input-error': phoneInfo.phoneNumberError }" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
            <el-form-item>
                <el-input v-model="phoneInfo.CAPTCHA" placeholder="验证码" style="width: 300px" class="rounded-input" :class="{ 'input-error': phoneInfo.CAPTCHAError }" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
            </el-form>
        <el-form label-width="100px" class="login-form" v-show="!isMessage">
            <el-form-item>
                <el-input v-model="userInfo.username" placeholder="用户名" style="width: 300px" class="rounded-input" :class="{ 'input-error': userInfo.usernameError }" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
            <el-form-item>
                <el-input v-model="userInfo.password" placeholder="密码" style="width: 300px" class="rounded-input" :class="{ 'input-error': userInfo.passwordError }" @keyup.enter.native="handleEnter"></el-input>
            </el-form-item>
        </el-form>
        <div class="l-bottom">
            <button @click="login" class="my-button" id="my-button"><span style="font-size: 130%;margin: auto;font-weight: bold">启 动 !</span></button>
        </div>
        <br>
        <br>
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
                    usernameError: false,
                    passwordError: false
                },
                phoneInfo:{
                    phoneNumber:"",
                    CAPTCHA:"",
                    phoneNumberError: false,
                    captchaError: false
                },
                isMessage:true
            }
        },
        methods: {
            switchLoginType(isSms) {
                this.isMessage = isSms;
            },
            resetErrors() {
                this.userInfo.usernameError = false;
                this.userInfo.passwordError = false;
                this.phoneInfo.phoneNumberError = false;
                this.phoneInfo.captchaError = false;
            },
            login() {
                if (this.isMessage) {
                    if (!this.phoneInfo.phoneNumber) {
                        this.phoneInfo.phoneNumberError = true;
                        this.$message.error('请输入手机号');
                        return;
                    }
                    this.resetErrors();
                    if (!this.phoneInfo.CAPTCHA) {
                        this.phoneInfo.CAPTCHAError = true;
                        this.$message.error('请输入验证码');
                        return;
                    }
                    this.resetErrors();
                    // 这里可以添加发送验证码验证的逻辑，然后再执行登录
                } else {
                    if (!this.userInfo.username) {
                        this.userInfo.usernameError = true;
                        this.$message.error('请输入用户名');
                        return;
                    }
                    this.resetErrors();
                    if (!this.userInfo.password) {
                        this.userInfo.passwordError = true;
                        this.$message.error('请输入密码');
                        return;
                    }
                    this.resetErrors();

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
                    dataType:"JSON",
                    success: function(data) {
                        console.log(data)
                        console.log(data.info)
                        if(data.code === 200){
                            _this.$message.success('欢迎来到提瓦特大陆！')
                            setTimeout(function (){
                                window.location.href = "./home.jsp"
                            },2500);
                        }else {
                            setTimeout(function (){
                                _this.$message.error('哎呀，登录失败了！');
                            });
                        }
                    }
                })
            }
            },
            handleEnter() {
                this.login();
            },
        }
    })
</script>
</html>
