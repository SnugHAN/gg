<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.* "%>

<%@ page import="java.lang.String" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我存我惠</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" type="text/css" href="css/login.css"/>
  </head> 
  <body>
     <div id="login">  
        <h1>Login</h1>  
        <form method="post" action="index.jsp">  
        	
            <input class="inpu" type="text" required="required" placeholder="账号" name="username">   
            <button class="but" type="submit" >登录</button>  
        </form>  
    </div> 
    
     <%

   String username = request.getParameter("username");
   try{
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   
   }catch(ClassNotFoundException e){
	   
	   e.printStackTrace();
   }

   try{
       //Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","hankangqi");
       if(con==null){
          System.out.println("与oracle数据库连接失败！");
      }else{
    	  System.out.println("与oracle数据库连接成功！");
      }
       Statement stmt = con.createStatement();
       String sql = "select * from hkm where username='"+username+"'";
       System.out.println(username);
       ResultSet rs = stmt.executeQuery(sql);
       //System.out.println("不错");
       if(rs.next()){
    	  // System.out.println("fdsfdf");
    	   if(rs.getString("username").equals(username)){
        	  // System.out.println("不错");
               %>
               <form method="post" action="admin.jsp">
               <input type="text" value="<%=rs.getString("username")%>" name="username" hidden>
               <input class="inp" type="submit" name="tijiao" >
               </form>
               <%
           }else {
               response.sendRedirect("index.jsp");
           }
      
       }
       else{
    	   System.out.println("不对啊！");
       }
   }catch (Exception e) {
       e.printStackTrace();
   }


%> 
  </body>
</html>
