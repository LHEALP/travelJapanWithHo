package ho.comment;

import java.sql.Timestamp;

public class CommentDataBean {

	private int id;
	private int itemID;
	private String writer;
	private String passwd;
	private String ip;
	
	private Timestamp reg_date;
	
	private String content;
	private boolean voteKor;
	private boolean voteJpn;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getItemID() {
		return itemID;
	}
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isVoteKor() {
		return voteKor;
	}
	public void setVoteKor(boolean voteKor) {
		this.voteKor = voteKor;
	}
	public boolean isVoteJpn() {
		return voteJpn;
	}
	public void setVoteJpn(boolean voteJpn) {
		this.voteJpn = voteJpn;
	}
}
