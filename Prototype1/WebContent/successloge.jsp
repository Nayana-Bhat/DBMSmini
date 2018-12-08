<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logged In</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: "Lato", sans-serif;}

.tablink {
    background-color: #555;
    color: white;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    font-size: 17px;
    width: 25%;
}

.tablink:hover {
    background-color: #b3b3ff;
}

/* Style the tab content */
.tabcontent {
    color: white;
    display: none;
    padding: 50px;
    text-align: center;
}

#Books {background-color:red;}
#Authors {background-color:yellow;}
#Publishers {background-color:pink;}
#Journals {background-color:orange;}
</style>

</head>
<body background="xyz.jpg">
<center>


<marquee> Make sure the author information and publisher information is added before adding books to the collection.</marquee>
<br><br>

<div id="Books" class="tabcontent">
  <h1>Books</h1>
  <p><a href="addbooks.jsp">ADD BOOKS</a><br><br>
     <a href="deletebooks.jsp">DELETE BOOKS</a><br><br>
</p>
</div>

<div id="Authors" class="tabcontent">
  <h1>Authors</h1>
  <p><a href="addauthor.jsp">ADD AUTHOR INFORMATION</a><br><br>
     <a href="deleteauthor.jsp">DELETE AUTHOR INFORMATION</a><br><br>
</p> 
</div>

<div id="Publishers" class="tabcontent">
  <h1>Publishers</h1>
  <p><a href="addpub.jsp">ADD PUBLISHER INFORMATION</a><br><br>
     <a href="deletepub.jsp">DELETE PUBLISHER INFORMATION</a><br><br>
</p>
</div>

<div 
id="Journals" class="tabcontent">
  <h1>Journals</h1>
  <p><a href="addjournals.jsp">ADD JOURNAL</a><br><br>
     <a href="deletejournals.jsp">DELETE JOURNAL</a><br><br>
</p>
</div>

<button class="tablink" onclick="openCity('Books', this, 'red')" id="defaultOpen">Books</button>
<button class="tablink" onclick="openCity('Authors', this, 'green')">Authors</button>
<button class="tablink" onclick="openCity('Publishers', this, 'blue')">Publishers</button>
<button class="tablink" onclick="openCity('Journals', this, 'orange')">Journals</button>

<script>
function openCity(cityName,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(cityName).style.display = "block";
    elmnt.style.backgroundColor = color;

}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
<br><br><br><br>
<form action="employee.jsp" method="post">
<br><br>
<a href="stats.jsp">GET STATISTICS</a><br>
<br>
<input type="submit" name="logout" value="logout">
</form>
</center>

</body>
</html>