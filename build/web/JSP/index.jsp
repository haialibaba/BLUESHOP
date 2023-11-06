<%-- Document : index Created on : Sep 29, 2023, 12:59:17 PM Author : ASUS --%>

  <%@page import="java.util.List" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
          <fmt:setLocale value="vi_VN" />
          <!DOCTYPE html>
          <html>

          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="../css/style.css" />
            <link href="../css/index.css" rel="stylesheet" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"
              type="text/javascript"></script>
            <!--<script src="js/jQuery.UI.js" type="text/javascript"></script>-->
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

            <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
              integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
              crossorigin="anonymous" />


            <style data-tag="reset-style-sheet">
              html {
                line-height: 1.15;
              }

              body {
                margin: 0;
              }

              * {
                box-sizing: border-box;
                border-width: 0;
                border-style: solid;
              }

              p,
              li,
              ul,
              pre,
              div,
              h1,
              h2,
              h3,
              h4,
              h5,
              h6,
              figure,
              blockquote,
              figcaption {
                margin: 0;
                padding: 0;
              }

              button {
                background-color: transparent;
              }

              button,
              input,
              optgroup,
              select,
              textarea {
                font-family: inherit;
                font-size: 100%;
                line-height: 1.15;
                margin: 0;
              }

              button,
              select {
                text-transform: none;
              }

              button,
              [type="button"],
              [type="reset"],
              [type="submit"] {
                -webkit-appearance: button;
              }

              button::-moz-focus-inner,
              [type="button"]::-moz-focus-inner,
              [type="reset"]::-moz-focus-inner,
              [type="submit"]::-moz-focus-inner {
                border-style: none;
                padding: 0;
              }

              button:-moz-focus,
              [type="button"]:-moz-focus,
              [type="reset"]:-moz-focus,
              [type="submit"]:-moz-focus {
                outline: 1px dotted ButtonText;
              }

              a {
                color: inherit;
                text-decoration: inherit;
              }

              input {
                padding: 2px 4px;
              }

              img {
                display: block;
              }

              html {
                scroll-behavior: smooth
              }
            </style>
            <style data-tag="default-style-sheet">
              html {
                font-family: Inter;
                font-size: 16px;
              }

              body {
                font-weight: 400;
                font-style: normal;
                text-decoration: none;
                text-transform: none;
                letter-spacing: normal;
                line-height: 1.15;
                color: var(--dl-color-gray-black);
                background-color: var(--dl-color-gray-white);

              }
            </style>
            <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
              data-tag="font" />

          </head>

          <body>
            <!DOCTYPE html>
            <html>

            <head>
              <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <link rel="stylesheet" href="./css/style.css" />
              <link href="./css/index.css" rel="stylesheet" />
              <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
              <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"
                type="text/javascript"></script>
              <!--<script src="js/jQuery.UI.js" type="text/javascript"></script>-->
              <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
              <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
                integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
                crossorigin="anonymous" />


              <style data-tag="reset-style-sheet">
                html {
                  line-height: 1.15;
                }

                body {
                  margin: 0;
                }

                * {
                  box-sizing: border-box;
                  border-width: 0;
                  border-style: solid;
                }

                p,
                li,
                ul,
                pre,
                div,
                h1,
                h2,
                h3,
                h4,
                h5,
                h6,
                figure,
                blockquote,
                figcaption {
                  margin: 0;
                  padding: 0;
                }

                button {
                  background-color: transparent;
                }

                button,
                input,
                optgroup,
                select,
                textarea {
                  font-family: inherit;
                  font-size: 100%;
                  line-height: 1.15;
                  margin: 0;
                }

                button,
                select {
                  text-transform: none;
                }

                button,
                [type="button"],
                [type="reset"],
                [type="submit"] {
                  -webkit-appearance: button;
                }

                button::-moz-focus-inner,
                [type="button"]::-moz-focus-inner,
                [type="reset"]::-moz-focus-inner,
                [type="submit"]::-moz-focus-inner {
                  border-style: none;
                  padding: 0;
                }

                button:-moz-focus,
                [type="button"]:-moz-focus,
                [type="reset"]:-moz-focus,
                [type="submit"]:-moz-focus {
                  outline: 1px dotted ButtonText;
                }

                a {
                  color: inherit;
                  text-decoration: inherit;
                }

                input {
                  padding: 2px 4px;
                }

                img {
                  display: block;
                }

                html {
                  scroll-behavior: smooth
                }
              </style>
              <style data-tag="default-style-sheet">
                html {
                  font-family: Inter;
                  font-size: 16px;
                }

                body {
                  font-weight: 400;
                  font-style: normal;
                  text-decoration: none;
                  text-transform: none;
                  letter-spacing: normal;
                  line-height: 1.15;
                  color: var(--dl-color-gray-black);
                  background-color: var(--dl-color-gray-white);

                }
              </style>
              <link rel="stylesheet"
                href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
                data-tag="font" />

            </head>

            <body>
              <script>

                document.addEventListener("DOMContentLoaded", function () {
                  const productContainer = document.getElementById("webgridview-layoutproductcard");
                  const horizontalButton = document.getElementById("webgridview-buttonbtngroup1");
                  const verticalButton = document.getElementById("webgridview-buttonbtngroup");
                  const pageItems = document.getElementsByClassName("page-item");

                  productContainer.classList.add("horizontal");

                  horizontalButton.addEventListener("click", function () {
                    productContainer.classList.remove("vertical");
                    productContainer.classList.add("horizontal");
                  });

                  verticalButton.addEventListener("click", function () {
                    productContainer.classList.remove("horizontal");
                    productContainer.classList.add("vertical");
                  });

                });

                $(document).ready(function () {
                  $('.accordion-item.active .accordion-body').slideDown();
                  $('.accordion-header').click(function () {
                    $(this).parent().toggleClass('active');
                    $(this).parent().children('.accordion-body').slideToggle();
                  });
                });

              </script>
              <div class="webgridview-container">
                <div class="webgridview-webgridview">

                  <div class="layout-hearder">
                    <div class="webgridview-layoutnavbaralibaba">
                      <img src="../image/index_img/bgi240-2od.svg" alt="BGI240" class="webgridview-bg" />
                      <img src="../image/index_img/line61i240-kqcj.svg" alt="Line61I240" class="webgridview-line61" />
                      <img src="../image/index_img/borderi240-9bx8.svg" alt="BorderI240" class="webgridview-border" />
                      <!---<div class="webgridview-navlist">
                <span class="webgridview-text004 TextTitle">
                  <span>Contact</span>
                </span>
                <span class="webgridview-text006 TextTitle">
                  <span>Introduction</span>
                </span>
                <div class="webgridview-product">
                  <span class="webgridview-text008 TextTitle">
                    <span>Product</span>
                  </span>
                  <img
                    src="public/external/iconcontrolexpandmorei240-hyrl.svg"
                    alt="IconcontrolexpandmoreI240"
                    class="webgridview-iconcontrolexpandmore"
                  />
                </div>
                <span class="webgridview-text010 TextTitle">
                  <span>Home</span>
                </span>
                <img
                  src="public/external/iconcontrolmenui240-mpzi.svg"
                  alt="IconcontrolmenuI240"
                  class="webgridview-iconcontrolmenu"
                />
              </div>-->
                      <ul class="webgridview-navlist">
                        <li><a href="index">Home</a><i class="fa-solid fa-bars fa-lg"
                            style="color: #141414; top: 20px; left: 3px"></i></li>
                        <li><a href="#">Product</a>
                          <i class="fa-solid fa-chevron-down fa-l"
                            style="color: #727274; left: 95px; top: 20px; cursor: pointer;"></i>
                          <ul class="sub-menu">
                          </ul>
                        </li>

                        <li><a href="#">Introduction</a></li>
                        <li><a href="#">Contact</a></li>
                      </ul>
                    </div>
                    <div class="webgridview-layoutheaderalibaba">
                      <img src="../image/index_img/bgi240-pvzg.svg" alt="BGI240" class="webgridview-bg1" />
                      <a href="${pageContext.request.contextPath}/JSP/Cart">
                        <div class="webgridview-actions">
                          <div class="webgridview-cart">
                            <img src="../image/index_img/vectori240-orbm.svg" alt="VectorI240"
                              class="webgridview-vector" />
                            <span class="webgridview-text012"><span>My cart</span></span>
                          </div>
                      </a>
                      <div class="webgridview-profile">
                        <span class="webgridview-text014"><span>Login</span></span>
                        <img src="../image/index_img/vectori240-9w4r.svg" alt="VectorI240" class="webgridview-vector1" />
                      </div>
                    </div>

                    <div class="webgridview-searchform">
                      <div class="webgridview-forminputgroupinputleft">
                        <img src="../image/index_img/iconcontrolsearchi240-ma5m.svg" alt="IconcontrolsearchI240"
                          class="webgridview-iconcontrolsearch" />
                        <form action="ProductController" method="GET">
                          <input type="text" placeholder="Search" class="webgridview-textinput input" name="searchname"
                            id="searchname" />
                      </div>
                      <button type="submit" class="webgridview-buttonbtngroup2" id="btn-search">Search</button>
                      </form>
                    </div>

                    <img src="../image/index_img/brandlogocoloredi240-btcy.svg" alt="BrandlogocoloredI240"
                      class="webgridview-brandlogocolored" />
                  </div>
                </div>
                <div class="webgridview-sectionmain">
                  <img src="../image/index_img/bgcard9091-i08.svg" alt="bgcard9091" class="webgridview-bgcard" />
                  <div class="webgridview-banner">
                    <div class="webgridview-maskgroup">
                      <img src="../image/index_img/bannerboard800x42029091-qr28-400h.png" alt="Bannerboard800x42029091"
                        class="webgridview-bannerboard800x4202" />
                    </div>
                    <div class="webgridview-text132">
                      <span class="webgridview-text133">
                        <span>Latest trending</span>
                      </span>
                      <span class="webgridview-text135">
                        <span>Electronic items</span>
                      </span>
                    </div>
                    <button class="webgridview-buttonbtnbasic13">Learn more</button>

                  </div>
                  <img src="../image/index_img/rectangle3009091-n5wv-300w.png" alt="Rectangle3009091"
                    class="webgridview-rectangle300" />
                  <span class="webgridview-text139 TextBase">
                    <span>Hi, user  let’s get stated</span>
                  </span>
                  <button class="webgridview-buttonbtnbasic14">Join now</button>

                  <button class="webgridview-buttonbtnbasic15">Log in</button>

                  <img src="../image/index_img/avatar9091-7o7m.svg" alt="Avatar9091" class="webgridview-avatar" />
                  <div class="webgridview-block">
                    <span class="webgridview-text145 TextBase">
                      <span>Get US $10 off with a new supplier</span>
                    </span>
                  </div>
                  <div class="webgridview-block1">
                    <span class="webgridview-text147 TextBase">
                      <span>Send quotes with supplier preferences</span>
                    </span>
                  </div>
                </div>

                <div class="content">
                  <div class="webgridview-contenttop">
                    <span class="webgridview-text TextBase">
                      <span>Results: ${allProduct} items</span>
                    </span>
                    <div class="webgridview-btngroup">
                      <button id="webgridview-buttonbtngroup"><i class="fas fa-bars fa-lg"></i></button>
                      <button id="webgridview-buttonbtngroup1"><i class="fas fa-grip-horizontal fa-lg"></i></button>
                    </div>
                    <span class="webgridview-text002 TextBase">
                      <span><a href="index">Clear all filter</a></span>
                    </span>
                  </div>

                  <div class="webgridview-layoutproductcard" id="webgridview-layoutproductcard">
                    <c:forEach items="${listProduct}" var="product">
                      <div class="col-md-4 mb-4">
                        <div class="card">
                          <div class="card-body">
                            <div class="card-img">
                              <img src="${product.imageSP}" alt="image33I239" class="webgridview-image33" />
                            </div>
                            <div class="webgridview-content">
                              <div class="webgridview-group1000">
                                <span class="webgridview-text022 TitleH5">
                                  <fmt:formatNumber type="currency" value="${product.priceSP}" />

                                </span>
                                <span class="webgridview-text024"><span>
                                    <c:set var="OriginalPrice"
                                      value="${product.priceSP / ((100-product.discountSP) / 100)}" />
                                    <fmt:formatNumber type="currency" value="${OriginalPrice}" />
                                  </span></span>
                              </div>
                              <div class="webgridview-rating">
                                <c:set var="rating" value="${product.ratingSP}" />
                                <c:choose>
                                  <c:when test="${rating >= 9}">
                                    <img src="../image/index_img/miscrating9092-b6.svg" alt="Miscrating9092"
                                      class="webgridview-miscrating" />
                                    <span class="webgridview-text018 TextBase"><span>${product.ratingSP}</span></span>
                                  </c:when>
                                  <c:when test="${rating >= 7.5}">
                                    <img src="../image/index_img/miscrating9092-f8m.svg" alt="Miscrating9092"
                                      class="webgridview-miscrating" />
                                    <span class="webgridview-text018 TextBase"><span>${product.ratingSP}</span></span>
                                  </c:when>
                                  <c:when test="${rating >= 5.9}">
                                    <img src="../image/index_img/miscrating9092-fcp.svg" alt="Miscrating9092"
                                      class="webgridview-miscrating" />
                                    <span class="webgridview-text018 TextBase"><span>${product.ratingSP}</span></span>
                                  </c:when>
                                  <c:when test="${rating >= 3.5}">
                                    <img src="../image/index_img/miscrating9092-ielc.svg" alt="Miscrating9092"
                                      class="webgridview-miscrating" />
                                    <span class="webgridview-text018 TextBase"><span>${product.ratingSP}</span></span>
                                  </c:when>
                                  <c:otherwise>

                                  </c:otherwise>
                                </c:choose>
                              </div>
                              <button class="webgridview-buttonbtnbasic">
                                <i class="far fa-heart fa-lg"></i>
                              </button>
                              <span class="webgridview-titleproduct">
                                ${product.nameSP}
                              </span>
                              <a href="${pageContext.request.contextPath}/JSP/details?productId=${product.idSP}"><button
                                  class="webgridview-buttonbtnbasic01">
                                  <i class="fa-solid fa-chevron-right"></i>
                                  <span class="text-view-details">View details</span>
                                </button></a>
                            </div>
                          </div>
                        </div>
                      </div>

                    </c:forEach>


                  </div>

                  <div class="webgridview-sidebar">
                    <div id="wrapper">
                      <div class="accordion">
                        <div class="accordion-item active">
                          <div class="accordion-header">
                            <span>Category</span>
                            <i class="fas fa-chevron-down"></i>
                          </div>
                          <div class="accordion-body">

                            <span class="webgridview-Category" style="color: blue;">See all</span>
                          </div>
                        </div>

                        <div class="accordion-item active">
                          <div class="accordion-header">
                            <span>Brands</span>
                            <i class="fas fa-chevron-down"></i>
                          </div>
                          <div class="accordion-body" id="brandsContainer" id="brands-${cate.idCate}">

                            <span class="webgridview-Category" style="color: blue; ">See all</span>
                          </div>
                        </div>

                        <div class="accordion-item active">
                          <div class="accordion-header">
                            <span>Price range</span>
                            <i class="fas fa-chevron-down"></i>
                          </div>
                          <div class="accordion-body">
                            <div class="slidecontainer">
                              <input type="range" min="1" max="38980000" value="100" class="slider" id="myRange">
                            </div>
                            <div class="webgridview">
                              <div class="webgridview-min1">

                                <span class="webgridview-Category">Min</span><br>
                                <div class="webgridview-inputprice">
                                  <input type="number" min=0 max="38980000" placeholder="0" id="min_price"
                                    class="webgridview-textinput2 input" />
                                </div>
                              </div>
                              <div class="webgridview-max1" style="margin-left: 10px">
                                <span class="webgridview-Category">Max</span><br>
                                <div class="webgridview-inputprice">
                                  <input type="number" min=2790000 max="38990000" id="max_price" placeholder="999999"
                                    class="webgridview-textinput3 input" />
                                </div>
                              </div>
                            </div>
                            <button class="price-range-search" id="price-range-submit">Apply</button><br>
                            <span class="webgridview-Category" style="color: blue;">See all</span>
                          </div>
                        </div>

                        <div class="accordion-item active">
                          <div class="accordion-header">
                            <span>Ratings</span>
                            <i class="fas fa-chevron-down"></i>
                          </div>
                          <div class="accordion-body">
                            <div class="webgridview-formselectioncheckboxoff04">
                              <input type="checkbox" class="webgridview-checkbox04" name="ratingFilter" value="5" />
                              <img src="../image/index_img/miscrating9092-b6.svg" alt="Miscrating9092"
                                class="webgridview-miscrating06" />
                            </div>
                            <div class="webgridview-formselectioncheckboxoff04">
                              <input type="checkbox" class="webgridview-checkbox04" name="ratingFilter" value="4" />
                              <img src="../image/index_img/miscrating9092-f8m.svg" alt="Miscrating9092"
                                class="webgridview-miscrating07" />
                            </div>
                            <div class="webgridview-formselectioncheckboxoff04">
                              <input type="checkbox" class="webgridview-checkbox04" name="ratingFilter" value="3" />
                              <img src="../image/index_img/miscrating9092-fcp.svg" alt="Miscrating9092"
                                class="webgridview-miscrating08" />
                            </div>
                            <div class="webgridview-formselectioncheckboxoff04">
                              <input type="checkbox" class="webgridview-checkbox04" name="ratingFilter" value="2" />
                              <img src="../image/index_img/miscrating9092-ielc.svg" alt="Miscrating9092"
                                class="webgridview-miscrating09" />
                            </div>

                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="footer">
                  <div class="webgridview-layoutnewsletteralibaba">
                    <img src="../image/index_img/bgi239-ibnn-200h.png" alt="bgI239" class="webgridview-bg2" />
                    <div class="webgridview-textform">
                      <div class="webgridview-form">
                        <div class="webgridview-formiconinput">
                          <img src="../image/index_img/iconemaili239-s8wp.svg" alt="IconemailI239"
                            class="webgridview-iconemail" />
                          <input type="text" placeholder="Email" class="webgridview-textinput1 input" />
                        </div>
                        <button class="webgridview-buttonbtnbasic12">Subscribe</button>
                      </div>
                      <div class="webgridview-text081">
                        <span class="webgridview-text082 TextInfo">
                          <span>
                            Get daily news on upcoming offers from many suppliers all
                            over the world
                          </span>
                        </span>
                        <span class="webgridview-text084 Title-H4">
                          <span>Subscribe on our newsletter</span>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="webgridview-layoutfooteralibaba">
                    <div class="webgridview-col">
                      <span class="webgridview-text086 TextTitle">
                        <span>For users</span>
                      </span>
                      <span class="webgridview-text088 Textnormal">
                        <span>Login</span>
                      </span>
                      <span class="webgridview-text090 Textnormal">
                        <span>Register</span>
                      </span>
                      <span class="webgridview-text092 Textnormal">
                        <span>Settings</span>
                      </span>
                      <span class="webgridview-text094 Textnormal">
                        <span>My Orders</span>
                      </span>
                    </div>
                    <div class="webgridview-group522">
                      <img src="../image/index_img/brandlogocoloredi239-7n2n.svg" alt="BrandlogocoloredI239"
                        class="webgridview-brandlogocolored1" />
                      <span class="webgridview-text096 TextInfo">
                        <span>
                          Best information about the company gies here but now lorem
                          ipsum is
                        </span>
                      </span>
                      <div class="webgridview-group987">
                        <img src="../image/index_img/iconcontactsocialfacebook3i239-t88.svg"
                          alt="Iconcontactsocialfacebook3I239" class="webgridview-iconcontactsocialfacebook3" />
                        <img src="../image/index_img/iconcontactsocialtwitter3i239-925m.svg"
                          alt="Iconcontactsocialtwitter3I239" class="webgridview-iconcontactsocialtwitter3" />
                        <img src="../image/index_img/iconcontactsociallinkedin3i239-lojd.svg"
                          alt="Iconcontactsociallinkedin3I239" class="webgridview-iconcontactsociallinkedin3" />
                        <img src="../image/index_img/iconcontactsocialyoutube3i239-7bg.svg"
                          alt="Iconcontactsocialyoutube3I239" class="webgridview-iconcontactsocialyoutube3" />
                      </div>
                    </div>
                    <div class="webgridview-group988">
                      <div class="webgridview-paymentmethodlanguage">
                        <span class="webgridview-text098 Textnormal">
                          <span>© 2023 Ecommerce.</span>
                        </span>
                      </div>
                    </div>
                    <div class="webgridview-col1">
                      <button class="webgridview-miscmarketbutton">
                        <div class="webgridview-group">
                          <img src="../image/index_img/subtracti239-55yn.svg" alt="SubtractI239"
                            class="webgridview-subtract" />
                        </div>
                      </button>
                      <button class="webgridview-miscmarketbutton1">
                        <div class="webgridview-group1">
                          <img src="../image/index_img/logoi239-ovi.svg" alt="LogoI239" class="webgridview-logo" />
                        </div>
                      </button>
                      <span class="webgridview-text100 TextTitle">
                        <span>Get app</span>
                      </span>
                    </div>
                    <div class="webgridview-col2">
                      <span class="webgridview-text102 TextTitle">
                        <span>Information</span>
                      </span>
                      <span class="webgridview-text104 Textnormal">
                        <span>Help Center</span>
                      </span>
                      <span class="webgridview-text106 Textnormal">
                        <span>Money Refund</span>
                      </span>
                      <span class="webgridview-text108 Textnormal">
                        <span>Shipping</span>
                      </span>
                      <span class="webgridview-text110 Textnormal">
                        <span>Contact us</span>
                      </span>
                    </div>
                    <div class="webgridview-col3">
                      <span class="webgridview-text112 TextTitle">
                        <span>Partnership</span>
                      </span>
                      <span class="webgridview-text114 Textnormal">
                        <span>About Us</span>
                      </span>
                      <span class="webgridview-text116 Textnormal">
                        <span>Find store</span>
                      </span>
                      <span class="webgridview-text118 Textnormal">
                        <span>Categories</span>
                      </span>
                      <span class="webgridview-text120 Textnormal">
                        <span>Blogs</span>
                      </span>
                    </div>
                    <div class="webgridview-col4">
                      <span class="webgridview-text122 TextTitle">
                        <span>About</span>
                      </span>
                      <span class="webgridview-text124 Textnormal">
                        <span>About Us</span>
                      </span>
                      <span class="webgridview-text126 Textnormal">
                        <span>Find store</span>
                      </span>
                      <span class="webgridview-text128 Textnormal">
                        <span>Categories</span>
                      </span>
                      <span class="webgridview-text130 Textnormal">
                        <span>Blogs</span>
                      </span>
                    </div>
                  </div>
                </div>

              </div>
              </div>


            </body>

            </html>