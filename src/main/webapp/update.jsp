<%-- 
    Document   : update
    Created on : Sep 15, 2015, 4:15:50 PM
    Author     : leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
         <link href="dev.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update operation</title>
    </head>
    <body>
         <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
         url="jdbc:mysql://localhost/test"
         user="root"  password="sohani"/>
         
         <sql:query dataSource="${snapshot}" var="result">
            SELECT * from product where pid=?;
            <sql:param value="${param.pid}" />
        </sql:query>
            
            <form action="updateddb.jsp" method="post">
                <table border="0" width="40%">
                     <caption>Update Product</caption>
                <tr>
                     <th>Product Name</th>
                    <th>Quantity</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td> <input type="hidden" value="${param.pid}" name="id"/>
                            <input type="text" value="${row.pname}" name="pname"/>
                        </td>
                        <td><input type="text" value="${row.quantity}" name="qty" </td>
                        <td> <input type="submit" value="Update" /> </td>  
                    </tr>   
                </c:forEach>
                </table>
            </form>     
       
    </body>
</html>
