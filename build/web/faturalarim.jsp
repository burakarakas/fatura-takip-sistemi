
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
        <title>Faturalım</title>
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
                     <h1 class="mt-4 white">Faturalarım</h1>
                       
                    <div class="container-fluid" >
    <div class="container-fluid px-4">
                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Ürün Bilgileri</th>
                                            <th>Fatura Toplam Tutar</th>
                                            <th>Fatura Kesim Tarihi</th>
                                            <th>İşlemler</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                                             <th>Ürün Bilgileri</th>
                                            <th>Fatura Toplam Tutar</th>
                                                                                        <th>Fatura Kesim Tarihi</th>

                                            <th>İşlemler</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        
                                        
                                                     <%
                                  
                       String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
                       String DB_URL = "jdbc:mysql://localhost:3306/stokenvartersatis?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
                       String USER = "root";
                       String PASS = "root";
                       Connection dbConnection = null;
                       String userid=(String) session.getAttribute("UserId");
                       String SQL_QUERY = "SELECT * FROM fatura where kisiId="+userid;
                       Class.forName(JDBC_DRIVER);
                       dbConnection = DriverManager.getConnection(DB_URL, USER, PASS);
                       Statement statementProduct=null;
                       ResultSet rs = null;
                       statementProduct = dbConnection.createStatement();
                       rs = statementProduct.executeQuery(SQL_QUERY);
                        while(rs.next()) {
                            %>
                                       <tr>
                                           <td >

                                                                                   
                                                                                     <%
                                                
                                                  String JDBC_DRIVER2 = "com.mysql.cj.jdbc.Driver";
                       String DB_URL2 = "jdbc:mysql://localhost:3306/stokenvartersatis?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
                       String USER2 = "root";
                       String PASS2 = "root";
                       Connection dbConnection2 = null;
                       String SQL_QUERY2 = "SELECT * FROM urun where id="+rs.getString(3);
                       Class.forName(JDBC_DRIVER2);
                       dbConnection2 = DriverManager.getConnection(DB_URL2, USER2, PASS2);
                       Statement statementProduct2=null;
                       ResultSet rs2 = null;
                       statementProduct2 = dbConnection2.createStatement();
                       rs2 = statementProduct2.executeQuery(SQL_QUERY2);
                                                while(rs2.next()) {
                                                %>
                                                <span> <strong>Ürün Adı</strong> : <%=rs2.getString(2)%></span>
                                                <br>
                                                <span> <strong>Ürün Fiyat</strong> : <%=rs2.getString(5)%> ₺</span>
                                                <br>
                                                <span> <strong>Ürün Açıklama </strong>: <%=rs2.getString(3)%></span>
                                                <%
                                                
                                                }
                                                
                                                %>
                                                                                   
                                             </td>
                                            <td><%=rs.getString(4)%> ₺</td>                                
                                            <td><%=rs.getString(5)%> </td>

                                            <td>
                                                <a class="btn btn-danger" href="faturasil.jsp?id=<%=rs.getString(1)%>" >Sil</a>
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







