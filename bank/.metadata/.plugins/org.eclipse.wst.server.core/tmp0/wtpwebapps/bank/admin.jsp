<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.* "%>

<%@ page import="java.lang.String" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我存我惠查询</title>
<link rel="stylesheet" type="text/css" href="css/admin.css"/>
<link rel="stylesheet" type="text/css" href="css/login.css"/>
</head>
<body>
<div id="login">
 <%
 String username= request.getParameter("username");
 //out.println(username);
 String money= request.getParameter("money");
 String name= request.getParameter("name");
  //System.out.println(username); 

   try{
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   
   }catch(ClassNotFoundException e){
	   
	   e.printStackTrace();
   }

   try{
       //Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","hankangqi");
       /*if(con==null){
          System.out.println("与oracle数据库连接失败！");
      }else{
           System.out.println("与oracle数据库连接成功！");
      }*/
       Statement stmt = con.createStatement();
       String sql = "select * from hkm where username='"+username+"'";
       //System.out.println(username);
       ResultSet rs = stmt.executeQuery(sql);
       //System.out.println("不错");
       if(rs.next()){
    	 // System.out.println("fdsfdf");
    	 
    	 //System.out.println(mo);
    	   if(rs.getInt("money")>0&rs.getInt("money")<100000){
        	  // System.out.println("不错");
               //response.sendRedirect("admin.jsp");
    		  %>
    	    	 <div >
    	    	 <table border="1">
    	    	 <tr class="biao">
    	         <tr><td>尊敬的<%=rs.getString("name") %>，您的大驾光临让我们蓬荜生辉，您的余额为:<%=rs.getInt("money")%>请努力存钱哦</td></tr>
    	         <tr><td>姓名：<%=rs.getString("name") %></td></tr>
    	         <tr><td>账号：<%=rs.getString("username") %></td></tr>
    	         <tr><td>余额：<%=rs.getInt("money") %></td>
    	         </tr>
    	         </table>
    	         <input type="button" name="mit" value="返回首页" onclick="javascript:window.history.back(-1);">
    	    	 </div>
    	    	 <%
           }if(rs.getInt("money")<=0){
        	   %>
          	 <div >
          	 <table border="2">
          	 <tr class="biao2">
               <td>尊敬的<%=rs.getString("name") %>，您的余额:<%=rs.getInt("money")%>请努力挣钱哦，我们知道您的地址，请您尽快还钱</td></tr>
              
               </table>
               <input type="button" name="Sub" value="返回首页" onclick="javascript:window.history.back(-1);">
          	 </div>
          	 <%
           }
      
          else if(rs.getInt("money")>=100000){
    	   //System.out.println("不对啊！");
    	   //response.sendRedirect("VIP.jsp");
    	   %>
    	   <div >
    	   <table border="2">
    	  <tr class="biao3"> <td>尊敬的<%=rs.getString("name") %>，作为我们尊敬的vip用户，我们非常荣幸为您服务，希望您能感受到我们的热情
    	  希望我们的服务使您感觉到了温暖与幸福，希望您继续光临我们的银行，我们将为您提供最优质的服务
    	
    	  </td>
      </tr>
    </table>
    <input type="button" name="mit" value="返回首页" onclick="javascript:window.history.back(-1);">
    </div>
      <% 
      }
       }
   }catch (Exception e) {
       e.printStackTrace();
   }
 

%> 
</div>
</body>
</html>