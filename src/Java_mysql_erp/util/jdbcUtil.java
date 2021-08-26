package Java_mysql_erp.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class jdbcUtil {

	public static Connection getConnection() {
		Connection con = null;
		String propPath = "mysql_db.properties";

		Properties props = new Properties();
		try (InputStream is = ClassLoader.getSystemResourceAsStream(propPath)) {
			props.load(is);
			String url = props.getProperty("url");

			con = DriverManager.getConnection(url, props);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

}
