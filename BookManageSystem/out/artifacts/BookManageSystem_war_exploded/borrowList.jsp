<%@ page import="com.rexrowe.bo.BookBo" %>
<%@ page import="com.rexrowe.pojo.BookVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.awt.print.Book" %>
<%@ page import="java.util.*" %>
<%@ page import="com.rexrowe.dao.BookDAO" %>
<%@ page import="com.rexrowe.pojo.UserVO" %><%--
  Created by IntelliJ IDEA.
  User: rex
  Date: 2019-07-04
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>图书管理系统</title>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <style>
        table{
            margin:auto;
            margin-top:50px;
            font-size:30px;
        }
    </style>
</head>
<body>
<%
    String table_flag = (String)session.getAttribute("flag");
    UserVO userInfo = (UserVO)session.getAttribute("userInfo");
    String user_id = userInfo.getUsername();
    BookBo bookBo = new BookBo();
    int bookNum = bookBo.getBookNum(table_flag);
%>
<form action = "BorrowServlet" method = "POST">
    <table font-size: 30px>
        <tr>
            <td>当前借阅的书本</td>
        </tr>
        <tr>
            <td>书本id</td>
            <td>书名</td>
            <td>作者<td>
            <td>出版社</td>
            <td>是否借阅</td>
        </tr>
        <tr>
            <%
                BookDAO bookDAO=new BookDAO();
                String borrow_BookInfo = bookBo.get_Borrow_BookInfo(user_id);
                List<BookVO> list = bookBo.show_Borrow_List(borrow_BookInfo);
                for(BookVO tl:list)
                {%>
            <td><%=tl.getId() %></td>
            <td><%=tl.getName() %></td>
            <td><%=tl.getAuthor() %></td>
            <td></td>
            <td><%=tl.getPublish() %></td>
        </tr>

        <%}
        %>
        <tr>
            <td><a href="showbook.jsp">返回</a></td>
        </tr>
        <tr>
            <td><a href="index.jsp">退出登录</a></td>
        </tr>
    </table>

</form>
</body>
</html>
