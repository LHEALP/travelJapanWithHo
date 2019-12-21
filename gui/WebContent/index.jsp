<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "ho.item.ItemDBBean" %>
<%@ page import = "ho.item.ItemDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.text.DecimalFormat" %>

<%!
int pageSize = 5;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>

<%

//String pageNum = request.getParameter("pageNum");

//if(pageNum == null)
//	pageNum = "1";

int pageNum = 1;

int currentPage = pageNum;
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;
int count = 0;
int number = 0;

List<ItemDataBean> articleList = null;

ItemDBBean dbPro = ItemDBBean.getInstance();
count = dbPro.getArticleCount();

if(count>0){
	articleList = dbPro.getArticles(startRow, 100);
}

number = count-(currentPage-1)*pageSize;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호날두랑 일본여행</title>
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
				<a class="nav-item nav-link active" onclick="location.href='index.jsp' ">전체</a>
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

<button type="button" class="btn btn-primary float-right" onclick="location.href='addItem.jsp' ">항목 추가</button><br><br>
<hr/>

<div class="container">
<div class="card-columns">
<%

for(int i=0; i<articleList.size(); i++){
	ItemDataBean article = articleList.get(i);
	
	%>
	
	<a href="content.jsp?id=<%=article.getId() %> " style="a:link{color:black; text-decoration: none;}">
	
	<div class="card">
		<img src=<%=article.getImg() %> class="card-img-top">
		<div class="card-body">
			<h5 class="card-title"><%=article.getTitle() %></h5>
			<p class="card-text"><%=article.getContent() %></p>
			<%
				int voteCnt = article.getVoteKor() + article.getVoteJpn();
				float korRate = 0;
				float jpnRate = 0;
				String strKorRate = "0";
				String strJpnRate = "0";
				
				if(voteCnt==0){
					korRate = 50;
					jpnRate = 50;
				}
				else{
					korRate = (float)article.getVoteKor() / voteCnt * 100;
					jpnRate = (float)article.getVoteJpn() / voteCnt * 100;
					
					DecimalFormat format = new DecimalFormat(".#");
					strKorRate = format.format(korRate);
					strJpnRate = format.format(jpnRate);
				}	
				
			%>
			<div class="progress">
				<div class="progress-bar" role="progressbar" style="width:<%=korRate %>%"><%=strKorRate %>%</div>
				<div class="progress-bar bg-danger" role="progressbar" style="width:<%=jpnRate %>%"><%=strJpnRate %>%</div>
			</div>
		</div>
	</div>
	</a>
	
<%
}
%>
</div>
</div>

<hr/>

<footer>이용약관 / 개인정보취급정책</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>