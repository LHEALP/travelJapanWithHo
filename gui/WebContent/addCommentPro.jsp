<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "ho.comment.CommentDBBean" %>
<%@ page import = "ho.item.ItemDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8"); %>


<jsp:useBean id="articleComment" scope="page" class="ho.comment.CommentDataBean">
	<jsp:setProperty name="articleComment" property="*"/>
</jsp:useBean>

<%
int itemID = Integer.parseInt(request.getParameter("itemID"));
articleComment.setItemID(itemID);
articleComment.setReg_date(new Timestamp(System.currentTimeMillis()));
articleComment.setIp(request.getRemoteAddr());


// 투표 처리
int vote = Integer.parseInt(request.getParameter("vote"));

boolean voteKor = false;
boolean voteJpn = false;
int country = 0;

if(vote==0){
	voteJpn = true;
	country = 0;
}
else{
	voteKor = true;
	country = 1;
}

// 항목에 투표수 반영
ItemDBBean dbPro = ItemDBBean.getInstance();
dbPro.insertVoteArticle(itemID, country);

// 댓글별 투표국가 반영
articleComment.setVoteKor(voteKor);
articleComment.setVoteJpn(voteJpn);

CommentDBBean commentdbPro = CommentDBBean.getInstance();
commentdbPro.insertArticle(articleComment);

//
String url = "content.jsp?id=" + request.getParameter("itemID");
response.sendRedirect(url);

%>