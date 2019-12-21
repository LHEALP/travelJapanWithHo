package ho.item;

import java.sql.Timestamp;

public class ItemDataBean {

	private int id;
	private String writer;
	private String passwd;
	private String ip;
	
	private int readCount;
	private Timestamp reg_date;
	
	private String title;
	private String img;
	private String content;
	private int voteKor;
	private int voteJpn;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getVoteKor() {
		return voteKor;
	}
	public void setVoteKor(int voteKor) {
		this.voteKor = voteKor;
	}
	public int getVoteJpn() {
		return voteJpn;
	}
	public void setVoteJpn(int voteJpn) {
		this.voteJpn = voteJpn;
	}
}
