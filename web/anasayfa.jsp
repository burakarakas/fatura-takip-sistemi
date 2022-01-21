<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark mynavbar">
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
                    <input class="form-control" type="text" placeholder="Ara..." aria-label="Ara..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
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
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4 white">Anasayfa</h1>
                        
                        <div class="anasayfa-cardlar d-flex justify-content-sm-between">
                            <!-- Depo Sayısı -->
                            <div class="mycard card">
                                <div class="card-bg depo"></div>
                                <div class="title">Toplam Depo Sayısı</div>
                                <div>
                                    <%
                                     String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
                                     String DB_URL = "jdbc:mysql://localhost:3306/stokenvartersatis?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
                                     Connection conn = null;
                                     Class.forName(JDBC_DRIVER);
                                     conn = DriverManager.getConnection(DB_URL,"root","root");
                                    String SQL_QUERY = "SELECT COUNT(*) as rowcount FROM depo";
                                    Statement statementProduct1=null;
                                    ResultSet rs2 = null;
                                    statementProduct1 = conn.createStatement();
                                    rs2 = statementProduct1.executeQuery(SQL_QUERY);
                                     while(rs2.next()) {
                                    int count = rs2.getInt("rowcount");
                                                     %>
                                             <%=count%>
                                             <%
                                    }
                                    %>
                                </div>
                            </div>
                            <!-- Ürün Sayısı--> 
                            <div class = "mycard card">
                                <div class="card-bg urun"></div>
                              <div class="title">Toplam Ürün Çeşidi</div>
                            <div><%
                                 String JDBC_DRIVER2 = "com.mysql.cj.jdbc.Driver";
       String DB_URL2 = "jdbc:mysql://localhost:3306/stokenvartersatis?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
       Connection conn2 = null;
        Class.forName(JDBC_DRIVER2);
                            conn2 = DriverManager.getConnection(DB_URL2,"root","root");
                                String SQL_QUERY2 = "SELECT COUNT(*) as rowcount FROM urun";
                       Statement statementProduct2=null;
                       ResultSet rs3 = null;
                       statementProduct2 = conn2.createStatement();
                       rs3 = statementProduct2.executeQuery(SQL_QUERY2);
                        while(rs3.next()) {
                  int count2 = rs3.getInt("rowcount");
                                        %>
                                <%=count2%>
                                <%
                        }
                                
                                %></div>
                            
                        </div>
                            <!-- Fatura Sayısı -->
                            
                            <div class="mycard card">
                                <div class="card-bg fatura"></div>
                                <div class="title">Toplam Fatura Sayısı</div>
                                <div><%
                                     String JDBC_DRIVER3 = "com.mysql.cj.jdbc.Driver";
           String DB_URL3 = "jdbc:mysql://localhost:3306/stokenvartersatis?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
           Connection conn3 = null;
            Class.forName(JDBC_DRIVER3);
                                conn3 = DriverManager.getConnection(DB_URL3,"root","root");
                                    String SQL_QUERY3 = "SELECT COUNT(*) as rowcount FROM fatura";
                           Statement statementProduct3=null;
                           ResultSet rs4 = null;
                           statementProduct3 = conn3.createStatement();
                           rs4 = statementProduct3.executeQuery(SQL_QUERY3);
                            while(rs4.next()) {
                      int count3 = rs4.getInt("rowcount");
                                            %>
                                    <%=count3%>
                                    <%
                            }

                                    %>
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
