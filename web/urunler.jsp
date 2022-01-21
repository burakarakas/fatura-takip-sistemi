
<%@page import="java.lang.Thread.State"%>
<%@page import="jdk.jshell.spi.ExecutionControl.ExecutionControlException"%>
<%-- import java packets --%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Ürün Satın Alma Paneli</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
        <style>
            .form-group {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">
                
                <%
                String username = (String) session.getAttribute("UserName");
       String name="";
      if (username != null) {
                name = username;
                %>
            Merhaba, <%=name%>
                <%
      }
                %>
                
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="logout.jsp">Çıkış Yap</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                  <%@ include file = "menu.jsp" %>
            </div>
            <div id="layoutSidenav_content">
                <main style="margin:10px; padding: 7px">
                     <h1 class="mt-4 white">Ürün Satın Alma Paneli</h1>
                   
                    <div class="container-fluid" >
    <div class="container-fluid px-4">
                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Ürün Adı</th>
                                            <th>Ürün Fiyat</th>
                                            <th>Ürün Durum</th>
                                           <th>Ürün Stok Durumu</th>
                                            <th>Ürünü Satın Al</th> 
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                          <th>Ürün Adı</th>
                                            <th>Ürün Fiyat</th>
                                            <th>Ürün Durum</th>
                                           <th>Ürün Stok Durumu</th>
                                            <th>Ürünü Satın Al</th> 
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        
                                        
                                                     <%
                                  
                       String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
                       String DB_URL = "jdbc:mysql://localhost:3306/stokenvartersatis?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
                       String USER = "root";
                       String PASS = "root";
                       Connection dbConnection = null;
                       String SQL_QUERY = "SELECT * FROM urun ";
                       Class.forName(JDBC_DRIVER);
                       dbConnection = DriverManager.getConnection(DB_URL, USER, PASS);
                       Statement statementProduct=null;
                       ResultSet rs = null;
                       statementProduct = dbConnection.createStatement();
                       rs = statementProduct.executeQuery(SQL_QUERY);
                        while(rs.next()) {
                            %>
                                       <tr>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getString(5)%> ₺</td>
                                            
                                                      <td><%
                                                          if(rs.getString(7).equals("1")) {
                                                          
                                                          %>
                                                          <span>Aktif</span>
                                                          
                                                          <%
                                                          
                                                          }
else {
%>
<span>Pasif</span>
                                                          <%
}
                                                          
                                                          %>
                                                      </td>
                                                      <td>
                                                          <%
                                                          if(rs.getInt(8)>0) {
                                                              %>
                                                              <span>Stokta Var (<%=rs.getInt(8)%> Adet)</span>
                                                          <%
                                                              }
else {
%>
                                                          
<span>Stokta Yok (<%=rs.getInt(8)%> Adet)</span>
                                                              <%

}
                                                          
                                                          
                                                          %>
                                                      </td>
                                                        <td>
                                                          <%
                                                          if(rs.getInt(8)>0) {
                                                              %>
                                                                                                             <a class="btn btn-success" href="satinal.jsp?id=<%=rs.getString(1)%>&userid=<%=(String) session.getAttribute("UserId")%>" >Satın Al</a>

                                                          <%
                                                              }
else {
%>
                                                          
                                                <a class="btn btn-danger" href="" >Ürünü Satın Alamazsınız</a>

                                                              <%

}
                                                          
                                                          
                                                          %>
                                                      </td>

                                            

                                        </tr>
                                    
                            <%

                        }
                  
                            %>
                            
                                        
                                        
                                     
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; İnternet Programlama Bütünleme Ödevi 2022</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
            <script src="js/datatable.js"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>







