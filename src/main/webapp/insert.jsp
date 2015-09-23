<%-- 
    Document   : insert
    Created on : Sep 15, 2015, 2:28:36 PM
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
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Insert Data</title>
    </head>

    <body>
        <div class="goo">
            <a href="index.jsp"><i class="fa fa-arrow-left"></i></a></div>
        
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
         url="jdbc:mysql://localhost/test"
        user="root"  password="sohani"/>
    
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from product;
        </sql:query>    
    <div class="ooo">  
       <div class="ooo1">
       <form>
           <table class="devvv" border="1" width="40%">
               <caption class="ooo3"> PRODUCT LIST</caption>
             <tr class="devv">
                <th> Product Id </th>
                <th> Product Name </th> 
                <th> Quantity </th               
             </tr>    
            <c:forEach var="row" items="${result.rows}">
                    <tr class="devv1">
                        <td><c:out value="${row.pid}"/></td>
                        <td><c:out value="${row.pname}"/></td>
                        <td><c:out value="${row.quantity}"/></td> 
                        <td><a style="color:#1BA39C;" href ="update.jsp?pid=<c:out value="${row.pid}"/>"><i class="fa fa-pencil-square"></i></a></td>
                        <td><a style="color: red;" href="javascript:confirmGo('confirm to delete this record?','delete.jsp?pid=<c:out value="${row.pid}"/>')"><i class="fa fa-trash-o"></i></a> </td>
                    </tr>
                </c:forEach>  
           </table>
       </form>
          
       </div>
    
    
        <div class="ooo2">
    <form name="myform" action="insertdb.jsp" method="post" onsubmit="return validateform()">
            <table border="0" cellspacing="2" cellpadding="5">
                 <thead>
                    <tr>
                        <th class="ooo3" colspan="2">Enter Information</th>
                    </tr>
                </thead>
                 <tbody>
                    <tr>
                        <td><label>PRODUCT NAME</label></td>
                        <td>
                            <div class="g1">
                            <input type="text" placeholder="Enter Your Product Name" name="pname"/>
                            </div>
                        </td>
                        
                    </tr>
                    <tr>
                        <td><label>QUANTITY</label></td>
                        <td>
                             <div class="g1">
                            <input type="text" placeholder="Enter Your Product Quantity" name="qty"/>
                             </div>
                            <span id="numloc"></span><br/>  
                        </td>
                    </tr>
                    <tr class="g1">
                        <td><input type="submit" value="Save"/></td>
                        <td style="float: right;width:100%"><input type="reset" value="reset"/></td>
                    </tr>
                </tbody>
            </table>
                 
        </form>   
    </div>
        <div class="clr"></div>
    </div>
        <script>  
    function validateform()
    {  
      var name=document.myform.pname.value;    
      var qty= document.myform.qty.value
      if (name==null || name=="")
       {  
         alert("Name can't be blank");  
         return false;  
       } 
      if (isNaN(qty))
       {  
          document.getElementById("numloc").innerHTML="Enter Numeric value only";  
          return false;  
         } else
        {  
          return true;  
        }  
       } 
           
    </script> 
     <script>
            function confirmGo(m,u)
            {
                if (confirm (m) )
                {
                    window.location=u;
                }
            }
        </script>
        
       
    </body>
</html>
