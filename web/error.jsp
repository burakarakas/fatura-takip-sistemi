<%@page contentType="text/html" isErrorPage="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hata Sayfası</title>
    <style>

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border-radius: .25rem;
            padding: 10px;
            box-shadow: 4px 4px 10px #00000040
        }

        .card .card-header {
            background-color: #fff;
            border-bottom: none;
        }
        .text{
            font-size: 40px;
            padding: 15px 0;
            font-weight: bold;
            color: #4c0101;
        }
        .unlem{
            font-size: 150px;
            display: block;
            margin: 0 auto;
            width:1em;
            height: 1em
                ;
        }
        .acıklama{
            color: black;
            margin: 0 auto;
            letter-spacing: 1.2px;
            max-width: 220px;
            text-align: center;
            padding: 10px 0;
        }
        .button-container{
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }
        .button-container a{
            font-size: 15px;
            text-decoration: none;
            text-transform: uppercase;
            display:flex;
            align-items: center;
            color: #fff;
            background-color:#007bff;
            padding:  5px 10px;
            border-radius: 4px;
            
        }
     
    </style>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>

    </head>
    <body>
    <div class="row justify-content-center">
        <div class="col-md-12 col-sm-12">
            <div class="card shadow-lg border-0 rounded-lg mt-5 mx-auto" style="width: 30rem;    width: 30rem;
                 margin: auto;
                 text-align: center;
                 margin-top: 117px;">
                <img src="./assets/img/pngegg.png" class="unlem"/>
                <div class="text">
                    404
                </div>

                <div class="acıklama">
                    Bir sorun oluştu lütfen anasayfaya giderek devam edin !
                </div>
            </div>
            <div class="button-container">
                <a type="button" href="/stokenvartersatis/anasayfa.jsp">
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                         width="24" height="24"
                         viewBox="0 0 172 172"
                         style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M86,15.0472l-78.83333,70.9528h21.5v64.5h43v-50.16667h28.66667v50.16667h43v-64.5h21.5z"></path></g></g></svg>
             
                </a>
            </div>
        </div>
    </div>
</body>
</html>
