<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.PreparedStatement"%>
<%@page import ="java.util.Date"%>
<%@page import ="java.text.DateFormat"%>
<%@page import ="java.text.ParseException"%>
<%@page import ="java.text.SimpleDateFormat"%>


<%
     String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
       String DB_URL = "jdbc:mysql://localhost:3306/stokenvartersatis?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
              try {
                int userid = Integer.parseInt(request.getParameter("userid"));
                                int urunid = Integer.parseInt(request.getParameter("id"));
                                String toplamTutar="";
                             Connection conn = null;
                            Statement stmt2 = null;
                            ResultSet rs = null;
                            Class.forName(JDBC_DRIVER);
                            conn = DriverManager.getConnection(DB_URL,"root","root");
                                String SQL_QUERY2 = "SELECT * FROM urun where Id='"+urunid+"'";
                       Statement statementProduct2=null;
                       ResultSet rs3 = null;
                       statementProduct2 = conn.createStatement();
                       rs3 = statementProduct2.executeQuery(SQL_QUERY2);
                        while(rs3.next()) {
                        toplamTutar =rs3.getString(5);
                        }
                         Date simdikiZaman = new Date();
                          DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
                        String faturatarih=df.format(simdikiZaman).toString();
                             PreparedStatement stmt = conn.prepareStatement("INSERT INTO fatura (kisiId,urunId,toplamTutar,faturatarih) VALUES (?,?,?,?)");
            stmt.setInt(1, userid);
            stmt.setInt(2, urunid);
            stmt.setString(3,toplamTutar);
                        stmt.setString(4,faturatarih);

            int row = stmt.executeUpdate();
            stmt.close();
            if (row > 0) {
            //stok düşme
int urunStokDurumu=0;
   String SQL_QUERY = "SELECT * FROM urun where Id='"+urunid+"'";
                       Statement statementProduct=null;
                       ResultSet rs2 = null;
                       statementProduct = conn.createStatement();
                       rs2 = statementProduct.executeQuery(SQL_QUERY);
                        while(rs2.next()) {
                        urunStokDurumu =rs2.getInt(8);
                        }
                        urunStokDurumu=urunStokDurumu-1;
String sql="Update urun set urunStok=? where Id='"+urunid+"'";
 PreparedStatement ps = conn.prepareStatement(sql);
ps.setInt(1,urunStokDurumu);
int i = ps.executeUpdate();
if(i > 0)
{
                      response.sendRedirect("urunler.jsp");  
}
            //stok düşme
            } 
                            
                     }catch(Exception  e) {
                         System.out.print(e);
       e.printStackTrace();
                     }
%>