<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplicationWstGrp26._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   

    <!-- Bootstrap & custom styles -->
    
    <style>
        :root {
            --primary: #005792;
            --secondary: #ffc107;
            --light: #f8f9fa;
            --dark: #003355;
            --accent: #28a745;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
           
            background-color: #f9f9f9;
        }
        
       
        
        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        .btn-primary:hover {
            background-color: var(--dark);
            border-color: var(--dark);
        }
        
        .btn-outline-primary {
            color: var(--primary);
            border-color: var(--primary);
        }
        
        .btn-outline-primary:hover {
            background-color: var(--primary);
            color: white;
        }
        
        .hero {
            background: linear-gradient(rgba(0, 87, 146, 0.85), rgba(0, 87, 146, 0.85)), url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=1600&q=80') no-repeat center center/cover;
            color: white;
            padding: 100px 0;
            margin-bottom: 50px;
        }
        
        .feature-card {
            transition: transform 0.3s, box-shadow 0.3s;
            height: 100%;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }
        
        .feature-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 25px rgba(0,0,0,0.15);
        }
        
        .section-title {
            position: relative;
            margin-bottom: 40px;
            text-align: center;
        }
        
        .section-title:after {
            content: '';
            display: block;
            width: 60px;
            height: 4px;
            background: var(--primary);
            margin: 15px auto;
            border-radius: 2px;
        }
        
        .promo-banner {
            background-color: var(--primary);
            color: white;
            padding: 40px 0;
            margin: 60px 0;
            border-radius: 10px;
        }
        
        .category-card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: all 0.3s;
            height: 100%;
        }
        
        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0,0,0,0.15);
        }
        
        .category-card img {
            transition: transform 0.5s;
            height: 200px;
            object-fit: cover;
            width: 100%;
        }
        
        .category-card:hover img {
            transform: scale(1.05);
        }
        
        .testimonial-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            height: 100%;
        }
        
        .testimonial-text {
            position: relative;
            padding: 20px;
            background: var(--light);
            border-radius: 10px;
        }
        
        .testimonial-text:after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 30px;
            border-width: 15px 15px 0;
            border-style: solid;
            border-color: var(--light) transparent transparent;
        }
        
        footer {
            background-color: var(--dark);
            color: white;
            padding: 60px 0 30px;
        }
        
        .footer-links h5 {
            border-bottom: 2px solid rgba(255,255,255,0.1);
            padding-bottom: 12px;
            margin-bottom: 20px;
        }
        
        .footer-links ul {
            list-style: none;
            padding: 0;
        }
        
        .footer-links li {
            margin-bottom: 12px;
        }
        
        .footer-links a {
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-links a:hover {
            color: white;
            text-decoration: underline;
        }
        
        .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background: rgba(255,255,255,0.1);
            color: white;
            border-radius: 50%;
            margin-right: 10px;
            transition: all 0.3s;
        }
        
        .social-icons a:hover {
            background: var(--primary);
            transform: translateY(-3px);
        }
        
        .product-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: var(--accent);
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .search-box {
            position: relative;
            max-width: 500px;
            margin: 0 auto 40px;
        }
        
        .stats-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 0;
        }
        
        .stats-label {
            font-size: 1rem;
            color: #6c757d;
            font-weight: 500;
        }
        
        @media (max-width: 768px) {
            .hero {
                padding: 60px 0;
            }
            
            .hero h1 {
                font-size: 2.2rem;
            }
            
            .stats-number {
                font-size: 2rem;
            }
        }
    </style>

</head>

<body>
    <!-- Navigation -->
  <!-- <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-car me-2"></i>Coastal Clutch & Brake
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav> -->

    <!-- Hero Section -->
     <section class="hero">
        <div class="container text-center">
            <h1 class="display-4 fw-bold mb-4">Coastal Clutch & Brake Premium Clutch & Brake Solutions</h1>
            <p class="lead mb-4">Quality automotive parts with fast shipping and expert support</p>
           
            <a href="Products.aspx" class="btn btn-light btn-lg me-2"><i class="fas fa-search"></i> Browse Products</a>
            <a href="#" class="btn btn-outline-light btn-lg"><i class="fas fa-info-circle"></i> Learn More</a>

        </div>
          </section>

    <!-- Promo Banner -->
    <div class="container">
        <div class="promo-banner text-center">
            <h2 class="mb-3">Summer Sale - Up to 25% Off!</h2>
            <p class="lead mb-4">Limited time offer on all brake systems and clutch kits</p>
            <a href="#" class="btn btn-light btn-lg">Shop Now <i class="fas fa-arrow-right ms-2"></i></a>
        </div>
    </div>

    </header>

    <!-- Services Section -->
    <section class="py-5">
        <div class="container text-center">
            <h2 class="mb-4 text-primary">Our Services</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card shadow-sm border-0">
                        <div class="card-body">
                            <i class="fas fa-cogs fa-3x text-primary mb-3"></i>
                            <h5>Clutch Repairs</h5>
                            <p>Expert clutch replacement and diagnostics for all vehicle types.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm border-0">
                        <div class="card-body">
                            <i class="fas fa-car-crash fa-3x text-primary mb-3"></i>
                            <h5>Brake Services</h5>
                            <p>Precision brake system inspections, maintenance, and fitting.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm border-0">
                        <div class="card-body">
                            <i class="fas fa-tools fa-3x text-primary mb-3"></i>
                            <h5>Gearbox Repairs</h5>
                            <p>Quality gearbox overhauls and replacements you can trust.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Featured Categories -->
    <section class="container mb-5">
        <h2 class="section-title">Product Categories</h2>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="category-card">
                    <img src="https://images.unsplash.com/photo-1552519507-88aa2dfa9fdb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" alt="Brake Systems" class="img-fluid">
                    <div class="p-4">
                        <h3>Brake Systems</h3>
                        <p>High-performance brake pads, rotors, and calipers for all vehicle types.</p>
                        <a href="#" class="btn btn-outline-primary">Explore</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="category-card">
                    <img src="https://images.unsplash.com/photo-1563720223880-4d93eef1f0c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" alt="Clutch Kits" class="img-fluid">
                    <div class="p-4">
                        <h3>Clutch Kits</h3>
                        <p>Complete clutch kits for passenger cars, trucks, and performance vehicles.</p>
                        <a href="#" class="btn btn-outline-primary">Explore</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="category-card">
                    <img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" alt="Accessories" class="img-fluid">
                    <div class="p-4">
                        <h3>Accessories</h3>
                        <p>Installation tools, fluids, and maintenance accessories for your vehicle.</p>
                        <a href="#" class="btn btn-outline-primary">Explore</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Products -->
    <section class="container mb-5">
        <h2 class="section-title">Featured Products</h2>
        <div class="row">
            <div class="col-md-3 mb-4">
                <div class="feature-card card">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1603712610496-72e9fbf05b15?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="Performance Brake Kit" style="height: 200px; object-fit: cover;">
                        <div class="product-badge">Sale</div>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Performance Brake Kit</h5>
                        <p class="card-text">High-performance brake system for sports cars and track use.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary">$249.99</span>
                            <a href="#" class="btn btn-sm btn-primary">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="feature-card card">
                    <img src="https://images.unsplash.com/photo-1553440569-bcc63803a83d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="Heavy-Duty Clutch" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">Heavy-Duty Clutch</h5>
                        <p class="card-text">Durable clutch system designed for trucks and towing applications.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary">$319.99</span>
                            <a href="#" class="btn btn-sm btn-primary">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="feature-card card">
                    <img src="https://images.unsplash.com/photo-1502161254066-6c74afbf07aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="Ceramic Brake Pads" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">Ceramic Brake Pads</h5>
                        <p class="card-text">Low-dust ceramic brake pads for smooth, quiet stopping power.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary">$89.99</span>
                            <a href="#" class="btn btn-sm btn-primary">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="feature-card card">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1553440569-bcc63803a83d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="Brake Fluid" style="height: 200px; object-fit: cover;">
                        <div class="product-badge">New</div>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Premium Brake Fluid</h5>
                        <p class="card-text">High-temperature brake fluid for performance and racing applications.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="fw-bold text-primary">$24.99</span>
                            <a href="#" class="btn btn-sm btn-primary">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="#" class="btn btn-outline-primary">View All Products <i class="fas fa-arrow-right ms-2"></i></a>
        </div>
    </section>

     <!-- Stats Section -->
    <section class="bg-light py-5">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3 col-6 mb-4">
                    <p class="stats-number">15,000+</p>
                    <p class="stats-label">Products Available</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <p class="stats-number">98%</p>
                    <p class="stats-label">Customer Satisfaction</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <p class="stats-number">2-Day</p>
                    <p class="stats-label">Avg. Shipping Time</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <p class="stats-number">18+</p>
                    <p class="stats-label">Years Experience</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="container my-5">
        <h2 class="section-title">What Our Customers Say</h2>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="testimonial-card">
                    <div class="testimonial-text mb-4">
                        <p>"The performance brake kit completely transformed my track car. Amazing stopping power and fade resistance!"</p>
                    </div>
                    <div class="d-flex align-items-center">
                        <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=100&q=80" alt="Customer" class="rounded-circle me-3" width="50" height="50" style="object-fit: cover;">
                        <div>
                            <h6 class="mb-0">Michael Johnson</h6>
                            <small class="text-muted">Professional Racer</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="testimonial-card">
                    <div class="testimonial-text mb-4">
                        <p>"I've been using Coastal Clutch products in my repair shop for years. Their quality and reliability are unmatched."</p>
                    </div>
                    <div class="d-flex align-items-center">
                        <img src="https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=100&q=80" alt="Customer" class="rounded-circle me-3" width="50" height="50" style="object-fit: cover;">
                        <div>
                            <h6 class="mb-0">Sarah Williams</h6>
                            <small class="text-muted">Auto Shop Owner</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="testimonial-card">
                    <div class="testimonial-text mb-4">
                        <p>"The customer service team helped me find exactly what I needed for my truck. The parts arrived quickly and were easy to install."</p>
                    </div>
                    <div class="d-flex align-items-center">
                        <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=100&q=80" alt="Customer" class="rounded-circle me-3" width="50" height="50" style="object-fit: cover;">
                        <div>
                            <h6 class="mb-0">James Wilson</h6>
                            <small class="text-muted">Satisfied Customer</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- Footer -->
    <footer >
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <h4>Coastal Clutch & Brake</h4>
                    <p>Providing quality automotive parts since 2005. Our products meet the highest industry standards for performance and reliability.</p>
                    <div class="social-icons mt-3">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mb-4 footer-links">
                    <h5>Shop</h5>
                    <ul>
                        <li><a href="#">Brake Systems</a></li>
                        <li><a href="#">Clutch Kits</a></li>
                        <li><a href="#">Accessories</a></li>
                        <li><a href="#">New Arrivals</a></li>
                        <li><a href="#">Special Offers</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-4 mb-4 footer-links">
                    <h5>Support</h5>
                    <ul>
                        <li><a href="#">My Account</a></li>
                        <li><a href="#">Order Status</a></li>
                        <li><a href="#">Shipping Policy</a></li>
                        <li><a href="#">Returns & Refunds</a></li>
                        <li><a href="#">Product Support</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-4 mb-4">
                    <h5>Contact Info</h5>
                    <ul class="list-unstyled">
                        <li class="mb-2"><i class="fas fa-map-marker-alt me-2"></i> 123 Automotive Way, Coastal City, CC 12345</li>
                        <li class="mb-2"><i class="fas fa-phone me-2"></i> (555) 123-4567</li>
                        <li class="mb-2"><i class="fas fa-envelope me-2"></i> info@coastalclutchbrake.com</li>
                        <li class="mb-2"><i class="fas fa-clock me-2"></i> Mon-Fri: 8:00 AM - 6:00 PM</li>
                        <li class="mb-2"><i class="fas fa-clock me-2"></i> Sat: 9:00 AM - 4:00 PM</li>
                    </ul>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <p class="mb-0">&copy; 2023 Coastal Clutch & Brake. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-md-end mb-3">
                    <a href="#" class="text-white me-3">Privacy Policy</a>
                    <a href="#" class="text-white me-3">Terms of Service</a>
                    <a href="#" class="text-white">Cookie Policy</a>
                </div>
            </div>
        </div>

    </footer>

    <script src="Scripts.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
    
  
    





    <h2 style="text-align: center">Coastal Clutch & Brake</h2>
    <div style="text-align: right">
        <asp:GridView ID="GVCustDetails" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="DSCustLogin" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID">
                <HeaderStyle HorizontalAlign="Justify" />
                <ItemStyle HorizontalAlign="Justify" />
                </asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName">
                <HeaderStyle HorizontalAlign="Justify" />
                <ItemStyle HorizontalAlign="Justify" />
                </asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName">
                <HeaderStyle HorizontalAlign="Justify" />
                <ItemStyle HorizontalAlign="Justify" />
                </asp:BoundField>
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact" SortExpression="ContactNumber">
                <HeaderStyle HorizontalAlign="Justify" />
                <ItemStyle HorizontalAlign="Justify" />
                </asp:BoundField>
                <asp:BoundField DataField="EmailAddress" HeaderText="Email" ReadOnly="True" SortExpression="EmailAddress">
                <HeaderStyle HorizontalAlign="Justify" />
                <ItemStyle HorizontalAlign="Justify" />
                </asp:BoundField>
                <asp:BoundField DataField="IDNumber" HeaderText="IDNumber" SortExpression="IDNumber">
                <HeaderStyle HorizontalAlign="Justify" />
                <ItemStyle HorizontalAlign="Justify" />
                </asp:BoundField>
                <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" />
                <asp:BoundField DataField="Suburb" HeaderText="Suburb" SortExpression="Suburb" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" />
                <asp:BoundField DataField="PostalCode" HeaderText="Code" SortExpression="PostalCode" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="DSCustLogin" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:WstGrp26ConnectionString2 %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([ContactNumber] = @original_ContactNumber) OR ([ContactNumber] IS NULL AND @original_ContactNumber IS NULL)) AND (([EmailAddress] = @original_EmailAddress) OR ([EmailAddress] IS NULL AND @original_EmailAddress IS NULL)) AND (([IDNumber] = @original_IDNumber) OR ([IDNumber] IS NULL AND @original_IDNumber IS NULL)) AND (([StreetAddress] = @original_StreetAddress) OR ([StreetAddress] IS NULL AND @original_StreetAddress IS NULL)) AND (([Suburb] = @original_Suburb) OR ([Suburb] IS NULL AND @original_Suburb IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Province] = @original_Province) OR ([Province] IS NULL AND @original_Province IS NULL)) AND (([PostalCode] = @original_PostalCode) OR ([PostalCode] IS NULL AND @original_PostalCode IS NULL))" InsertCommand="INSERT INTO [Customers] ([FirstName], [LastName], [ContactNumber], [EmailAddress], [IDNumber], [StreetAddress], [Suburb], [City], [Province], [PostalCode]) VALUES (@FirstName, @LastName, @ContactNumber, @EmailAddress, @IDNumber, @StreetAddress, @Suburb, @City, @Province, @PostalCode)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:WstGrp26ConnectionString2.ProviderName %>" SelectCommand="SELECT CustomerID, FirstName, LastName, ContactNumber, EmailAddress, IDNumber, StreetAddress, Suburb, City, Province, PostalCode FROM Customers WHERE (EmailAddress = @email)" UpdateCommand="UPDATE [Customers] SET [FirstName] = @FirstName, [LastName] = @LastName, [ContactNumber] = @ContactNumber, [EmailAddress] = @EmailAddress, [IDNumber] = @IDNumber, [StreetAddress] = @StreetAddress, [Suburb] = @Suburb, [City] = @City, [Province] = @Province, [PostalCode] = @PostalCode WHERE [CustomerID] = @original_CustomerID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([ContactNumber] = @original_ContactNumber) OR ([ContactNumber] IS NULL AND @original_ContactNumber IS NULL)) AND (([EmailAddress] = @original_EmailAddress) OR ([EmailAddress] IS NULL AND @original_EmailAddress IS NULL)) AND (([IDNumber] = @original_IDNumber) OR ([IDNumber] IS NULL AND @original_IDNumber IS NULL)) AND (([StreetAddress] = @original_StreetAddress) OR ([StreetAddress] IS NULL AND @original_StreetAddress IS NULL)) AND (([Suburb] = @original_Suburb) OR ([Suburb] IS NULL AND @original_Suburb IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Province] = @original_Province) OR ([Province] IS NULL AND @original_Province IS NULL)) AND (([PostalCode] = @original_PostalCode) OR ([PostalCode] IS NULL AND @original_PostalCode IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_ContactNumber" Type="String" />
                <asp:Parameter Name="original_EmailAddress" Type="String" />
                <asp:Parameter Name="original_IDNumber" Type="String" />
                <asp:Parameter Name="original_StreetAddress" Type="String" />
                <asp:Parameter Name="original_Suburb" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_Province" Type="String" />
                <asp:Parameter Name="original_PostalCode" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="ContactNumber" Type="String" />
                <asp:Parameter Name="EmailAddress" Type="String" />
                <asp:Parameter Name="IDNumber" Type="String" />
                <asp:Parameter Name="StreetAddress" Type="String" />
                <asp:Parameter Name="Suburb" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Province" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="email" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="ContactNumber" Type="String" />
                <asp:Parameter Name="EmailAddress" Type="String" />
                <asp:Parameter Name="IDNumber" Type="String" />
                <asp:Parameter Name="StreetAddress" Type="String" />
                <asp:Parameter Name="Suburb" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Province" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_ContactNumber" Type="String" />
                <asp:Parameter Name="original_EmailAddress" Type="String" />
                <asp:Parameter Name="original_IDNumber" Type="String" />
                <asp:Parameter Name="original_StreetAddress" Type="String" />
                <asp:Parameter Name="original_Suburb" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_Province" Type="String" />
                <asp:Parameter Name="original_PostalCode" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <hr />
    <div>
        <asp:GridView ID="GVTransactions" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AccountID" DataSourceID="DSCustTransactions" ForeColor="#333333" GridLines="None" Width="558px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Balance" DataFormatString="{0:c2}" HeaderText="Balance" SortExpression="Balance" />
                <asp:BoundField DataField="LastPaymentDate" DataFormatString="{0:d}" HeaderText="LastPaymentDate" SortExpression="LastPaymentDate" />
                <asp:BoundField DataField="NextStatementDate" DataFormatString="{0:d}" HeaderText="NextStatementDate" SortExpression="NextStatementDate" />
                <asp:BoundField DataField="AccountStatus" HeaderText="AccountStatus" SortExpression="AccountStatus" />
                <asp:BoundField DataField="CreditLimit" DataFormatString="{0:c2}" HeaderText="CreditLimit" SortExpression="CreditLimit" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="DSCustTransactions" runat="server" ConnectionString="<%$ ConnectionStrings:WstGrp26ConnectionString %>" SelectCommand="SELECT AccountID, CustomerID, Balance, LastPaymentDate, NextStatementDate, AccountStatus, CreditLimit FROM CustomerAccounts WHERE (CustomerID = @CustomerID)">
            <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
