package Java_mysql_erp;

import java.sql.Connection;

import Java_mysql_erp.util.jdbcUtil;

public class ConnectionTset {

	public static void main(String[] args) {
		Connection con = jdbcUtil.getConnection();
		System.out.println(con);

	}

}
