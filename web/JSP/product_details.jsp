<%-- Document : product_details Created on : Sep 29, 2023, 1:20:40 PM Author : ASUS --%>

  <%@page import="model.ProductMODEL" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
          <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <fmt:setLocale value="vi_VN" />

            <!DOCTYPE html>
            <html>

            <head>
              <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <link rel="stylesheet" href="../css/style.css" />
              <link href="../css/product_details1.css" rel="stylesheet" />
              <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />


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
              <div class="webdetail-container">
                <div class="webdetail-webdetail">
                  <div class="webdetail-asideitems">
                    <c:forEach items="${listPhukien}" var="Phukien" varStatus="loop">
                      <div class="webdetail-item">
                        <span class="webdetail-text Textnormal">
                          <span>${Phukien.nameSP}</span><br>
                          <span style="color: var(--dl-color-default-gray500);">
                            <fmt:formatNumber type="currency" value="${Phukien.priceSP}" /> -
                          </span>
                          <span style="text-decoration: line-through ;color: var(--dl-color-default-gray500);">
                            <c:set var="OriginalPrice" value="${Phukien.priceSP / ((100-Phukien.discountSP) / 100)}" />
                            <fmt:formatNumber type="currency" value="${OriginalPrice}" />
                          </span>
                        </span>
                        <span class="webdetail-text002 Textnormal">

                        </span>
                        <div class="webdetail-group558">
                          <div class="webdetail-imagecloth5">
                            <img src="${Phukien.imageSP}" alt="image26I247" class="webdetail-image26" />
                          </div>
                        </div>
                      </div>
                    </c:forEach>


                    <span class="webdetail-text020 Title-H6">
                      <span>Phụ kiện</span>
                    </span>
                  </div>
                  <div class="webdetail-blockdetail">
                    <div class="webdetail-frame10">
                      <div class="webdetail-navbasetabtextnorm">
                        <span class="webdetail-text140" id="descriptionTab"><span>Description</span></span>
                      </div>
                      <div class="webdetail-navbasetabtextnorm">
                        <span class="webdetail-text134" id="reviewsTab"><span>Reviews</span></span>
                      </div>
                      <div class="webdetail-navbasetabtextnorm">
                        <span class="webdetail-text134" id="AboutsellerTab"><span>About seller</span></span>
                      </div>

                    </div>

                    <div class="webdetail-infoContent">
                      <div class="webdetail-infoleft" id="descriptionContent">
                        <div class="webdetail-infotitle">
                          <span>Cấu hình ${product.nameSP}</span>
                        </div>
                        <c:set var="productDescription" value="${product.descriptionSP}" />
                        <c:set var="delimiter" value="%%" />
                        <c:set var="descriptionLines" value="${fn:split(productDescription, delimiter)}" />
                        <table border="1">

                          <%-- Iterate through description lines and split into attribute and value --%>
                            <c:forEach var="line" items="${descriptionLines}">
                              <c:set var="parts" value="${line.split(':')}" />

                              <tr>
                                <td class="left-column">${parts[0]}</td>
                                <td class="right-column">${parts[1]}</td>
                              </tr>
                            </c:forEach>
                        </table>

                      </div>
                    </div>
                    <div class="webdetail-infoContent">
                      <!-- Reviews content goes here -->
                      <div class="webdetail-infoleft" id="reviewsContent" style="display: none;">
                        <h3>Đánh giá ${product.nameSP}</h3>
                        <div class="rating">
                          <div class="rating-bar">
                            <span class="star">5 <i class="fas fa-star"></i></span>
                            <div class="bar-container">
                              <div class="bar-segment" style="width: 85%;"></div>
                            </div>
                            <span class="percentage">85%</span>
                          </div>
                          <div class="rating-bar">
                            <span class="star">4 <i class="fas fa-star"></i></span>
                            <div class="bar-container">
                              <div class="bar-segment" style="width: 35%;"></div>
                            </div>
                            <span class="percentage">35%</span>
                          </div>
                          <div class="rating-bar">
                            <span class="star">3 <i class="fas fa-star"></i></span>
                            <div class="bar-container">
                              <div class="bar-segment" style="width: 9%;"></div>
                            </div>
                            <span class="percentage">9%</span>
                          </div>
                          <div class="rating-bar">
                            <span class="star">2 <i class="fas fa-star"></i></span>
                            <div class="bar-container">
                              <div class="bar-segment" style="width: 4%;"></div>
                            </div>
                            <span class="percentage">4%</span>
                          </div>
                          <div class="rating-bar">
                            <span class="star">1 <i class="fas fa-star"></i></span>
                            <div class="bar-container">
                              <div class="bar-segment" style="width: 6%;"></div>
                            </div>
                            <span class="percentage">6%</span>
                          </div>
                        </div>
                        <div class="review-container">
                          <div class="review">
                            <div class="review-author">Nhung</div>
                            <img src="../image/index_img/miscrating9092-b6.svg" alt="Miscrating9092"
                              class="review-rating" />
                            <div class="review-content">
                              Ok tốt
                            </div>
                            <div class="user-info">
                              <i class="far fa-thumbs-up" style="color: black; margin-right: 5px"></i>Hữu ích (51)Đã
                              dùng khoảng 4 tháng
                            </div>
                          </div>

                          <div class="review">
                            <div class="review-author">Đinh Công Sơn</div>
                            <img src="../image/index_img/miscrating9092-b6.svg" alt="Miscrating9092"
                              class="review-rating" />
                            <div class="review-content">
                              <i class="fas fa-heart" style="color: #b90e30;"></i>Sẽ giới thiệu cho bạn bè, người thân
                              Hàng rất OK
                            </div>
                            <div class="user-info">
                              <i class="far fa-thumbs-up" style="color: black; margin-right: 5px"></i>Hữu ích (8)Đã dùng
                              khoảng 1 tuần
                            </div>
                          </div>
                        </div>

                      </div>
                    </div>
                    <div class="webdetail-infoContent">
                      <div class="webdetail-infoleft" id="AboutsellerContent" style="display: none;">
                        <div class="warranty-text">
                          <div class="warranty-left">
                            <div class="warranty1">
                              <span class="warranty-title1">Đổi trả trong vòng 12 tháng toàn quốc (miễn phí tháng
                                đầu)</span> <br>
                            </div>
                          </div>

                          <p class="warranty-description">
                            <span class="warranty-title">Bảo hành có cam kết trong 12 tháng (chỉ áp dụng cho sản phẩm
                              chính, KHÔNG áp dụng cho phụ kiện kèm theo)</span><br>
                            <span class="warranty-title">Bảo hành trong vòng 15 ngày (từ lúc Khách hàng mang sản phẩm
                              đến bảo hành đến lúc nhận lại sản phẩm tối đa 15 ngày).</span><br><br>
                            <span class="warranty-title">Nếu vi phạm cam kết (bảo hành quá 15 ngày hoặc phải bảo hành
                              lại sản phẩm lần nữa trong 30 ngày kể từ lần bảo hành trước), Khách hàng được áp dụng
                              phương thức <i>Hư gì đổi nấy</i> ngay và luôn hoặc <i>Hoàn tiền</i> với mức phí giảm
                              50%.</span><br>
                            <span class="warranty-title">Từ tháng thứ 13 trở đi, không áp dụng bảo hành có cam kết, chỉ
                              áp dụng bảo hành hãng nếu có.</span><br><br>
                            <span class="warranty-title" style="font-weight: bold">Hư gì đổi nấy ngay &
                              luôn</span><br><br>
                            <span class="warranty-title">Lỗi phần mềm không áp dụng, mà chỉ khắc phục lỗi phần
                              mềm.</span><br>
                            <span class="warranty-title">Hư sản phẩm chính: Đổi sản phẩm mới (cùng model, cùng dung
                              lượng, cùng màu sắc) miễn phí tháng đầu tiên, tháng thứ 2 đến tháng 12 chịu phí 10% hoá
                              đơn/tháng. Nếu sản phẩm chính hết hàng thì áp dụng Bảo hành có cam kết hoặc Hoàn tiền với
                              mức phí giảm 50%.</span><br><br>
                            <span class="warranty-title" style="font-weight: bold">Hoàn tiền <i
                                class="fas fa-credit-card" style="color: #5d91e9;"></i></span><br><br>
                            <span class="warranty-title">Tháng đầu tiên kể từ ngày mua: phí 20% giá trị hóa
                              đơn.</span><br>
                            <span class="warranty-title">Tháng thứ 2 đến tháng thứ 12: phí 10% giá trị hóa
                              đơn/tháng.</span>
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="webdetail-contentmain">
                    <div class="webdetail-info">
                      <div class="webdetail-shortinfo">
                        <span class="webdetail-text055 TextBase">
                          <span>Số lượng:</span>
                        </span>
                        <div class="webdetail-frame273">
                          <button onclick="decrementNumber()" class="webdetail-buttonbtntru">-

                          </button>

                          <button id="number" class="webdetail-buttonbtngroup1">1

                          </button>

                          <button onclick="incrementNumber()" class="webdetail-buttonbtntru">+

                          </button>
                        </div>
                        <button class="webdetail-buttonbtnbasic">
                          <i class="fa-solid fa-chevron-right"></i>
                          <a class="btn btn-primary"
                            href="${pageContext.request.contextPath}/JSP/details?action=addtocart&productId=${product.getIdSP()}&quantity=1">Add to Cart</a>
                        </button>


                      </div>
                      <div class="webdetail-tradeprice">
                        <img src="../image/product_details_img/rectangle2442297-rxtf.svg" alt="Rectangle2442297"
                          class="webdetail-rectangle244" />
                        <div class="webdetail-group804">
                          <span class="webdetail-text060 TitleH5">
                            <c:set var="OriginalPrice" value="${product.priceSP / ((100-product.discountSP) / 100)}" />
                            <fmt:formatNumber type="currency" value="${OriginalPrice}" />
                          </span>
                          <span class="webdetail-text062 TextBase">
                            <span>Price:</span>
                          </span>
                          <span class="webdetail-text064 TitleH5">
                            <fmt:formatNumber type="currency" value="${product.priceSP}" />
                          </span>
                        </div>
                      </div>
                      <div class="webdetail-rating">
                        <div class="webdetail-group1003">
                          <div class="webdetail-group1033">
                            <span class="webdetail-text066 TextBase">
                              <span>154 sold</span>
                            </span>
                            <img src="../image/product_details_img/iconshoppingbasket2414-1am9.svg"
                              alt="Iconshoppingbasket2414" class="webdetail-iconshoppingbasket" />
                          </div>
                          <div class="webdetail-reviews">
                            <span class="webdetail-text068 TextBase">
                              <span>32 reviews</span>
                            </span>
                            <img src="../image/product_details_img/iconmessage2414-7j43.svg" alt="Iconmessage2414"
                              class="webdetail-iconmessage" />
                          </div>
                          <div class="webdetail-group1034">
                            <!--<span class="webdetail-text070 TextBase">
                      <span>9.3</span>
                    </span>
                    <img
                      src="public/external/miscrating2414-v1z.svg"
                      alt="Miscrating2414"
                      class="webdetail-miscrating"
                    />-->
                            <c:set var="rating" value="${product.ratingSP}" />
                            <c:choose>
                              <c:when test="${rating >= 9}">
                                <img src="../image/index_img/miscrating9092-b6.svg" alt="Miscrating9092"
                                  class="webdetail-miscrating" />
                                <span class="webdetail-text070 TextBase"><span>${product.ratingSP}</span></span>
                              </c:when>
                              <c:when test="${rating >= 7.5}">
                                <img src="../image/index_img/miscrating9092-f8m.svg" alt="Miscrating9092"
                                  class="webdetail-miscrating" />
                                <span class="webdetail-text070 TextBase"><span>${product.ratingSP}</span></span>
                              </c:when>
                              <c:when test="${rating >= 5.9}">
                                <img src="../image/index_img/miscrating9092-fcp.svg" alt="Miscrating9092"
                                  class="webdetail-miscrating" />
                                <span class="webdetail-text070 TextBase"><span>${product.ratingSP}</span></span>
                              </c:when>
                              <c:when test="${rating >= 3.5}">
                                <img src="../image/index_img/miscrating9092-ielc.svg" alt="Miscrating9092"
                                  class="webdetail-miscrating" />
                                <span class="webdetail-text070 TextBase"><span>${product.ratingSP}</span></span>
                              </c:when>
                            </c:choose>
                          </div>
                        </div>
                      </div>
                      <span class="webdetail-text072 Title-H4">
                        <span>
                          ${product.nameSP}
                        </span>
                      </span>
                      <div class="webdetail-aviable">
                        <span class="webdetail-text074 Textnormal">
                          <span>In stock</span>
                        </span>
                        <img src="../image/product_details_img/iconcontrolcheck2424-vcxf.svg" alt="Iconcontrolcheck2424"
                          class="webdetail-iconcontrolcheck4" />
                      </div>
                    </div>
                    <div class="webdetail-gallery">
                      <div class="webdetail-gallery../images">
                        <div class="webdetail-../image">
                          <img src="${product.imageSP}" alt="image382414" class="webdetail-image38"
                            onclick="changeContent('${product.imageSP}')" />
                        </div>
                        <div class="webdetail-../image">
                          <img src="${product.imageSP1}" alt="image352414" class="webdetail-image38"
                            onclick="changeContent('${product.imageSP1}')" />
                        </div>
                        <div class="webdetail-../image">
                          <img src="${product.imageSP2}" alt="image362414" class="webdetail-image38"
                            onclick="changeContent('${product.imageSP2}')" />
                        </div>
                        <div class="webdetail-../image">
                          <img src="${product.imageSP3}" alt="image372414" class="webdetail-image38"
                            onclick="changeContent('${product.imageSP3}')" />
                        </div>

                      </div>
                    </div>
                  </div>
                  <!<!-- sản phẩm liên quan -->

                    <div class="webdetail-blockrecommend">
                      <button id="prev-button" disabled><i class="fas fa-chevron-left"
                          style="color: #7a7c7f;"></i></button>
                      <c:forEach items="${listRelatedProducts}" var="listRelatedProducts" varStatus="loop">
                        <div class="webdetail-item10 product" id="product${loop.index}"
                          style="display: ${loop.index < 6 ? 'block' : 'none'};">
                          <div class="webdetail-text076">

                            <div class="webdetail-group799">

                              <span class="webdetail-text077 TextBase">

                                <span>${listRelatedProducts.nameSP}</span><br>
                                <span style="color: var(--dl-color-default-gray500);">
                                  <fmt:formatNumber type="currency" value="${listRelatedProducts.priceSP}" />
                                </span> -
                                <span style="text-decoration: line-through; color: var(--dl-color-default-gray500);">
                                  <c:set var="OriginalPrice"
                                    value="${listRelatedProducts.priceSP / ((100-listRelatedProducts.discountSP) / 100)}" />
                                  <fmt:formatNumber type="currency" value="${OriginalPrice}" />
                                </span>

                              </span>
                              <span class="webdetail-text079 TextBase">

                              </span>

                            </div>
                          </div>
                          <div class="webdetail-img">
                            <div class="webdetail-../imageinterior7">

                              <img src="${listRelatedProducts.imageSP}" alt="rasmI229" class="webdetail-rasm" />
                            </div>
                          </div>
                          <a href="${pageContext.request.contextPath}/details?productId=${listRelatedProducts.idSP}"><button
                              class="webdetail-buttonbtnbasic6">
                              <i class="fa-solid fa-chevron-right"></i>
                              <span class="text-viewdetail-details">View details</span>
                            </button></a>
                        </div>


                      </c:forEach>

                      <button id="next-button"><i class="fas fa-chevron-right" style="color: #7d838c; "></i></button>

                      <span class="webdetail-text118 Title-H4">
                        <span>Related products</span>
                      </span>

                    </div>


                    <div class="webdetail-layoutnavbaralibaba">
                      <img src="../image/product_details_img/bgi240-txoc.svg" alt="BGI240" class="webdetail-bg" />
                      <img src="../image/product_details_img/line61i240-v06n.svg" alt="Line61I240"
                        class="webdetail-line61" />
                      <img src="../image/product_details_img/borderi240-l6vf.svg" alt="BorderI240"
                        class="webdetail-border" />
                      <!--<div class="webdetail-navlist">
              <span class="webdetail-text120 TextTitle">
                <span>Contact</span>
              </span>
              <span class="webdetail-text122 TextTitle">
                <span>Introduction</span>
              </span>
              <div class="webdetail-product">
                <span class="webdetail-text124 TextTitle">
                  <span>Product</span>
                </span>
                <img
                  src="public/external/iconcontrolexpandmorei240-8pu.svg"
                  alt="IconcontrolexpandmoreI240"
                  class="webdetail-iconcontrolexpandmore"
                />
              </div>
              <span class="webdetail-text126 TextTitle"><span>Home</span></span>
              <img
                src="public/external/iconcontrolmenui240-lool.svg"
                alt="IconcontrolmenuI240"
                class="webdetail-iconcontrolmenu"
              />
            </div>-->
                      <ul class="webdetail-navlist">
                        <li><a href="index">Home</a><i class="fa-solid fa-bars fa-lg"
                            style="color: #141414;top :25px; left: 3px"></i></li>
                        <li><a href="#">Product</a>
                          <i class="fa-solid fa-chevron-down fa-l"
                            style="color: #727274; left: 95px; top: 20px; cursor: pointer;"></i>
                          <ul class="sub-menu">
                            <c:forEach items="${listCategory}" var="cate">
                              <li><a href="" class="categoryMenu" onclick="toggleCategory(this)">${cate.nameCate}</a>
                              </li>
                            </c:forEach>
                          </ul>
                        </li>

                        <li><a href="#">Introduction</a></li>
                        <li><a href="#">Contact</a></li>
                      </ul>
                    </div>

                    <div class="webdetail-layoutheaderalibaba">
                      <img src="../image/product_details_img/bgi240-cfxf.svg" alt="BGI240" class="webdetail-bg1" />
                      <div class="webdetail-actions">
                        <a href="${pageContext.request.contextPath}/JSP/Cart">
                          <div class="webdetail-cart">
                            <span class="webdetail-text128"><span>My cart</span></span>
                            <img src="../image/product_details_img/vectori240-orbm.svg" alt="Vector9284"
                              class="webdetail-vector" />
                          </div>
                        </a>

                        <div class="webdetail-profile">
                          <span class="webdetail-text130"><span>Login</span></span>
                          <img src="../image/product_details_img/vectori240-9w4r.svg" alt="VectorI240"
                            class="webgridview-vector1" />
                        </div>
                      </div>
                      <div class="webdetail-searchform">
                        <div class="webdetail-forminputgroupinputleft">
                          <input type="text" placeholder="Search" class="webdetail-textinput input" />
                        </div>
                        <button class="webdetail-buttonbtngroup3">Search
                        </button>
                      </div>
                      <img src="../image/product_details_img/brandlogocoloredi240-btcy.svg" alt="BrandlogocoloredI240"
                        class="webdetail-brandlogocolored" />


                    </div>

                    <div id="contentToChange" class="webdetail-group1004">

                      <img src="${product.imageSP}" alt="image342405" class="webdetail-image34" />
                    </div>


                    <div class="webdetail-layoutfooteralibaba">
                      <div class="webdetail-col">
                        <span class="webdetail-text142 TextTitle">
                          <span>For users</span>
                        </span>
                        <span class="webdetail-text144 Textnormal">
                          <span>Login</span>
                        </span>
                        <span class="webdetail-text146 Textnormal">
                          <span>Register</span>
                        </span>
                        <span class="webdetail-text148 Textnormal">
                          <span>Settings</span>
                        </span>
                        <span class="webdetail-text150 Textnormal">
                          <span>My Orders</span>
                        </span>
                      </div>
                      <div class="webdetail-group522">
                        <img src="../image/product_details_img/brandlogocoloredi242-cbab.svg" alt="BrandlogocoloredI242"
                          class="webdetail-brandlogocolored1" />
                        <span class="webdetail-text152 TextInfo">
                          <span>
                            Best information about the company gies here but now lorem
                            ipsum is
                          </span>
                        </span>
                        <div class="webdetail-group987">
                          <img src="../image/product_details_img/iconcontactsocialfacebook3i242-95sn.svg"
                            alt="Iconcontactsocialfacebook3I242" class="webdetail-iconcontactsocialfacebook3" />
                          <img src="../image/product_details_img/iconcontactsocialtwitter3i242-m8ud.svg"
                            alt="Iconcontactsocialtwitter3I242" class="webdetail-iconcontactsocialtwitter3" />
                          <img src="../image/product_details_img/iconcontactsociallinkedin3i242-cbxu.svg"
                            alt="Iconcontactsociallinkedin3I242" class="webdetail-iconcontactsociallinkedin3" />
                          <img src="../image/product_details_img/iconcontactsocialyoutube3i242-jhq3.svg"
                            alt="Iconcontactsocialyoutube3I242" class="webdetail-iconcontactsocialyoutube3" />
                        </div>
                      </div>
                      <div class="webdetail-group988">
                        <div class="webdetail-paymentmethodlanguage">
                          <span class="webdetail-text154 Textnormal">
                            <span>© 2023 Ecommerce.</span>
                          </span>
                        </div>
                      </div>
                      <div class="webdetail-col1">
                        <button class="webdetail-miscmarketbutton">
                          <div class="webdetail-group">
                            <img src="../image/product_details_img/subtracti242-6515.svg" alt="SubtractI242"
                              class="webdetail-subtract" />
                          </div>
                        </button>
                        <button class="webdetail-miscmarketbutton1">
                          <div class="webdetail-group1">
                            <img src="../image/product_details_img/logoi242-ck67.svg" alt="LogoI242"
                              class="webdetail-logo" />
                          </div>
                        </button>
                        <span class="webdetail-text156 TextTitle">
                          <span>Get app</span>
                        </span>
                      </div>
                      <div class="webdetail-col2">
                        <span class="webdetail-text158 TextTitle">
                          <span>Information</span>
                        </span>
                        <span class="webdetail-text160 Textnormal">
                          <span>Help Center</span>
                        </span>
                        <span class="webdetail-text162 Textnormal">
                          <span>Money Refund</span>
                        </span>
                        <span class="webdetail-text164 Textnormal">
                          <span>Shipping</span>
                        </span>
                        <span class="webdetail-text166 Textnormal">
                          <span>Contact us</span>
                        </span>
                      </div>
                      <div class="webdetail-col3">
                        <span class="webdetail-text168 TextTitle">
                          <span>Partnership</span>
                        </span>
                        <span class="webdetail-text170 Textnormal">
                          <span>About Us</span>
                        </span>
                        <span class="webdetail-text172 Textnormal">
                          <span>Find store</span>
                        </span>
                        <span class="webdetail-text174 Textnormal">
                          <span>Categories</span>
                        </span>
                        <span class="webdetail-text176 Textnormal">
                          <span>Blogs</span>
                        </span>
                      </div>
                      <div class="webdetail-col4">
                        <span class="webdetail-text178 TextTitle">
                          <span>About</span>
                        </span>
                        <span class="webdetail-text180 Textnormal">
                          <span>About Us</span>
                        </span>
                        <span class="webdetail-text182 Textnormal">
                          <span>Find store</span>
                        </span>
                        <span class="webdetail-text184 Textnormal">
                          <span>Categories</span>
                        </span>
                        <span class="webdetail-text186 Textnormal">
                          <span>Blogs</span>
                        </span>
                      </div>
                    </div>
                    <div class="webdetail-banner">
                      <img src="../image/product_details_img/rectangle1772424-dhb.svg" alt="Rectangle1772424"
                        class="webdetail-rectangle177" />
                      <a href="index"><button class="webdetail-buttonbtnbasic7">Shop now</button></a>


                      <span class="webdetail-text190 TextBase">
                        <span>Have you ever finally just write dummy info</span>
                      </span>
                      <span class="webdetail-text192 Title-H3">
                        <span>Super discount on more than 100 USD</span>
                      </span>
                    </div>

                </div>
              </div>

            </body>

            </html>