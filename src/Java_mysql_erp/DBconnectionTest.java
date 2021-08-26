package Java_mysql_erp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DBconnectionTest {

	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/erp?useSSL=false";
		String user = "user_erp";
		String password = "root";
		
		String sql = "select code, name form title";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//1. jdbc 드라이버로딩
			Class.forName("com.mysql.jdbc.Driver");
			//2.데이터베이스 커넥션 생성
			 con = DriverManager.getConnection(url, user, password);
			System.out.println("데이터베이스 접속 성공");
			//3.statement 생성
			pstmt = con.prepareStatement(sql);
			//4.쿼리 실행
			 rs = pstmt.executeQuery();
			 //5.쿼리 결과 출력
			 while(rs.next()) {
				 System.out.println("결과");
				 int code = rs.getInt("code");
				 String name = rs.getString("name");
				 System.out.printf("%04d %s%n", code, name);
			 }
		}catch (ClassNotFoundException e) {
			System.out.println("JDBC Library를 추가하세요.");
		} catch (SQLException e) {
			System.out.println("url 혹은 user, password 확인하세요.");
		}finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		

	}

}
