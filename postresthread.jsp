<%@ page pageEncoding="Windows-31J"
	contentType="text/html;charset=Windows-31J" %>

<%--JSTL 1.1.2 core �^�O���C�u����--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ja">
<head>
<meta charset="SJIS">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>�ԓ����o�^</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="�����ɃT�C�g���������܂�">
<meta name="keywords" content="�L�[���[�h�P,�L�[���[�h�Q,�L�[���[�h�R,�L�[���[�h�S,�L�[���[�h�T">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/fixmenu_pagetop.css">
<script type="text/javascript" src="js/openclose.js"></script>
<script type="text/javascript" src="js/fixmenu_pagetop.js"></script>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
	
<style>
	header{
		height:0.1%;
	}
    input{
        background-color:blanchedalmond;
    }
    textarea{
        background-color:rgb(216, 209, 178);
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(function(){
$('a[href^="#"]').click(function() {
var speed = 800;
var href= $(this).attr("href");
var target = $(href == "#" || href == "" ? 'html' : href);
var position = target.offset().top;
$('body,html').animate({scrollTop:position}, speed, 'swing');
return false;
});
});
</script>
</head>



<body>

<header >
		
<h1 id="logo"><a href="postthread.jsp"><img src="images/logo1.png" alt="Sample Site"></a></h1>
<!--PC�p�i801px�ȏ�[���j���j���[-->
<nav id="menubar">
<ul>
<li id="menu1"><a href="addthread"><img src="images/menu_about1.png" alt="���T�C�g�ɂ���"></a></li>
<li id="menu2"><a href="�ԓ����o�^.html"><img src="images/menu_gallery.png" alt="�M�������["></a></li>
<li id="menu3"><a href="#link"><img src="images/menu_link.png" alt="�����N"></a></li>
<li id="menu4"><a href="#"><img src="images/menu_instagram.png" alt="�C���X�^�O����"></a></li>
</ul>
</nav>
</header>

<div class="contents bg4"><!--contents�u���b�N�J�n����������������������������������������������������������������������������������������������������-->

<section>

<h2>Read Me<span></span></h2>
<h3>���e����ԓ�����</h3>
	<form method='post' action='addthread'>
	���[�U�[��:<br>
	title:<br>
	
	���e���F<br>
	
	����F<br>
	
	�I��1�F  <input type='submit' value="�x������"><br>  
    �I��2�F  <input type='submit' value="�x������"><br>
    ���e�F<br>
     <textarea name='content'  cols="50" rows="5"></textarea><br>
     <input type='submit' value="�ԓ�"><br>
    </form>

</section>

</body>


