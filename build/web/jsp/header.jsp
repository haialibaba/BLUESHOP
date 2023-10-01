<%-- 
    Document   : header
    Created on : Oct 1, 2023, 3:07:18 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
        <link rel="stylesheet" href="../fontawesome-free-5.15.4-web/fontawesome-free-5.15.4-web/css/all.min.css">
    </head>
    <body>
  <div class="header">
            <div class="header__logo">
                <a href="index.html">

                    <img src="../assets/img/logo1.png" alt="" class="header__logo-img" id="logo">
                </a>
            </div>

      

            <div class="header__search hide-on-tablet">

                <div class="header__search-input">
                    <input type="text" placeholder="Search something........." class="search-input" id="txtsearch" onchange="searchInfo('txtsearch');">
                </div>
                
                <div class="header__search-btn" >
                    <i class="search-btn fas fa-search"></i>
                </div>

            </div>

           
        </div>
    </body>
</html>
