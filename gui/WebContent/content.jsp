<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨텐츠</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

<header>

<img src="img/logo.PNG" width="100" height="50">

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
		<h5 align="center">한국제품 vs 일본제품</h5>
		<img src="img/product.PNG" width="600" height="300" style="display: block; margin-left: auto; margin-right: auto">
		<div class="progress">
			<div class="progress-bar" role="progressbar" style="width:52%">52%</div>
			<div class="progress-bar bg-danger" role="progressbar" style="width:48%">48%</div>
		</div>
	
	<br/>
	
		<table class="table table-striped">
			<tr>
				<td>황세웅 2019.11.30 19:30 <br/>아 이건 대체 불가능하지</td>
			</tr>
			<tr>
				<td>심재현 2019.11.30 19:30 <br/>님 매국노임?</td>
			</tr>
			<tr>
				<td>황세웅 2019.11.30 19:30 <br/>아 이건 대체 불가능하지</td>
			</tr>
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

	<form>
	<div class="form-row align-items-center">
		<div class="col-auto">
			<input type="text" class="form-control form-control-sm" placeholder="아이디">
		</div>
		<div class="col-auto">
			<input type="password" class="form-control form-control-sm" placeholder="비밀번호">
		</div>
		<div class="col-auto">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-primary">
					<input type="radio" name="options" id="selKR" autocomplete="off">가능
				</label>
				<label class="btn btn-danger">
					<input type="radio" name="options" id="selJP" autocomplete="off">불가능
				</label>
			</div>
		</div>
	</div>
	
	<textarea class="form-control" placeholder="의견을 작성해주세요"></textarea>
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