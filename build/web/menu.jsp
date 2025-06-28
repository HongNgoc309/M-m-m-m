<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu - Mam Mam</title>
    <link rel="stylesheet" href="css/menu.css">
    <script>
        function filterMenu(type) {
            const items = document.querySelectorAll('.product-item');
            items.forEach(item => {
                item.style.display = (type === 'all' || item.dataset.type === type) ? 'block' : 'none';
            });

            document.querySelectorAll('.category-list li').forEach(li => li.classList.remove('active'));
            document.getElementById(type).classList.add('active');
        }

        window.onload = function () {
            filterMenu('starter');
        };

        function addToCart(name, price, image) {
            fetch('add-to-cart', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({
                    name: name,
                    price: price,
                    image: image,
                    note: ''
                })
            })
            .then(response => {
                if (response.ok) {
                    alert(" Đã thêm vào giỏ hàng!");
                } else {
                    alert(" Thêm vào giỏ hàng thất bại!");
                }
            })
            .catch(error => {
                console.error("Lỗi:", error);
                alert(" Lỗi kết nối server!");
            });
        }
    </script>
</head>
<body>

<header>
    <div class="logo">
        <img src="images/logo.png" alt="Mam Mam Logo">
    </div>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="MenuServlet">Menu</a>
        <a href="cart.jsp">Cart</a>
        <button class="login-btn" onclick="openLoginModal()">Login</button>
    </nav>
</header>

<!-- Thanh trên cùng -->
<div class="menu-top-bar">
    <h2>Home > Menu</h2>
    <input type="text" class="search-box" placeholder="Search...">
</div>

<!-- Nội dung chính -->
<div class="menu-page">
    <!-- Sidebar -->
    <aside class="sidebar">
        <h3>Menu</h3>
        <ul class="category-list">
            <li id="starter" class="active" onclick="filterMenu('starter')">Khai vị & Ăn kèm</li>
            <li id="meat" onclick="filterMenu('meat')">Thịt</li>
            <li id="seafood" onclick="filterMenu('seafood')">Hải sản</li>
            <li id="rice" onclick="filterMenu('rice')">Cơm & Canh</li>
            <li id="hotpot" onclick="filterMenu('hotpot')">Lẩu</li>
        </ul>
    </aside>

    <!-- Danh sách món -->
    <main class="menu-content">
        <div class="product-list">

            <!-- Salad hoa quả -->
            <div class="product-item" data-type="starter">
                <img src="images/salad_hoa_qua.jpg" alt="Salad hoa quả">
                <p class="product-name">Salad hoa quả</p>
                <p class="product-price">99.000</p>
                <button class="add-to-cart-btn"
                        onclick="addToCart('Salad hoa quả', 99000, 'salad_hoa_qua.jpg')">Add to cart</button>
            </div>

            <!-- Salad cá ngừ -->
            <div class="product-item" data-type="starter">
                <img src="images/salad_ca_ngu_79.jpg" alt="Salad cá ngừ">
                <p class="product-name">Salad cá ngừ</p>
                <p class="product-price">79.000</p>
                <button class="add-to-cart-btn"
                        onclick="addToCart('Salad cá ngừ', 79000, 'salad_ca_ngu_79.jpg')">Add to cart</button>
            </div>

            <!-- Thịt -->
            <div class="product-item" data-type="meat">
                <img src="images/bachibomatong.jpg" alt="Ba chỉ bò mật ong">
                <p class="product-name">Ba chỉ bò mật ong</p>
                <p class="product-price">159.000</p>
                <button class="add-to-cart-btn" onclick= "addToCart('Ba chỉ bò mật ong', 159000, 'bachibomatong.jpg')">Add to cart</button>
            </div>
            <div class="product-item" data-type="meat">
                <img src="images/suon_heo_gabi_139.jpg" alt="Sườn heo Gabi">
                <p class="product-name">Sườn heo gabi</p>
                <p class="product-price">139.000</p>
                <button class="add-to-cart-btn" onclick="addToCart('Sườn heo Gabi', 139000, 'suon_heo_gabi_139.jpg')">Add to cart</button>
            </div>     
            
            <!-- Món hải sản -->
            <div class="product-item" data-type="seafood">
                <img src="images/bach_tuoc_xao_cay_179.jpg" alt="Bạch tuộc xào cay">
                <p class="product-name">Bạch tuộc xào cay</p>
                <p class="product-price">179.000</p>
                <button class="add-to-cart-btn" onclick="addToCart('Bạch tuộc xào cay', 179000, 'bach_tuoc_xao_cay_179.jpg')">Add to cart</button>
            </div>

            <!-- Cơm & canh -->
            <div class="product-item" data-type="rice">
                <img src="images/com_rang_kim_chi_79.jpg" alt="Cơm rang kim chi">
                <p class="product-name">Cơm rang kim chi</p>
                <p class="product-price">79.000</p>
                <button class="add-to-cart-btn" onclick="addToCart('Cơm trộn Hàn Quốc', 79000, 'com_rang_kim_chi_79.jpg')">Add to cart</button>
            </div>

            <!-- Lẩu -->
            <div class="product-item" data-type="hotpot">
                <img src="images/lau_quan_doi_309.jpg" alt="Lẩu quân đội">
                <p class="product-name">Lẩu thập cẩm</p>
                <p class="product-price">309.000</p>
                <button class="add-to-cart-btn" onclick="addToCart('Lẩu quân đội', 309000, 'lau_quan_doi_309.jpg')">Add to cart</button>
            </div>
        </div>
    </main>
</div>

<!-- Footer -->
<footer>
    <div class="footer-content">
        <div class="contact-info">
            <h3>CONTACT INFORMATION</h3>
            <p>Mam Mam Korean Food<br>
                Address: FPT University, Da Nang<br>
                HOTLINE: 0123.456.789<br>
                Email: mammam.food@gmail.com
            </p>
        </div>
        <div class="logo-footer">
            <img src="images/logo.png" alt="Mam Mam Logo">
        </div>
    </div>
</footer>

</body>
</html>
