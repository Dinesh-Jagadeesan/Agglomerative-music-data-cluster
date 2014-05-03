<html>
    <head>
        <title>Music.com</title>
    </head>
    <body><img src="<%out.print(request.getContextPath()); %>/nature-speaker-wide.jpg" width="5%" height="10%">
        <div style="background-color:#333366;width:95%;height:10%;float:right"><h1 style="text-align:justify;color:#FFFFFF">Welcome to Music.com</h1></div>
        <div style="width:20%;height:85%;float:left"></div>
        <div style="float:left;width:60%;height:85%;">
            <h2 style="color:#339999;text-align:justify">Featured songs:</h2>
        <%@page import="java.sql.*" %>
        <%
        double start=System.currentTimeMillis();
        int i=1,j=1;
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection con=DriverManager.getConnection("jdbc:odbc:Music");
        Statement smt1=con.createStatement();
        Statement smt2=con.createStatement();
        Statement smt3=con.createStatement();
        ResultSet rsa,rss,rsf=null; %>
        <table border="0"<% while(j<=2){%><tr>
          <% rss=smt2.executeQuery("SELECT * FROM SONG ORDER BY rnd(RANDOM_NO)");
                   while(rss.next()&&i<=4)
                   { %>
                   <td><% String s_id=rss.getString("S_ID");
                     String a_id=rss.getString("A_ID");
                       rsa=smt1.executeQuery("SELECT * FROM ARTIST WHERE A_ID='"+a_id+"'"); 
            while(rsa.next())
        { String a_name=rsa.getString("A_NAME");
                    %>
                   <a href="artist.jsp?p=<%= s_id%>&p1=<%= a_name %>">   
                   <img src="<%out.print(request.getContextPath()); %>/cover/<%out.print(rss.getString("S_COVER")); %>" width="150" height="150"><br></a>
                      <% out.print(rss.getString("S_NAME")); %><br> 
                      Artist:<% out.print(a_name); %><br>
                       <% rsf=smt3.executeQuery("SELECT * FROM FEATURE WHERE S_ID='"+s_id+"'");
                       while(rsf.next())
                       { String t_id=rsf.getString("TAG");
                         String st_id=rsf.getString("STYLE");
                         String m_id=rsf.getString("MOOD");
                            %>
                           Tag:<a href="tag.jsp?p=<%= t_id%>"><% out.print(t_id); %></a><br>
                           Style:<a href="style.jsp?p=<%= st_id%>&p1=<%= s_id %>"><% out.print(st_id); %></a><br>
                           Mood:<a href="mood.jsp?p=<%= m_id%>&p1=<%= s_id %>"><% out.print(m_id); %></a><br><br>
                           <%  } }%></td><% i++;}j++;i=1;} 
                           double end=System.currentTimeMillis();
                           double difference=end-start; 
                           String diff=String.valueOf(difference); %>
                           </table></div>
                           <div style="width:20%;height:85%;float:left"></div><a href="performance.jsp?p=<%= diff%>">Performance</a>
                           <div style="background-color:#333366;width:100%;height:5%;float:right;margin-top: 10%"><h5 style="text-align:center;color:#FFFFFF">Copyrights&copy reserved</h5></div>
    </body>
</html>
