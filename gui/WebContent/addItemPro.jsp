<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "ho.item.ItemDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="article" scope="page" class="ho.item.ItemDataBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%

article.setReg_date(new Timestamp(System.currentTimeMillis()));
article.setIp(request.getRemoteAddr());

ItemDBBean dbPro = ItemDBBean.getInstance();
dbPro.insertArticle(article);

response.sendRedirect("index.jsp");

%>