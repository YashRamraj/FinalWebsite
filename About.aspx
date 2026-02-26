<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplicationWstGrp26.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
   
    <!--<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Coastal Clutch & Brake</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> -->
       
    <style>
        :root {
            --primary: #005792;
            --secondary: #ffc107;
            --light: #f8f9fa;
            --dark: #003355;
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
        
        .page-header {
            background: linear-gradient(rgba(0, 87, 146, 0.85), rgba(0, 87, 146, 0.85)), url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=1600&q=80') no-repeat center center/cover;
            color: white;
            padding: 80px 0;
            margin-bottom: 50px;
        }
        
        .section {
            padding: 60px 0;
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
        
        .history-timeline {
            position: relative;
            padding-left: 30px;
            border-left: 3px solid var(--primary);
            margin-left: 15px;
        }
        
        .timeline-item {
            position: relative;
            margin-bottom: 30px;
        }
        
        .timeline-item:before {
            content: '';
            position: absolute;
            left: -38px;
            top: 5px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: var(--primary);
            border: 4px solid white;
            box-shadow: 0 0 0 3px var(--primary);
        }
        
        .team-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: all 0.3s;
            height: 100%;
        }
        
        .team-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 25px rgba(0,0,0,0.15);
        }
        
        .team-img {
            height: 250px;
            object-fit: cover;
            width: 100%;
        }
        
        .values-card {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            height: 100%;
            text-align: center;
            transition: all 0.3s;
        }
        
        .values-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0,0,0,0.15);
        }
        
        .values-icon {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 20px;
        }
        
        .contact-info-card {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            height: 100%;
        }
        
        .contact-icon {
            width: 50px;
            height: 50px;
            background: var(--primary);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            margin-right: 15px;
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
        
        .workshop-section {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }
        
        .workshop-image {
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 20px;
        }
        
        @media (max-width: 768px) {
            .page-header {
                padding: 60px 0;
            }
            
            .stats-number {
                font-size: 2rem;
            }
        }
    </style>

    <!-- Navigation 
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
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
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
                <div class="d-flex">
                    <a href="#" class="btn btn-outline-primary me-2"><i class="fas fa-shopping-cart"></i> Cart</a>
                    <a href="#" class="btn btn-primary"><i class="fas fa-user"></i> Login</a>
                </div>
            </div>
        </div>
    </nav> -->

    <!-- Page Header -->
    <header class="page-header">
        <div class="container text-center">
            <h1 class="display-4 fw-bold mb-4">About Coastal Clutch & Brake</h1>
            <p class="lead mb-4">Your trusted partner in automotive excellence since 2005</p>
        </div>
    </header>

    <!-- Company History Section -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">Our History</h2>
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="history-timeline">
                        <div class="timeline-item">
                            <h3>2005</h3>
                            <h4>Company Founded</h4>
                            <p>Coastal Clutch & Brake was established with a vision to provide high-quality automotive parts with exceptional customer service.</p>
                        </div>
                        <div class="timeline-item">
                            <h3>2010</h3>
                            <h4>Expanded Product Line</h4>
                            <p>We expanded our product offerings to include a full range of clutch and brake systems for both domestic and import vehicles.</p>
                        </div>
                        <div class="timeline-item">
                            <h3>2015</h3>
                            <h4>New Headquarters</h4>
                            <p>Moved to our current 20,000 sq ft facility with state-of-the-art inventory management and distribution capabilities.</p>
                        </div>
                        <div class="timeline-item">
                            <h3>2020</h3>
                            <h4>Online Store Launch</h4>
                            <p>Launched our e-commerce platform to serve customers across the country with fast shipping and expert support.</p>
                        </div>
                        <div class="timeline-item">
                            <h3>2023</h3>
                            <h4>Industry Recognition</h4>
                            <p>Received the "Excellence in Automotive Parts" award from the National Automotive Suppliers Association.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="workshop-section">
                        <div class="workshop-image">
                            <img src="https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80" alt="Our Workshop" class="img-fluid rounded">
                        </div>
                        <h3>Our Workshop</h3>
                        <p>Our state-of-the-art workshop is where innovation meets craftsmanship. Equipped with the latest tools and staffed by certified technicians, we test and refine every product to ensure it meets our rigorous quality standards.</p>
                        <p>From precision machining to thorough quality control, our workshop is the heart of our operation, where we develop the high-performance clutch and brake systems that our customers trust.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="bg-light py-5">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3 col-6 mb-4">
                    <p class="stats-number">18+</p>
                    <p class="stats-label">Years Experience</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <p class="stats-number">15,000+</p>
                    <p class="stats-label">Products Available</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <p class="stats-number">50,000+</p>
                    <p class="stats-label">Satisfied Customers</p>
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <p class="stats-number">98%</p>
                    <p class="stats-label">Customer Satisfaction</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="section bg-light">
        <div class="container">
            <h2 class="section-title">Meet Our Team</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="team-card">
                        <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" alt="John Smith" class="team-img">
                        <div class="p-4">
                            <h3>John Smith</h3>
                            <p class="text-primary">Founder & CEO</p>
                            <p>With over 25 years in the automotive industry, John founded Coastal Clutch & Brake with a vision for quality and reliability.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="team-card">
                        <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" alt="Sarah Johnson" class="team-img">
                        <div class="p-4">
                            <h3>Sarah Johnson</h3>
                            <p class="text-primary">Technical Director</p>
                            <p>Sarah leads our product development team with expertise in automotive engineering and quality assurance.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="team-card">
                        <img src="https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" alt="Michael Chen" class="team-img">
                        <div class="p-4">
                            <h3>Michael Chen</h3>
                            <p class="text-primary">Sales Manager</p>
                            <p>Michael heads our sales team and ensures our customers receive the best service and product recommendations.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Mission & Values Section -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">Our Mission & Values</h2>
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="values-card">
                        <div class="values-icon">
                            <i class="fas fa-bullseye"></i>
                        </div>
                        <h3>Our Mission</h3>
                        <p>To provide automotive professionals and enthusiasts with the highest quality clutch and brake systems, backed by expert technical support and exceptional customer service.</p>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="values-card">
                        <div class="values-icon">
                            <i class="fas fa-eye"></i>
                        </div>
                        <h3>Our Vision</h3>
                        <p>To be the leading supplier of automotive clutch and brake systems, recognized for our innovation, quality, and commitment to customer satisfaction.</p>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="values-card">
                        <div class="values-icon">
                            <i class="fas fa-medal"></i>
                        </div>
                        <h3>Quality</h3>
                        <p>We never compromise on quality. Every product undergoes rigorous testing to ensure it meets our high standards.</p>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="values-card">
                        <div class="values-icon">
                            <i class="fas fa-handshake"></i>
                        </div>
                        <h3>Integrity</h3>
                        <p>We conduct business with honesty and transparency, building trust with our customers and partners.</p>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="values-card">
                        <div class="values-icon">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h3>Innovation</h3>
                        <p>We continuously invest in research and development to bring innovative solutions to the automotive market.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Information -->
    <section class="section bg-light">
        <div class="container">
            <h2 class="section-title">Contact Us</h2>
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="contact-info-card">
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <div class="d-flex">
                                    <div class="contact-icon">
                                        <i class="fas fa-map-marker-alt"></i>
                                    </div>
                                    <div>
                                        <h4>Address</h4>
                                        <p>123 Automotive Way<br>Coastal City, CC 12345</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="d-flex">
                                    <div class="contact-icon">
                                        <i class="fas fa-phone"></i>
                                    </div>
                                    <div>
                                        <h4>Phone</h4>
                                        <p>(555) 123-4567</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="d-flex">
                                    <div class="contact-icon">
                                        <i class="fas fa-envelope"></i>
                                    </div>
                                    <div>
                                        <h4>Email</h4>
                                        <p>info@coastalclutchbrake.com</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="d-flex">
                                    <div class="contact-icon">
                                        <i class="fas fa-clock"></i>
                                    </div>
                                    <div>
                                        <h4>Business Hours</h4>
                                        <p>Mon-Fri: 8:00 AM - 6:00 PM<br>Sat: 9:00 AM - 4:00 PM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center mt-4">
                            <a href="#" class="btn btn-primary me-2"><i class="fas fa-map-marked-alt me-2"></i> Get Directions</a>
                            <a href="#" class="btn btn-outline-primary"><i class="fas fa-envelope me-2"></i> Send Message</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


</asp:Content>
