<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>JDBC test</title>
</head>
<body>
    <%
    String dbName = application.getInitParameter("dbName");
    String dbUser = application.getInitParameter("dbUser");
    String dbPass = application.getInitParameter("dbPass");
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbName, dbUser, dbPass);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from books");
    %>
    
    <table border="1">
        <% 
        ResultSetMetaData resMetaData = rs.getMetaData();
        int nCols = resMetaData.getColumnCount();
        %>
        <tr>
            <% 
            for (int kCol = 1; kCol <= nCols; kCol++) {
                out.print("<td><b>" + resMetaData.getColumnName(kCol) + "</b></td>");
            }
            %>
        </tr>
        
        <% 
        while (rs.next()) {
        %>
            <tr>
                <% 
                for (int kCol = 1; kCol <= nCols; kCol++) {
                    out.print("<td>" + rs.getString(kCol) + "</td>");
                }
                %>
            </tr>
        <% 
        } 
        %>
    </table>
    
    <% 
    conn.close();
    %>
</body>
</html>