package com.Servlets;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


public class AdminServlet extends HttpServlet {

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

    void connectDB() {
        try {
            Class.forName(JDBC_DRIVER);
            dbConnection = DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
   

 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
           String action = request.getParameter("depo");
        if (action==null) action="";
        switch (action) {
            case "depoekleme":
                depoekleme(request, response);
                break;
                  case "urunekleme":
                urunekleme(request, response);
                break;
            default:
                break;
        }
    }

   
 
 private void depoekleme(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
            
            String depoAdi = request.getParameter("depoAdi");           
            String depoAciklama = request.getParameter("depoAciklama");
            String depoTur = request.getParameter("depoTur");

             try {
            if (dbConnection == null) {
                connectDB();

            }
            PreparedStatement stmt = dbConnection.prepareStatement("INSERT INTO depo (depoAdi,depoAciklama,depoTur) VALUES (?,?,?)");
            stmt.setString(1, depoAdi);
            stmt.setString(2, depoAciklama);
            stmt.setInt(3, Integer.parseInt(depoTur));
            int row = stmt.executeUpdate();
            stmt.close();
            if (row > 0) {
                      if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("DepoSayisi")) {
                   String nowCookieValue= cookie.getValue();
                   int nowValueInt = Integer.parseInt(nowCookieValue);
                   nowValueInt++;
                   cookie.setValue(String.valueOf(nowValueInt));
                   response.addCookie(cookie);
                }
            }
        }
                
                
                
                
                System.out.println("Depo Kaydedildi");
                HttpSession session = request.getSession();
                 session.setAttribute("msgdepo","Depo Başarıyla Eklendi");
                      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/depoekle.jsp");
            dispatcher.forward(request, response);   
            } 
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("depoekle.jsp");
        }
    }

 
 
 private void urunekleme(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
            String urunAdi = request.getParameter("urunAdi");           
            String urunAciklama = request.getParameter("urunAciklama");
            String urunDepo = request.getParameter("urunDepo");
            String urunFiyat = request.getParameter("urunFiyat");
                        int urunStok = Integer.parseInt(request.getParameter("urunStok"));
             String urunDurum="";           
                        if(urunStok==0) {
                             urunDurum="0";
                        }
                        else {
                             urunDurum ="1";
                        }
             String urunEklenmeTarihi="1111";
             
             try {
            if (dbConnection == null) {
                connectDB();

            }
            PreparedStatement stmt = dbConnection.prepareStatement("INSERT INTO urun (urunAdi,urunAciklama,urunDepo,urunFiyat,urunEklenmeTarihi,urunDurum,urunStok) VALUES (?,?,?,?,?,?,?)");
            stmt.setString(1, urunAdi);
            stmt.setString(2, urunAciklama);
            stmt.setInt(3,Integer.parseInt(urunDepo) );
            stmt.setString(4, urunFiyat);
            stmt.setString(5, urunEklenmeTarihi);
                      stmt.setString(6, urunDurum);
  stmt.setInt(7, urunStok);
            int row = stmt.executeUpdate();
            stmt.close();
            if (row > 0) {
                System.out.println("Ürün Kaydedildi");
                HttpSession session = request.getSession();
                 session.setAttribute("msgurun","Ürün Başarıyla Eklendi");
                      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/urunekle.jsp");
            dispatcher.forward(request, response);   
            } 
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("urunekle.jsp");
        }
    }

}
