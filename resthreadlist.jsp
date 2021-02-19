<%@ page pageEncoding="Windows-31J"
	contentType="text/html;charset=Windows-31J" %>

<%--JSTL 1.1.2 core �^�O���C�u����--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ja">
<head>
<meta charset="SJIS">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>���e�ɕԓ��ꗗ</title>
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

<script>
function getRandom(){
    return Math.Random();
}
</script>
</head>



<body>

<header >
<h1 id="logo"><a href="postthread.jsp"><img src="images/logo1.png" alt="Sample Site"></a></h1>
<!--PC�p�i801px�ȏ�[���j���j���[-->
<nav id="menubar">
<ul>
<li id="menu1"><a href="addthread"><img src="images/menu_about1.png" alt="���T�C�g�ɂ���"></a></li>
<li id="menu2"><a href="#gallery"><img src="images/menu_gallery.png" alt="�M�������["></a></li>
<li id="menu3"><a href="#link"><img src="images/menu_link.png" alt="�����N"></a></li>
<li id="menu4"><a href="#"><img src="images/menu_instagram.png" alt="�C���X�^�O����"></a></li>
    
</ul>
</nav>
</header>
        
<div class="contents bg2">
 <section>
<h2>Read Me</h2>        

<h3>���e��</h3>
   <table border="1">
        <tr><td>${data.name}</td><td>${data.time}</td></tr>
	    <tr><td>${data.title}</td><td>${data.content}</td></tr>
	    <tr><td>${data.question}</td><td>${data.choice1}</td><td>${data.choice2}</td></tr>
	</table>

	<h1>�W�v</h1>
	${data.choice1}�F${agreement}<br>
    ${data.choice2}�F${disagreement}<br>
	<div style="width: 300px;">
    <canvas id="chart" width="150" height="150"></canvas>
    </div>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
	<script>
        var ctx = $('#chart');
        var mychart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: [
                    '${data.choice1}',
                    '${data.choice2}',
                ],
                datasets: [{
                    label: '�T���v���O���t',
                    data: [
                    	${agreement},
                        ${disagreement},
                    ],
                    backgroundColor: [
                        'rgba(241, 107, 141, 1)',
                        'rgba( 31, 167, 165, 1)',
                        'rgba(249, 199,  83, 1)',
                        'rgba(176, 110,  30, 1)',
                        'rgba(124,  91, 164, 1)'
                    ]
                }]
            },
            options: {
                legend: {
                    position: 'bottom',
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            display: false,
                            beginAtZero: true,
                        },
                        gridLines: {
                            display: false
                        }
                    }]
                }
            }
        });
    </script>

    <h1>�V�K��������</h1>
	<form method='post' action='resthread'>
    <input type='hidden' name='reid' value='${data.id}'>
	���[�U�[��:<br>
	<input type='text' name='rename' placeholder="NONAME"><br>
	���e���F<br>
	<textarea name='recontent' placeholder="������ɓ��e�����L��" cols="50" rows="5"></textarea><br>
	�ǂ���Ɏ^�����H:<br>
	<input type='radio' name='revoting' value='1' checked="checked">${data.choice1}<br>
	<input type='radio' name='revoting' value='2' >${data.choice2}<br>
	<input type='submit' value='�o�^'>
	</form>

    <h1>���e�ꗗ</h1>
	<table border="1">
		<c:forEach var="resdata" items="${resdatabase}">
			<tr><td>${resdata.number}</td><td>${resdata.name}</td><td>${resdata.time}</td></tr>
			<tr><td colspan="3">${resdata.content}</td></tr>
			<tr><td colspan="3">${resdata.voting == "1" ? data.choice1:data.choice2}</td></tr>
			<br>
		</c:forEach>
    </table>

</section>
        
</body>
</html>
        
        
        