<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplicationWstGrp26.Contact" %>




  
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
       <style>
    body { font-family: 'Segoe UI', sans-serif; background-color: #f9f9f9; margin: 0; padding: 0; }
    .contact-section { max-width: 900px; margin: 40px auto; padding: 30px; background: #fff; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
    .contact-header { text-align: center; margin-bottom: 30px; }
    .contact-header h1 { color: #003366; margin-bottom: 10px; }
    .contact-details { line-height: 1.8; font-size: 1.1rem; color: #333; }
    .contact-details strong { color: #003366; }
    .hours-table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    .hours-table th, .hours-table td { border-bottom: 1px solid #ddd; padding: 8px; text-align: left; }
    .map-container { margin-top: 30px; text-align: center; }
    iframe { border: 0; width: 100%; height: 350px; border-radius: 8px; }
    @media (max-width: 600px) {
        .contact-section { padding: 20px; }
        iframe { height: 250px; }
    }
</style>
    <div class="contact-section">
        <div class="contact-header">
            <h1>Contact Coastal Clutch & Brake</h1>
            <p>We’re here to assist you with reliable parts and trusted service.</p>
        </div>

        <div class="contact-details">
            <p><strong>Address 1:</strong> 14 Bay Terrace, South Beach, Durban, 4001</p>
            <p><strong>Address 2:</strong> 15 Ceramic Curve, Richards Bay</p>
            <p><strong>Phone:</strong> 031 368 6395</p>

            <h4>Operating Hours</h4>
            <table class="hours-table">
                <tr><th>Day</th><th>Hours</th></tr>
                <tr><td>Sunday</td><td>Closed</td></tr>
                <tr><td>Monday</td><td>7:30 am – 5 pm</td></tr>
                <tr><td>Tuesday</td><td>7:30 am – 5 pm</td></tr>
                <tr><td>Wednesday</td><td>7:30 am – 5 pm</td></tr>
                <tr><td>Thursday</td><td>7:30 am – 5 pm</td></tr>
                <tr><td>Friday</td><td>7:30 am – 5 pm</td></tr>
                <tr><td>Saturday</td><td>8 am – 12 pm</td></tr>
            </table>
        </div>

        <div class="map-container">
            <h4>Find Us</h4>
            <!-- Google Map Embed (Durban Branch) -->
            <iframe 
                src="https://www.google.com/maps?q=14+Bay+Terrace,+South+Beach,+Durban,+4001&output=embed"
                allowfullscreen="">
            </iframe>
        </div>
    </div>
</asp:Content>
