<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>정보게시판 > 글쓰기</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="../resources/css/community_jeh/community_jeh.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function() {
			$('#textarea-box').on('keyup', function() {
				$('#textarea-cnt').html("(" + $(this).val().length + " / 200)");
				
				if($(this).val().length > 200) {
					$(this).val($(this).val().substring(0, 200));
					$('#textarea-cnt').html("(200 / 200)");
				}
			});
		});
    </script>
</head>
<body>
    <!-- 헤더 -->
   	<div id="header-jeh">
       	<%@ include file="../header_lhj/header.jsp" %>
    </div>
    
    <div class="wrapper">
        <!-- 왼쪽 메뉴바 -->
        <div>
            <div class="left-menu">
                <ul class="left-menu-ul">
                    <li class="menu-list"><a href=""><i class="fa-solid fa-download"></i>받은쪽지함</a></li>
                    <li class="menu-list"><a href=""><i class="fa-solid fa-upload"></i>보낸쪽지함</a></li>
                </ul>
            </div>

            <!-- 쪽지 글쓰기 본문 -->
            <div class="main-board">
                <!-- 쪽지함 > 글쓰기 -->
                <div>
                    <section class="content-first">
                            <p class="write-detail">쪽지함 > 쪽지보내기</p>
                    </section>
                </div>
                <!-- 쪽지 보내기 본문 -->
                <div>
                    <textarea id="textarea-box" class="textarea-box" placeholder="내용을 입력해 주세요!" required></textarea>
	                <div id="textarea-cnt">(0 / 200)</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>