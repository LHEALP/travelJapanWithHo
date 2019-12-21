package ho.item;

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


public class ItemDBBean {

	private static ItemDBBean instance = new ItemDBBean();
	
	public static ItemDBBean getInstance() {
		return instance;
	}
	
	private ItemDBBean() {}
	
	private Connection getConnection() throws Exception{
		
		
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/ho");
		
		return ds.getConnection();
	}
	
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ho?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");
			
			
			pstmt = conn.prepareStatement("select count(*) from item");
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
	
	// 항목 작성하기
	public void insertArticle(ItemDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			//conn = getConnection();		
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ho?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");
			
			sql = "insert into item(writer,passwd,ip,reg_date,title,img,content,voteKor,voteJpn) values(?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getPasswd());
			pstmt.setString(3, article.getIp());
			pstmt.setTimestamp(4, article.getReg_date());
			pstmt.setString(5, article.getTitle());
			pstmt.setString(6, article.getImg());
			pstmt.setString(7, article.getContent());
			pstmt.setInt(8, article.getVoteKor());
			pstmt.setInt(9, article.getVoteJpn());

			
			pstmt.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	// 투표 처리
	public void insertVoteArticle(int id, int country) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {	
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ho?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");
			
			if(country==1) {
				pstmt = conn.prepareStatement("update item set voteKor=voteKor+1 where id=?");
			}
			else {
				pstmt = conn.prepareStatement("update item set voteJpn=voteJpn+1 where id=?");
			}
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	// 항목 여러개 가져오기
	public List<ItemDataBean> getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ItemDataBean> articleList = null;
		
		try {	
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ho?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");
			
			
			pstmt = conn.prepareStatement("select * from item order by id desc limit ?,?");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articleList = new ArrayList<ItemDataBean>(end);
				
				do {
					ItemDataBean article = new ItemDataBean();
					
					article.setId(rs.getInt("id"));
					article.setWriter(rs.getString("writer"));
					article.setPasswd(rs.getString("passwd"));
					article.setIp(rs.getString("ip"));
					article.setReadCount(rs.getInt("readCount"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setTitle(rs.getString("title"));
					article.setImg(rs.getString("img"));
					article.setContent(rs.getString("content"));
					article.setVoteKor(rs.getInt("voteKor"));
					article.setVoteJpn(rs.getInt("voteJpn"));
					
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
	
	
	// 항목 가져오기
	public ItemDataBean getArticle(int id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ItemDataBean article = null;
		
		try {
			//conn = getConnection();
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ho?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");
			
			pstmt = conn.prepareStatement("update item set readCount=readCount+1 where id=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select * from item where id=?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new ItemDataBean();
				article.setId(rs.getInt("id"));
				article.setWriter(rs.getString("writer"));
				article.setPasswd(rs.getString("passwd"));
				article.setIp(rs.getString("ip"));
				article.setReadCount(rs.getInt("readCount"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setTitle(rs.getString("title"));
				article.setImg(rs.getString("img"));
				article.setContent(rs.getString("content"));
				article.setVoteKor(rs.getInt("voteKor"));
				article.setVoteJpn(rs.getInt("voteJpn"));
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
