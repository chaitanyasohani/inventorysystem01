<%-- 
    Document   : newxmlinsertdb
    Created on : Sep 21, 2015, 3:01:51 PM
    Author     : leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,javax.xml.parsers.*, org.w3c.dom.*" errorPage="" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
         <link href="dev.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>newxmlinsertdb</title>
    </head>
    <body>
        
        <c:redirect url="newdisplayxmlrec.jsp" >
            <font size="5" color='green'> Congratulations ! Data inserted into database
            successfully.</font>   
        </c:redirect>
            
        <% 
       String str=(request.getParameter("file")); 
        File inputfile= new File(str);
        
        DocumentBuilderFactory dbfactory = DocumentBuilderFactory.newInstance();
        
        DocumentBuilder dbuilder = dbfactory.newDocumentBuilder();
        
        Document doc= dbuilder.parse(inputfile);

        NodeList ProductId = doc.getElementsByTagName("ProductId");
        NodeList ProductName = doc.getElementsByTagName("ProductName");
        NodeList PCompany = doc.getElementsByTagName("PCompany");
%>

<%  try{
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/test";
            String user="root";
            String pwd="sohani";
            connection =DriverManager.getConnection(url,user,pwd);
      
            for(int i=0;i<=ProductId.getLength()-1;i++)
           {
               int a=Integer.parseInt(ProductId.item(i).getFirstChild().getNodeValue());
              
                 String b= ProductName.item(i).getFirstChild().getNodeValue();
           
                 String c= PCompany.item(i).getFirstChild().getNodeValue();
                 PreparedStatement stmt=
                 connection.prepareStatement("insert into pinfo values(?,?,?)");  
                 stmt.setInt(1,a);//1 specifies the first parameter in the query  
                 stmt.setString(2,b); 
                 stmt.setString(3,c);
                 
                 
                 stmt.executeUpdate();                
           } 
      }
  
    catch(Exception e)
    {
     out.println(e);
    }
         
   %>
 
    <a href="newdisplayxmlrec.jsp">Back</a><p></p>
  
    <a href="index.jsp">Home</a><p></p>
    </body>
</html>
