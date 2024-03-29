/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Servlets;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

 static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
       static final String DB_URL = "jdbc:mysql://localhost:3306/stokenvartersatis?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
    static final String USER = "root";
    static final String PASS = "root";
    Connection dbConnection = null;

    @Override
    public void init() throws ServletException {
        super.init();
        connectDB();
    }
    void connectDB(){
        try {
            Class.forName(JDBC_DRIVER);
            dbConnection = DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("loginPage.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            response.sendRedirect(request.getRequestURI());
        }
        Statement stmt;
        try {
            if(dbConnection==null)
                connectDB();
            stmt = dbConnection.createStatement();

            String sql;
            sql = "SELECT * FROM user WHERE email='" + email+"'";
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            String dbPass = rs.getString("password");
            if (dbPass.equals(password)) {
                session.setAttribute("UserName",rs.getString(4));
                session.setAttribute("UserId",rs.getString(1));
                session.setAttribute("UserEmailInfo",rs.getString(2));
                session.setAttribute("UserPhoneInfo",rs.getString(5));
                session.setAttribute("Userpas",rs.getString(3));
                String type = rs.getString(6);
                if(type.equals("2")) {
                                    session.setAttribute("sessionType","admin");
                }
                else {
                            session.setAttribute("sessionType","kullanici");

                }
                // cookieler
                 Cookie userCookieUserName = new Cookie("USER_NAME", rs.getString(4));
                 Cookie userCookieUserId = new Cookie("USER_ID", rs.getString(1));
                 Cookie userCookieUserEmail = new Cookie("USER_EPOSTA", rs.getString(2));
                 
               
                  String SQL_QUERY = "SELECT COUNT(*) as rowcount FROM depo";
                       Statement statementProduct1=null;
                       ResultSet rs2 = null;
                       statementProduct1 = dbConnection.createStatement();
                       rs2 = statementProduct1.executeQuery(SQL_QUERY);
                        while(rs2.next()) {
                  int count = rs2.getInt("rowcount");
                                             Cookie userCookieUserDepoCount = new Cookie("DepoSayisi", String.valueOf(count));
                                             userCookieUserDepoCount.setMaxAge(1000000);
                                             response.addCookie(userCookieUserDepoCount);
                        }
                 
                 
                 
                 
                 
                 
                userCookieUserEmail.setMaxAge(1000000);
                response.addCookie(userCookieUserEmail);
                response.sendRedirect("anasayfa.jsp");
            } else {
                session.setAttribute("error", "Kullanıcı Bulunamadı");
                dispatcher = request.getRequestDispatcher("loginPage.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (dispatcher != null) {
            dispatcher.forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }}

