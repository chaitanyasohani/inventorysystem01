<%-- 
    Document   : delete
    Created on : Sep 15, 2015, 5:15:35 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Operation  </title>
    </head>
    <body>
         <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
         url="jdbc:mysql://localhost/test"
         user="root"  password="sohani"/>
         
         <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM product
            WHERE pid='${param.pid}'
        </sql:update>
         <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations ! Data deleted
            successfully.</font>
        <a href="index.jsp">Go Home</a>          
        </c:if> <c:redirect url="insert.jsp" >
                
            </c:redirect>
        
    </body>
</html>
