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
        String p=request.getParameter("p");
        int i=1,j=1,cal=0,cal2=0;
        double ans=0;
        ResultSet rsa,rss,rsf,rss1,rss2=null;
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection con=DriverManager.getConnection("jdbc:odbc:Music");
        Statement smt1=con.createStatement();
        Statement smt2=con.createStatement();
        Statement smt3=con.createStatement();
        Statement smt4=con.createStatement();
        Statement smt5=con.createStatement();
        Statement smt6=con.createStatement();
        rss2=smt6.executeQuery("SELECT * FROM FEATURE");
        while(rss2.next())
        {
            ++cal;
        }
        smt5.executeUpdate("DELETE * FROM "+p+"");
        %><h2 style="color:#339999;text-align:justify">
                   <% out.print("Songs in tag:"+p); %>
               </h2>
     <%  rsf=smt3.executeQuery("SELECT * FROM FEATURE WHERE TAG='"+p+"' ORDER BY rnd(RANDOM_NO)"); %>
        <table> <%while(j<=2){ %> <tr>
                  <%       while(rsf.next())
                         {   String s_idf=rsf.getString("S_ID");
                             
        
         rss=smt2.executeQuery("SELECT * FROM SONG WHERE S_ID='"+s_idf+"'");
                   while(rss.next())
                   { 
                       String s_id=rss.getString("S_ID");
                       String s_cover=rss.getString("S_COVER");
                       String s_name=rss.getString("S_NAME");
                       String a_id=rss.getString("A_ID");
                       ++cal2;
                       smt4.executeUpdate("INSERT INTO "+p+"(S_ID,S_NAME,S_COVER,A_ID) VALUES('"+s_id+"','"+s_name+"','"+s_cover+"','"+a_id+"')");
                    }
          rss1=smt2.executeQuery("SELECT * FROM "+p+" WHERE S_ID='"+s_idf+"'");
                   while(rss1.next())
                   { 
                       String s_id=rss1.getString("S_ID");
                       String s_cover=rss1.getString("S_COVER");
                       String s_name=rss1.getString("S_NAME");
                       String a_id=rss1.getString("A_ID");
                        rsa=smt1.executeQuery("SELECT * FROM ARTIST WHERE A_ID='"+a_id+"'"); %>
        
                  <%     while(rsa.next()&&i<=4)
        { String a_name=rsa.getString("A_NAME");
                       %><td>
                       <a href="artist.jsp?p=<%= s_id%>&p1=<%= a_name%>">   
                   <img src="<%out.print(request.getContextPath()); %>/cover/<%= s_cover%>" width="150" height="150"><br></a>
                      <% out.print(s_name); %><br> 
                      Artist:<% out.print(a_name); %><br>                     
                       </td> <% i++;}}} j++; i=1;} 
                       double end=System.currentTimeMillis();
                           double difference=end-start; 
                           String diff=String.valueOf(difference);
                       ans=(cal/cal2);
                       String ans2=String.valueOf(ans);%>   </table>
        </div>
        <div style="width:20%;height:85%;float:left"></div><a href="performance.jsp?p=<%= diff%>&p1=<%= ans2%>">Performance</a>
                           <div style="background-color:#333366;width:100%;height:5%;float:right"><h5 style="text-align:center;color:#FFFFFF">Copyrights&copy reserved</h5></div>
    </body>
</html>
