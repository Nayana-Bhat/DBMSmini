<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.container {
    position: relative;
    width: 100%;
}

.image {
  opacity: 1;
  display: block;
  width: 100%;
  height: 50%;
  transition: .5s ease;
  backface-visibility: hidden;
}

.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

.container:hover .image {
  opacity: 0.3;
}

.container:hover .middle {
  opacity: 1;
}

.text {
  background-color: #ff4d4d;
  color: black;
  font-size: 16px;
  padding: 16px 32px;
}
</style>
</head>

<body bgcolor="#00001a">

<div class="container">
  <img src="dbms1.jpg" alt="Avatar" class="image" style="width:100%">
  <div class="middle">
    <div class="text">WELCOME TO LIBRARY MANAGEMENT SYSTEM</div>
    <a href="default.jsp">Click to Continue...</a>
  </div>
</div>



</body>
</html>
