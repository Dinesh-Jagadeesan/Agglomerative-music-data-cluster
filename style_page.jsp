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
        int i=1,j=1,cal=0,cal2=0;
        double ans=0;
        String p=request.getParameter("p");
        String p1=request.getParameter("p1");
        Double flux=0.0;
        ResultSet rsa,rss,rsf,rst,rss2,rss1,rss3=null;
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection con=DriverManager.getConnection("jdbc:odbc:Music");
        Statement smt1=con.createStatement();
        Statement smt2=con.createStatement();
        Statement smt3=con.createStatement();
        Statement smt4=con.createStatement();
        Statement smt5=con.createStatement();
        Statement smt6=con.createStatement();
        Statement smt7=con.createStatement();
        Statement smt8=con.createStatement();
        Statement smt9=con.createStatement();
        Statement smt10=con.createStatement();
        Statement smt11=con.createStatement();
        rss3=smt11.executeQuery("SELECT * FROM FEATURE");
        while(rss3.next())
        {
            ++cal;
        }
        smt7.executeUpdate("DELETE * FROM DISTANCE");
        smt10.executeUpdate("DELETE * FROM "+p+"");
        rst=smt4.executeQuery("SELECT * FROM SONG WHERE S_ID='"+p1+"'");
        while(rst.next())
        {
            flux=rst.getDouble("FLUX");
        }
        %> <h2 style="color:#339999;text-align:justify">
                   <% out.print("Songs in style: "+p); %>
               </h2>
                <%  rsf=smt3.executeQuery("SELECT * FROM FEATURE WHERE STYLE='"+p+"'");
        
                         while(rsf.next())
                         {   String s_idf=rsf.getString("S_ID");
                             
        
         rss=smt2.executeQuery("SELECT * FROM SONG WHERE S_ID='"+s_idf+"'");
                   while(rss.next())
                   { 
                       double flux1=rss.getDouble("FLUX");
                       double result1=0.0;
                       double result=0.0;
                       String s_ids=rss.getString("S_ID");
                       result=Math.pow((flux1-flux),2.0);
                       result1=Math.sqrt(result);
                       ++cal2;
                       smt6.executeUpdate("INSERT INTO DISTANCE(S_ID,DIFFERENCE) VALUES('"+s_idf+"','"+result1+"')");
                       smt9.executeUpdate("INSERT INTO "+p+"(S_ID,S_NAME,S_COVER,A_ID) VALUES('"+s_ids+"','"+rss.getString("S_NAME")+"','"+rss.getString("S_COVER")+"','"+rss.getString("A_ID")+"')");                 
                           } }
                 rss1=smt8.executeQuery("SELECT * FROM DISTANCE ORDER BY ABS(DIFFERENCE) ASC");%>
                                             <table border="0">
                                                 <% while(j<=2) { %> <tr> <%
                
                       while(rss1.next()&& i<=4)
                        { %> <td> <%
                           String s_idf1=rss1.getString("S_ID");
                         
                       rss2=smt5.executeQuery("SELECT * FROM "+p+" WHERE S_ID='"+s_idf1+"'");
                   while(rss2.next())
                   { %> 
                       <% String s_id=rss2.getString("S_ID");
                       String s_cover=rss2.getString("S_COVER");
                       String s_name=rss2.getString("S_NAME");
                       String a_id=rss2.getString("A_ID");
                       rsa=smt1.executeQuery("SELECT * FROM ARTIST WHERE A_ID='"+a_id+"'");
                       while(rsa.next())
        { String a_name=rsa.getString("A_NAME");
                       %>
                       <a href="artist.jsp?p=<%= s_id%>&p1=<%= a_name%>">   
                   <img src="<%out.print(request.getContextPath()); %>/cover/<%= s_cover%>" width="150" height="150"><br></a>
                      <% out.print(s_name); %><br>
                      Artist:<% out.print(a_name);                      
                       %><br><% }   }%> </td>  <%i++;}%> </tr> <% j++; i=1;} 
                       double end=System.currentTimeMillis();
                           double difference=end-start; 
                           String diff=String.valueOf(difference);
                           ans=(cal/cal2);
                         String ans2=String.valueOf(ans);%> </table></div> 
                          <div style="width:20%;height:85%;float:left"></div><a href="performance.jsp?p=<%= diff%>&p1=<%= ans2%>">Performance</a>
                           <div style="background-color:#333366;width:100%;height:5%;float:right"><h5 style="text-align:center;color:#FFFFFF">Copyrights&copy reserved</h5></div>
    </body>
</html>
