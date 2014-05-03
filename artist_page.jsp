<html>
    <head>
        <title>Music.com</title>
    </head>
    <body>
         <img src="<%out.print(request.getContextPath()); %>/nature-speaker-wide.jpg" width="5%" height="10%" style="float:left">
        <div style="background-color:#333366;width:95%;height:10%;float:left"><h1 style="text-align:justify;color:#FFFFFF">Welcome to Music.com</h1></div>
        <div style="width:20%;height:85%;float:left"></div>
        <div style="float:left;width:60%;height:85%;">
        <%@page import="java.sql.*" %>
        <%
         double start=System.currentTimeMillis();
        int i=1,j=1;
        String p=request.getParameter("p");
        String p1=request.getParameter("p1");
        String mfcc=null;
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection con=DriverManager.getConnection("jdbc:odbc:Music");
        Statement smt1=con.createStatement();
        Statement smt2=con.createStatement();
        Statement smt3=con.createStatement();
        Statement smt4=con.createStatement();
        Statement smt5=con.createStatement();
        ResultSet rsa,rss,rsf,rsr,rst=null;
        rst=smt5.executeQuery("SELECT * FROM SONG WHERE S_ID='"+p+"'");
        while(rst.next())
        {
            mfcc=rst.getString("MFCC");
         }
        rsr=smt4.executeQuery("SELECT * FROM SONG WHERE S_ID='"+p+"'"); %>
      <h2 style="color:#339999;text-align:justify"><% out.print("Artist:"+p1);%></h2><br><br><%
        while(rsr.next())
        { %>
            <img src="<% out.print(request.getContextPath()); %>/cover/<%out.print(rsr.getString("S_COVER")); %>" width="532" height="250"><br>
        <audio controls>
            <source src="<% out.print(request.getContextPath()); %>/audio/<% out.print(rsr.getString("S_PATH")); %>" type="audio/mpeg" >
        </audio><br>
        <% out.print(rsr.getString("S_NAME")); %>
        <% 
        } %><hr><%
        rsa=smt1.executeQuery("SELECT * FROM ARTIST WHERE A_NAME='"+p1+"'"); 
         while(rsa.next())
        { String a_id=rsa.getString("A_ID");
          String a_name=rsa.getString("A_NAME");
        %><br>
        <% rss=smt2.executeQuery("SELECT * FROM SONG WHERE A_ID='"+a_id+"' ORDER BY ABS(MFCC-'"+mfcc+"')");
        %>
        <table border="0"><% while(j<=2){ %><tr>
      <%           
        while(rss.next()&&i<=4)
                   { %> <td> <% String s_id=rss.getString("S_ID");%>
                   <a href="artist.jsp?p=<%= s_id%>&p1=<%= a_name %>">   
                   <img src="<%out.print(request.getContextPath()); %>/cover/<%out.print(rss.getString("S_COVER")); %>" width="150" height="150"><br></a>
                      <% out.print(rss.getString("S_NAME")); %><br>                      
                       <% rsf=smt3.executeQuery("SELECT * FROM FEATURE WHERE S_ID='"+s_id+"'");
                       while(rsf.next())
                       { String t_id=rsf.getString("TAG");
                         String st_id=rsf.getString("STYLE");
                         String m_id=rsf.getString("MOOD");
                            %>
                           Tag:<a href="tag.jsp?p=<%= t_id%>"><% out.print(t_id); %></a><br>
                           Style:<a href="style.jsp?p=<%= st_id%>&p1=<%= s_id %>"><% out.print(st_id); %></a><br>
                           Mood:<a href="mood.jsp?p=<%= m_id%>&p1=<%= s_id %>"><% out.print(m_id); %></a><br>
                      <%  } %></td><% i++; }%></td><% j++; i=1;%> </tr><%}  } 
                      double end=System.currentTimeMillis();
                           double difference=end-start; 
                           String diff=String.valueOf(difference);%></table></div>
                      <div style="width:20%;height:85%;float:left"></div><a href="performance.jsp?p=<%= diff%>">Performance</a>
                           <div style="background-color:#333366;width:100%;height:5%;float:left;margin-top:20%"><h5 style="text-align:center;color:#FFFFFF">Copyrights&copy reserved</h5></div>
    </body>
</html>
