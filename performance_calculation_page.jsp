<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Performance</title>
    </head>
    <body>
        <%@page import="java.io.*" %>
        <% String per=request.getParameter("p");
        String acc=request.getParameter("p1");
        out.print("Time efficiency="+per+"ms");%>
        <h1>Time efficiency Analysis chart</h1>
       <img src="<%out.print(request.getContextPath()); %>/chart.JPG" width="75%" height="50%">
       <br><br>
      <% out.print("Accuracy="+acc);%>
    </body>
</html>
