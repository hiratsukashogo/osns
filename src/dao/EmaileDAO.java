package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Email;

//ユーザのメール情報を取得
public class EmaileDAO extends DAO {
	public List<Email> selectuser(int id)throws Exception{
		List<Email> user_maile = new ArrayList<>();
		Connection con=getConnection();
//		ユーザーの情報取得
		PreparedStatement st=con.prepareStatement(
				"select * from email where sender = ? and flag = 0 ");
//		idset
		st.setInt(1, id);
//		SQL実行
		ResultSet rs=st.executeQuery();
		while (rs.next()) {
			Email p=new Email();
			p.setEmail_id(rs.getInt("email_id"));
			p.setSender(rs.getInt("sender"));
			p.setSubject(rs.getString("subject"));
			p.setBody(rs.getString("body"));
			user_maile.add(p);
			}
		st.close();
		con.close();
		return user_maile;

	}

//	受信者のメッセージ取得
	public Email select_recipient(int id)throws Exception{
		List<Email>recipient_maile = new ArrayList<>();
		Connection con=getConnection();
//		受信者の情取得
		PreparedStatement st=con.prepareStatement(
				"select * from email where sender = ? and flag = 0 ");
//		idset
		st.setInt(1, id);
//		SQL実行
		ResultSet rs=st.executeQuery();
		while (rs.next()) {
			Email p=new Email();
			p.setEmail_id(rs.getInt("email_id"));
			p.setSender(rs.getInt("sender"));
			p.setSubject(rs.getString("subject"));
			p.setBody(rs.getString("body"));
			recipient_maile.add(p);
			}
		st.close();
		con.close();
		return (Email) recipient_maile;

	}

//	メッセージ削除
	public boolean emaile_del(int email_id, int user_id)throws Exception{
		Connection con=getConnection();
		byte flag = 1;
		PreparedStatement st=con.prepareStatement(
				"update email set flag = ?,where email_id = ? and sender = ?");
		st.setInt(1, flag);
		st.setInt(2, email_id);
		st.setInt(3, user_id);
		st.executeUpdate();
		st.close();
		con.close();
		return true;
	}


}
