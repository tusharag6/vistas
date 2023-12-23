<%@ page import="pojo.Hotel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <title>Hotel Management Admin Panel</title>
    <style>
        <%@ include file="assets/css/sidebar.css"%>
        <%@ include file="assets/css/hotel.css"%>
    </style>
    <script src="https://kit.fontawesome.com/ac01cc78a8.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%@ include file="sidebar.jsp" %>
    <div class="content">
        <div class="header">
            <h1>Hotel Management</h1>
            <div class="crud-buttons">
                <a href="add-hotel.jsp" >
                    <i class="fa-regular fa-square-plus" style="margin-right: 5px; border-radius: 50px"></i> Add Hotel
                </a>
            </div>
        </div>
        <div class="table-card">
            <table class="hotel-table">
                <thead>
                <tr>
                    <th>Hotel ID</th>
                    <th>Hotel Name</th>
                    <th>Location</th>
                    <th>Rating</th>
                    <th>Amenities</th>
                    <th>Room Price</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <% List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels");
                    if (hotels != null && !hotels.isEmpty()) {
                        for (Hotel hotel : hotels) { %>
                <tr class="hotel-item">
                    <td><%= hotel.getHotelId() %></td>
                    <td><%= hotel.getHotelName() %></td>
                    <td><%= hotel.getHotelAddress() %></td>
                    <td><%= hotel.getHotelRating() %></td>
                    <td><%= hotel.getHotelAmenities() %></td>
                    <td><%= hotel.getRoomPrice() %></td>
                    <td>
                        <a href="HotelEditServlet?id=<%= hotel.getHotelId() %>">
                            <i class="fas fa-edit" title="Edit" style="margin-right: 10px"></i>
                        </a>
                        <a href="HotelDeleteServlet?id=<%= hotel.getHotelId() %>">
                            <i class="fas fa-trash-alt" title="Delete"></i>
                        </a>
                    </td>
                </tr>
                <% }
                } else { %>
                <tr>
                    <td colspan="7">No hotels available.</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
