<%-- 
    Document   : updateddb
    Created on : Sep 15, 2015, 4:40:55 PM
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
        <title>Updated page</title>
    </head>
    <body>
         <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
         url="jdbc:mysql://localhost/test"
         user="root"  password="sohani"/> 
         
        <sql:update dataSource="${snapshot}" var="count">
            UPDATE product SET pname = ?, quantity= ?
            WHERE pid='${param.id}'
            <sql:param value="${param.pname}" />
            <sql:param value="${param.qty}" />
        </sql:update>
             <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations ! Data updated
            successfully.</font>
              <a href="index.jsp">Go Home</a>          
        </c:if>
         <c:redirect url="insert.jsp" >
                
            </c:redirect>      
    </body>
</html>
