<%-- 
    Document   : insertdb
    Created on : Sep 15, 2015, 2:35:28 PM
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
        <title> Insert operation </title>
    </head>
    <body>
        <c:if test="${ empty param.pname or empty param.qty}">
            <c:redirect url="insert.jsp" >
                <c:param name="errMsg" value="Please Enter Product and Quantity" />
            </c:redirect>
 
        </c:if>
        
         <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
           url="jdbc:mysql://localhost/test"
           user="root"  password="sohani"/>
         
         
        <sql:update dataSource="${snapshot}" var="result">
            INSERT INTO product(pname, quantity) VALUES (?,?);
            <sql:param value="${param.pname}" />
            <sql:param value="${param.qty}" />
        </sql:update>
            
        <c:if test="${result>=1}">
             <c:redirect url="insert.jsp" >
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
             </c:redirect>
        </c:if> 
     
    </body>
</html>
