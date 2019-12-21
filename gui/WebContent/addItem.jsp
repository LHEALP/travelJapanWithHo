<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호날두랑 일본여행 항목 추가</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

<header>

<a href="index.jsp">
<img src="img/newlogo.PNG" style="width: 300px; height: auto;">
</a>
   <div class="container">
      <form>
         <div style="width: 50%; margin-left: auto; margin-right: auto;">
            <div class="input-group mb-3">
               <input type="text" class="form-control" id="serach" placeholder="검색">
               <div class="input-group-append">
                  <button type="submit" class="btn btn-light">검색</button>
               </div>
            </div>
         </div>
      </form>
   </div>
</header>

<div class="container nav justify-content-center">
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="collapse navbar-collapse" id="navbarMenu">
         <div class="navbar-nav">
            <a class="nav-item nav-link active" href="#">전체</a>
            <a class="nav-item nav-link active" href="#">생활</a>
            <a class="nav-item nav-link active" href="#">음식</a>
            <a class="nav-item nav-link active" href="#">가전</a>
            <a class="nav-item nav-link active" href="#">화장품</a>
            <a class="nav-item nav-link active" href="#">의약품</a>
            <a class="nav-item nav-link active" href="#">패션</a>
            <a class="nav-item nav-link active" href="#">취미</a>
            <a class="nav-item nav-link active" href="#">자동차</a>
            <a class="nav-item nav-link active" href="#">금융</a>
            <a class="nav-item nav-link active" href="#">기타</a>
         </div>
      </div>
   </nav>
</div>

<hr/>

<section>
   <div style="width: 40%; margin-left: auto; margin-right: auto;">
   <h4 align="center">항목 추가하기</h4><br/>

   <form method="post" name="itemform" action="addItemPro.jsp">
      <div class="form-group font-weight-bold">
         <label for="formTitle">제목</label>
         <input type="text" id="formTitle" name="title" class="form-control form-control-sm" placeholder="제목"><br/>
      </div>
      <div class="form-group font-weight-bold">
         <label for="formImg">이미지</label>
         <input type="text" id="formImg" name="img" class="form-control form-control-sm" placeholder="img/파일명.확장자 형식으로 작성할 것"><br/>
      </div>
      <div class="form-group font-weight-bold">
         <label for="formContent">내용</label>
         <input type="text" id="formContent" name="content" class="form-control form-control-sm" placeholder="내용"><br/>
      </div>
      <div class = "row">
          <div class="col font-weight-bold">
              <label for="formWriter">작성자</label>
              <input type="text" id="formWriter" name="writer" class="form-control form-control-sm"  placeholder="작성자"><br/>
          </div>
          <div class="col font-weight-bold">
             <label for="formpasswd">비밀번호</label>
             <input type="password" id="formpasswd" name="passwd" class="form-control form-control-sm" placeholder="비밀번호"><br/>
          </div>
      </div>
      <input type="submit" class="btn btn-primary float-right" value="등록"><br><br>
   </form>
</div>
</section>

<hr/>

<footer>이용약관 / 개인정보취급정책</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

</body>
</html>