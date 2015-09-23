<%-- 
    Document   : newdisplayxmlrec
    Created on : Sep 21, 2015, 2:21:52 PM
    Author     : leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,javax.xml.parsers.*, org.w3c.dom.*" errorPage="" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
         <link href="dev.css" rel="stylesheet" type="text/css">
         <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <div class="goo">
            <a href="index.jsp"><i class="fa fa-arrow-left"></i></a></div>
        <div class="ooo">  
            <div class="ooo1">
     <form action="newdisplayxml.jsp" method="POST">
         <strong>Please select xml file to read:</strong>
            <br>
            <input type="file" name="file" value="" width="100" />
          <input type="SUBMIT" value="Submit">
    </form>    
           
          
    <form action="newxmlinsertdb.jsp" method="POST">
        <strong>select and insert xml file into database</strong>
            <br>
            <input type="file" name="file" value="" width="100" />
           <input type="SUBMIT" value="Submit">
    </form>      
         
        </div>

        
     <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/test"
     user="root"  password="sohani"/>
        
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from pinfo;
     </sql:query>
            
     <div class="ooo2">
       <form>
           <table class="devvv"  border="1" width="40%">
           <caption class="ooo3"> Database product info</caption>
             <tr class="devv">
                <th> Product Id </th>
                <th> Name </th> 
                <th> Company </th> 
             </tr>    
            <c:forEach var="row" items="${result.rows}">
                 <tr class="devv1">
                        <td><c:out value="${row.Pid}"/></td>
                        <td><c:out value="${row.Pname}"/></td>
                        <td><c:out value="${row.Pcompany}"/></td>  
                    </tr>
            </c:forEach>  
           </table>
        </form>
         
    </div>                   
      
    
    </body>
</html>
