package app.helpers;

import java.sql.Connection;
import java.sql.SQLException;

import net.minidev.json.JSONObject;

import java.sql.DriverManager;
import java.sql.ResultSet;

public class DbHandler {

    // Not sure if connection string password is necessary
    private static String connectionUrl = "jdbc:mysql://localhost:3306/Pubs;username=root";
    // "jdbc:mysql://localhost:3306;database=Pubs;user=root";
    
    public static void addNewJobWithName(String jobName) {
        try(Connection connection = DriverManager.getConnection(connectionUrl)) {
            connection.createStatement().execute("insert into Pubs.jobs (job_desc, min_lvl, max_lvl) values ('"+jobName+"', 50, 100)");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static JSONObject getMinAndMaxLevelForJob(String jobName) {
        JSONObject json = new JSONObject();

        try(Connection connection = DriverManager.getConnection(connectionUrl)) {
            ResultSet resultSet = connection.createStatement().executeQuery("select min_lvl, max_lvl FROM Pubs.jobs where job_desc='"+jobName+"'");
            resultSet.next();
            json.put("min_lvl", resultSet.getString("min_lvl"));
            json.put("max_lvl", resultSet.getString("max_lvl"));
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return json;   
    }
}