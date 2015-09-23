<%-- 
    Document   : displayxml
    Created on : Sep 21, 2015, 2:33:13 PM
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
        <title> Product Information </title>
    </head>
    <body>
        <% 
       String str=(request.getParameter("file"));
   
       out.println(str);
        
        File inputfile= new File(str);
        
        DocumentBuilderFactory dbfactory = DocumentBuilderFactory.newInstance();
        
        DocumentBuilder dbuilder = dbfactory.newDocumentBuilder();
        
        Document doc= dbuilder.parse(inputfile);

        NodeList ProductId = doc.getElementsByTagName("ProductId");
        NodeList ProductName = doc.getElementsByTagName("ProductName");
        NodeList PCompany = doc.getElementsByTagName("PCompany");
       
%>


<table border="1">
<%
int i;
for(i=0;i<=ProductId.getLength()-1;i++)
{
%>

<tr>
<td>

 <%= ProductId.item(i).getFirstChild().getNodeValue()%>

</td>
<td>
    <%= ProductName.item(i).getFirstChild().getNodeValue()%>
    
</td>
<td>
    <%= PCompany.item(i).getFirstChild().getNodeValue()%>
   
</td>

</tr>

<%
   
}
%>
</table>
 
  <a href="newdisplayxmlrec.jsp">Back</a><p></p>
  
  <a href="insert.jsp">Home</a><p></p>
    </body>
</html>
