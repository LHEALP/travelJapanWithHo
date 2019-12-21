package ho.comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CommentDBBean {

	private static CommentDBBean instance = new CommentDBBean();
	
	public static CommentDBBean getInstance() {
		return instance;
	}
	
	private CommentDBBean() {}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/ho");
		
		return ds.getConnection();
	}
	
	// 개수
	public int getArticleCount(int itemID) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ho?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");
			
			
			pstmt = conn.prepareStatement("select count(*) from comment where itemID=?");
			pstmt.setInt(1, itemID);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				x = rs.getInt(1);			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return x;
	}
	
	
	// 댓글 작성하기
	public void insertArticle(CommentDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ho?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");		
			
			sql = "insert into comment(itemID,writer,passwd,ip,reg_date,content,voteKor,voteJpn) values(?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article.getItemID());
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getPasswd());
			pstmt.setString(4, article.getIp());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setString(6, article.getContent());
			pstmt.setBoolean(7, article.isVoteKor());
			pstmt.setBoolean(8, article.isVoteJpn());
			
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	// 댓글 여러개 가져오기
	public List<CommentDataBean> getArticles(int itemID) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<CommentDataBean> articleList = null;
		
		try {	
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ho?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");
			
			
			pstmt = conn.prepareStatement("select * from comment where itemID=?");
			pstmt.setInt(1, itemID);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articleList = new ArrayList<CommentDataBean>();
				
				do {
					CommentDataBean article = new CommentDataBean();
					
					article.setId(rs.getInt("id"));
					article.setItemID(rs.getInt("itemID"));
					article.setWriter(rs.getString("writer"));
					article.setPasswd(rs.getString("passwd"));
					article.setIp(rs.getString("ip"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setContent(rs.getString("content"));
					article.setVoteKor(rs.getBoolean("voteKor"));
					article.setVoteJpn(rs.getBoolean("voteJpn"));
					
					articleList.add(article);
				}while(rs.next());
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return articleList;
	}
	
	
	// 댓글 가져오기
	public CommentDataBean getArticle(int id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommentDataBean article = null;
		
		try {
			conn = getConnection();		
			
			pstmt = conn.prepareStatement("select * from comment where id=?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new CommentDataBean();
				article.setId(rs.getInt("id"));
				article.setItemID(rs.getInt("itemID"));
				article.setWriter(rs.getString("writer"));
				article.setPasswd(rs.getString("passwd"));
				article.setIp(rs.getString("ip"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setContent(rs.getString("content"));
				article.setVoteKor(rs.getBoolean("voteKor"));
				article.setVoteJpn(rs.getBoolean("voteJpn"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return article;
	}
	
	
}
