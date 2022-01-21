<%-- 
    Document   : kayitol.jsp
    Created on : Nov 6, 2021, 10:57:12 PM
    Author     : mirza
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Otel Yönetim Kayıt Sayfası</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
                     <style>
               body {
    font-family: "Lato", sans-serif;
}



.main-head{
    height: 150px;
    background: #FFF;
   
}

.sidenav {
    height: 100%;
    background-color: #000;
    overflow-x: hidden;
    padding-top: 20px;
}


.main {
    padding: 0px 10px;
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }

    .register-form{
        margin-top: 10%;
    }
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 40%; 
    }

    .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }

    .login-form{
        margin-top: 80%;
    }

    .register-form{
        margin-top: 20%;
    }
}


.login-main-text{
    margin-top: 20%;
    padding: 60px;
    color: #fff;
}

.login-main-text h2{
    font-weight: 300;
}

.btn-black{
    background-color: #000 !important;
    color: #fff;
}

                </style>
	</head>
	<body>
<div class="sidenav">
         <div class="login-main-text">
            <h2>Stok&Envarter&Satış<br> Otamasyon Sistemi</h2>
            <p>Kayıt Sayfası</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
                <form action="signup" method="POST">
                    <div class="form-group">
                     <label>İsim</label>
                     <input type="text" name="name" class="form-control" placeholder="İsim">
                  </div>
                    <div class="form-group">
                     <label>Telefon</label>
                     <input type="text" name="phone" class="form-control" placeholder="Telefon">
                  </div>
                  <div class="form-group">
                     <label>Email</label>
                     <input type="text" name="email" class="form-control" placeholder="Kullanıcı Adı">
                  </div>
                  <div class="form-group">
                     <label>Şifre</label>
                     <input type="password" name="password" class="form-control" placeholder="Şifre">
                  </div>
                      <div class="form-group">
                     <label>Şifre Tekrarı</label>
                     <input type="password" name="password_confirmation" class="form-control" placeholder="Şifre Tekrar">
                  </div>
                    
                  <button type="submit" class="btn btn-black">Kayıt Ol</button>
                  <a  href="/stokenvartersatis/login" class="btn btn-secondary">Giriş Yap</a>
               </form>
            </div>
         </div>
      </div>
                 
                
                
	</body>
</html>


































