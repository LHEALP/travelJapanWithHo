<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "ho.item.ItemDBBean" %>
<%@ page import = "ho.item.ItemDataBean" %>
<%@ page import = "ho.comment.CommentDBBean" %>
<%@ page import = "ho.comment.CommentDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.text.DecimalFormat" %>
<%@ page import = "java.util.List" %>

<%

int id = Integer.parseInt(request.getParameter("id"));

SimpleDateFormat sdfItem = new SimpleDateFormat("yyyy-MM-dd HH:mm");
SimpleDateFormat sdfComment = new SimpleDateFormat("MM-dd HH:mm");

int count = 0;
List<CommentDataBean> articleCommentList = null;

try{
	ItemDBBean dbPro = ItemDBBean.getInstance();
	ItemDataBean article = dbPro.getArticle(id);

	CommentDBBean commentdbPro = CommentDBBean.getInstance();
	count = commentdbPro.getArticleCount(id);
	
	if(count>0){
		articleCommentList = commentdbPro.getArticles(id);
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=article.getTitle() %></title>
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
	<div style="width: 50%; margin-left: auto; margin-right: auto;">
		<h5 align="center"><%=article.getTitle() %></h5>
			<img src=<%=article.getImg() %> style="width:400px; height:auto; display: block; margin-left: auto; margin-right: auto"><br><br>
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
			<div align="right">
			<%=article.getWriter() %>&nbsp;&nbsp;&nbsp;
			<%=sdfItem.format(article.getReg_date()) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			조회수  <%=article.getReadCount() %>
			</div>
	<br/>
	
	<%
	}catch(Exception e){}
	// item 끝
	%>
	
	<table class="table table-striped">
	<%
	// comment 시작
	if(count>0){
		for(int i=0; i<articleCommentList.size(); i++){
			CommentDataBean articleComment = articleCommentList.get(i);		
	%>
			<tr>
				<td><b><%=articleComment.getWriter() %></b> (<%=articleComment.getId() %>) &nbsp;&nbsp;&nbsp; <%=sdfComment.format(articleComment.getReg_date()) %> &nbsp;&nbsp; <%=articleComment.getIp() %><br/><%=articleComment.getContent() %></td>
			</tr>			
	<%
		}
	}
	else if(count==0){
	%>
			<tr>
				<td>아직 댓글이 없습니다!</td>
			</tr>		
	<%
	}
	//comment 끝
	%>	
	</table>
		

		<hr/>
	
		<div class="text-center">
			<ul class="pagination" style="justify-content: center;">
				<li class="page-item"><a class="page-link" href="#"><</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">></a></li>
			</ul>
		</div>

	<form method="post" name="commentform" action="addCommentPro.jsp">
	<div class="form-row align-items-center">
		<% 
		String strID = Integer.toString(id);
		%>
		<input type="hidden" id="itemID" name="itemID" value="<%=strID %>">
		<div class="col-auto">
			<input type="text" name="writer" class="form-control form-control-sm" placeholder="아이디">
		</div>
		<div class="col-auto">
			<input type="password" name="passwd" class="form-control form-control-sm" placeholder="비밀번호">
		</div>
		<div class="col-auto">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-primary">
					<input type="radio" name="vote" value="1" id="selKR" >가능
				</label>
				<label class="btn btn-danger">
					<input type="radio" name="vote" value="0" id="selJP" >불가능
				</label>
			</div>
		</div>
	</div>
	
	<textarea class="form-control" name="content" placeholder="의견을 작성해주세요"></textarea>

	<button type="submit" class="btn btn-primary float-right">등록</button>
	
	</form>
	</div>	
</section>
<br/><br/>
<hr/>

<footer>이용약관 / 개인정보취급정책</footer>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>