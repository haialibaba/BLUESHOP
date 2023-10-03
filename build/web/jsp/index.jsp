<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web project</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/fontawesome-free-5.15.4-web/fontawesome-free-5.15.4-web/css/all.min.css">
    </head>
<body>
    <jsp:include page="../jsp/header.jsp" />
    <div class="apps" onload="hideAdminBar();">
        <div id="preLoader"></div>
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
        

        <div class="apps__container">

            <div class="apps__category">
                
                <div class="apps__category-header">
                    <div class="apps__category-heading">
                        <p>ADMIN</p>
                    </div>
                    <div class="apps__category-btn" onclick="hideAdminBar();" id="hideAdmin">
                        <i class="fas fa-signal"></i>
                    </div>
        
                    <div class="apps__category-btn" id="displayAdmin" onclick="displayAdminBar();">
                        <i class="fas fa-bars"></i>
                    </div>
                </div>

                <ul class="apps__category-list">
                    <a href="index.html?manager=product"><li class="apps__category-list-item" id="managerProduct"><i class="fab fa-product-hunt"></i> <span id="quanlysp">Quản lý sản phẩm</span></li></a>
                    <a href="index.html?manager=user"><li class="apps__category-list-item" id="managerUser"><i class="fas fa-users"></i> <span id="quanlynd"">Quản lý người dùng</span></li></a>
                    <a href="index.html?manager=handleproduct"><li class="apps__category-list-item" id="managerCart"><i class="fas fa-cart-arrow-down"></i> <span id="xulydonhang">Xử lý đơn hàng</span></li></a>
                    <a href="index.html?manager=benefits"><li class="apps__category-list-item" id="managerStatistic"><i class="fas fa-chart-bar"></i> <span id="thongkedoanhthu">Thống kê doanh thu</span></li></a>
                </ul>
            </div>

            <div class="apps__content" onclick="hideAdminBar();">
                
                <div class="apps__content-header">
                    <div class="apps__content-heading">
                        <p class="apps__content-heading-content">Danh sách</p>
                    </div>
    
                    <div class="apps__content-add-product">
                        <button><i class="fas fa-cart-plus"></i> Thêm mới</button>
                    </div>
                </div>
                
                <div class="apps__content-container">
                    <div class="apps__content-container-title hide-on-mobile">
                    </div>

                    <div class="apps__content-container-show hide-on-mobile-admin">
                    </div>

                    <div class="apps__content-mobile hide-on-pc display-on-mobile">
                    </div>

                    <div class="pagination">
                        <div class="pagination__list">
                            <a href="admin.html" class="pagination__list-link"><div class="pagination__list-item">Home</div></a>
                            <a href="" id="prePage" class="pagination__list-link"><div class="pagination__list-item">Prev</div></a>
                            <a href="" class="pagination__list-link" id="page1"><div class="pagination__list-item">1</div></a>
                            <a href="" class="pagination__list-link" id="page2"><div class="pagination__list-item">2</div></a>
                            <a href="" class="pagination__list-link" id="page3"><div class="pagination__list-item">3</div></a> 
                            <a href="" id="nextPage" class="pagination__list-link"><div class="pagination__list-item">Next</div></a>                      
                        </div>
                    </div>
                </div>
    
            </div>


        </div>

    </div>
    <script>
        function displayAdminBar()
{
    document.querySelector('.apps__category-heading').style.display = "block";
    document.querySelector('.apps__category').style.width = "250px";
    document.getElementById('quanlysp').style.display = "inline";
    document.getElementById('quanlynd').style.display = "inline";
    document.getElementById('xulydonhang').style.display = "inline";
    document.getElementById('thongkedoanhthu').style.display = "inline";
    document.getElementById('managerProduct').style.textAlign = "left";
    document.getElementById('managerUser').style.textAlign = "left";
    document.getElementById('managerCart').style.textAlign = "left";
    document.getElementById('managerStatistic').style.textAlign = "left";
    document.querySelector('.apps__category-header').style.justifyContent = "space-between";
    document.getElementById('hideAdmin').style.display = "block";
    document.getElementById('displayAdmin').style.display = "none";
}
function hideAdminBar()
{
    document.querySelector('.apps__category-heading').style.display = "none";
    document.querySelector('.apps__category').style.width = "70px";
    document.getElementById('quanlysp').style.display = "none";
    document.getElementById('quanlynd').style.display = "none";
    document.getElementById('xulydonhang').style.display = "none";
    document.getElementById('thongkedoanhthu').style.display = "none";
    document.getElementById('managerProduct').style.textAlign = "center";
    document.getElementById('managerUser').style.textAlign = "center";
    document.getElementById('managerCart').style.textAlign = "center";
    document.getElementById('managerStatistic').style.textAlign = "center";
    document.querySelector('.apps__category-header').style.justifyContent = "center";
    document.getElementById('hideAdmin').style.display = "none";
    document.getElementById('displayAdmin').style.display = "block";
}
    </script>
</body>
</html>
