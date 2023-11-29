package company;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Company;
import dao.CompanyDAO;

public class Register_comanyAction {
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	) throws Exception {

		HttpSession session=request.getSession();
		//氏名
		String name=request.getParameter("name");
		//企業名
		String company_name=request.getParameter("company_name");
		//所在地
		String address=request.getParameter("address");
		//メールアドレス
		String email=request.getParameter("email");
		//電話番号
		String phone_number=request.getParameter("phone_number");
		//パスワード
		String password=request.getParameter("password");
		//パスワード(確認)
		String password2=request.getParameter("password2");

		//パスワードが一致した場合
		if (password==password2) {

			//追加日時
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = simpleDateFormat.format(date);
			java.sql.Date add_date = java.sql.Date.valueOf(formattedDate);

			CompanyDAO dao=new CompanyDAO();
			Company company=dao.register(name, company_name, address, email, phone_number, password, add_date);

			// 入力した情報に合致する企業が見つからなかった場合、属性名companyで登録する
			if (company==null) {
				session.setAttribute("company", company);
				// company_top_page.jspをフォワード先に指定
				return "company_top_page.jsp";
			}else{
				//エラーのアラートを表示


				// company_registration.jspをフォワード先に指定
				return "company_registration.jsp";
			}

		//パスワードが一致しない場合
		}else{
			// エラーアラートを表示

			// company_registration.jspをフォワード先に指定
			return "company_registration.jsp";
		}
	}
}
