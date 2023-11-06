<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%!
    // Định nghĩa hàm lấy giá trị của cookie
    public String getCookieValue(javax.servlet.http.Cookie[] cookies, String cookieName) {
        if (cookies != null) {
            for (javax.servlet.http.Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
%>
<%
    String fullname = getCookieValue(request.getCookies(), "username");
    String phone = getCookieValue(request.getCookies(), "PhoneNumber");
%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="../asset/css/cart.css">
            <link rel="stylesheet" href="../asset/themify-icons/themify-icons.css">
            <title>Cart</title>
        </head>

        <body>
            <jsp:include page="../Component/header.jsp" />
            <jsp:include page="../Component/menu.jsp" />
            <div class="info">
                <b>Khách hàng <%= fullname %>  (<%= phone %>)</b>
                <input type="text" name="address" placeholder="Vui lòng điền địa chỉ">
            </div>
            <div class="list-cart">
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Image</th>
                            <th>Product name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Select</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${productsInCart}" var="cartItem">
                            <tr data-id="${cartItem.idSP}" data-price="${cartItem.priceSP}">
                                <td>
                                    ${cartItem.idSP}
                                </td>
                                <td>
                                    <img class="image" src="${cartItem.imageSP}" alt="Product Image">
                                </td>
                                <td>${cartItem.nameSP}</td>
                                <td>
                                    <input class="input" type="number" name="quantity" value="1">
                                </td>
                                <td>
                                    <div class="price">
                                        <fmt:formatNumber value="${cartItem.priceSP}" type="number" pattern="#,##0 VND"/>
                                    </div>                           
                                </td>
                                <form action="Cart" method="post">
                                    <input type="hidden" name="removeProduct" value="${cartItem.idSP}">
                                    <td>
                                        <button class="button" type="submit" id="removeButton">Xóa</button>
                                    </td>
                                </form>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="total">
                <div class="left">
                    <input type="text" placeholder="Nhập mã khuyến mãi vào đây">
                    <button>Áp dụng</button>
                </div>
                <div class="right">
                    <div class="title-total">
                        <h1 class="title1">Tổng cộng</h1>
                        <h1></h1>
                    </div>
                    <div class="btnPayment">
                        <button onclick="redirectToPayment()" name="btnPayment">Thanh toán</button>
                    </div>
                </div>
            </div>
        </body>

        </html>
        <script>
            // Get the "Remove" button by its ID
            const removeButton = document.getElementById("removeButton");

            // Add a click event listener to the button
            removeButton.addEventListener("click", function () {
                // Reload the page when the button is clicked
                location.reload();
                location.reload();
            });
        </script>
        <script>
            // Lắng nghe sự kiện khi trang tải xong
            window.addEventListener('load', () => {
                // Lấy dữ liệu số lượng từ Local Storage và áp dụng cho từng dòng
                const rows = document.querySelectorAll('tr');
                rows.forEach(row => {
                    const id = row.getAttribute('data-id');
                    const input = row.querySelector('input[name="quantity"]');
                    if (input) {
                        const storedValue = localStorage.getItem(id);
                        if (storedValue !== null) {
                            input.value = storedValue;
                        }
                    }
                });

                // Lắng nghe sự kiện khi người dùng thay đổi số lượng
                const quantityInputs = document.querySelectorAll('input[name="quantity"]');
                quantityInputs.forEach(input => {
                    input.addEventListener('input', function() {
                        const id = input.closest('tr').getAttribute('data-id');
                        const quantity = input.value;
                        localStorage.setItem(id, quantity);
                        updateTotalPrice();
                    });
                });

                // Hàm cập nhật tổng giá trị
                function updateTotalPrice() {
                    let totalPrice = 0;
                    const rows = document.querySelectorAll('tr');
                    rows.forEach(row => {
                        const price = parseFloat(row.getAttribute('data-price'));
                        const input = row.querySelector('input[name="quantity"]');

                        if (input) {
                            const quantity = parseInt(input.value, 10);
                            if (!isNaN(quantity)) {
                                totalPrice += price * quantity;
                            }
                        }
                    });

                    // Hiển thị tổng giá trị đã cập nhật
                    const totalElement = document.querySelector('.title-total h1:last-child');
                    totalElement.textContent = totalPrice.toLocaleString('vi-VN') + ' VND';
                }

                // Khởi tạo tổng giá trị ban đầu
                updateTotalPrice();
            });
        </script>
        <script>
            function redirectToPayment() {
                var productIDs = [];
                var quantities = [];

                // Lặp qua tất cả các phần tử tr
                var trElements = document.querySelectorAll("tr[data-id]");
                trElements.forEach(function(tr) {
                    var id = tr.getAttribute("data-id");
                    var quantityInput = tr.querySelector("input[name='quantity']");
                    var quantity = quantityInput ? quantityInput.value : 1;

                    productIDs.push(id);
                    quantities.push(quantity);
                });

                // Tạo URL chứa thông tin sản phẩm và số lượng
                var url = "${pageContext.request.contextPath}/JSP/Payment?productIDs=" + productIDs.join(",") + "&quantities=" + quantities.join(",");
                window.location.href = url;
            }
        </script> 



        