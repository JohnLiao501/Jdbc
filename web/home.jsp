<%--
  Created by IntelliJ IDEA.
  User: JohnLiao
  Date: 2024/6/7
  Time: 上午11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>《原神》网页</title>

    <style>
        .audio-controls {
            position: absolute;
            top: 18px;
            right: 50px;
        }
        .audio-controls img {
            cursor: pointer;
            display: none;
        }
        .audio-controls #bgmon {
            display: block;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;

        }

        header h1 {
            margin-bottom: 10px;
        }

        nav{
            display: flex;
        }

        nav ul {
            width: 60%;
            list-style-type: none;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        nav .img{
            width: 20%;
        }

        nav ul li {
            margin: 0 10px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        nav ul li a:hover {
            background-color: #555;
        }

        #header-logo {
            display: block;
            margin: auto;
            margin-left: 20px;
        }
    </style>
</head>
<body>
<header>
    <nav>
        <img id="logo-header" src ="img/logo-header-cut.png" alt="原神" class="img">
        <ul>
            <li><a href="#">首&nbsp;页</a></li>
            <li><a href="#">角&nbsp;色</a></li>
            <li><a href="#">世&nbsp;界</a></li>
            <li><a href="#">新&nbsp;闻</a></li>
        </ul>
    </nav>
</header>
<video src="video/纺坠终久之梦.mp4" style="width: 100%;height: 100%;object-fit: cover;position: fixed;top: 0;left: 0;z-index: -1" autoplay="autoplay" loop="loop" muted="muted"></video>

<audio id="bgm" autoplay>
    </audio>
<div class="audio-controls">
    <img id="bgmoff" src="icon/bgmoff.png" alt="静音" style="display: none;">
    <img id="bgmon" src="icon/bgmon.png" alt="取消静音" style="display: block;">
</div>

<script>
    var audioElement = document.getElementById('bgm');
    var playList = [
        'bgm/陈致逸、HOYO-MiX - Genshin Impact Main Theme 原神.mp3',
        'bgm/HOYO-MiX、陈致逸 - Twilight Serenity (Genshin Impact Main Theme Var.) 宁静的黄昏.mp3',
        'bgm/HOYO-MiX、陈致逸 - Eternal Anamnesis (Genshin Impact Main Theme Var.) 永恒的回忆.mp3'
    ];
    var currentIndex = 0;

    function playNext() {
        audioElement.src = playList[currentIndex];
        audioElement.volume = 0.5;
        audioElement.play();
        currentIndex = (currentIndex + 1) % playList.length;
    }

    audioElement.addEventListener('ended', playNext);
    playNext();

    var audio = document.getElementById('bgm');
    var bgmoff = document.getElementById('bgmoff');
    var bgmon = document.getElementById('bgmon');

    bgmon.addEventListener('click', function() {
        audio.muted = true;
        bgmon.style.display = 'none';
        bgmoff.style.display = 'block';
    });

    bgmoff.addEventListener('click', function() {
        audio.muted = false;
        bgmoff.style.display = 'none';
        bgmon.style.display = 'block';
    });

</script>



</body>
</html>
