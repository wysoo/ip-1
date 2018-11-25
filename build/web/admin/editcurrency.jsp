<%-- 
    Document   : editcurrency
    Created on : Nov 6, 2014, 3:25:36 PM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bean.User" %>
<%@ page import="bean.Currency" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.adminprofile != null}">
    <% response.sendRedirect(request.getContextPath() + "/admin/terminate.html"); %>
</c:if>

<jsp:useBean id="currencyedit" class="bean.Currency" scope="session" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Cash - Admin - Edit Currency</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="home.jsp"><span class="glyphicon glyphicon-home"></span> <span style="color:#FFFF00">CashWeb</span></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="/ip/admin/ViewUsersServlet"><span class="glyphicon glyphicon-th-list"></span> Manage Users</a></li>
            <li><a href="/ip/admin/ViewCashServlet"><span class="glyphicon glyphicon-th-list"></span> View Cash Request</a></li>
            <li class="active"><a href="/ip/admin/ManageBackendDataServlet"><span class="glyphicon glyphicon-th-list"></span> Manage Backend Data</a></li> 
          </ul>
          <ul class="nav navbar-nav navbar-right">
      		<li class="dropdown">
		        <a aria-expanded="false" href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> Welcome 
                            <c:if test="${sessionScope.adminprofile != null}">
                                <jsp:useBean id="adminprofile" class="bean.User" scope="session" />
                                <span style="color:#FFFF00"><jsp:getProperty name="adminprofile" property="fullName"/></span>
                            </c:if> 
                            (Admin) <b class="caret"></b></a>
			        <ul class="dropdown-menu">
			          <li><a href="/ip/admin/UserProfileServlet"><span class="glyphicon glyphicon-user"></span> User Profile</a></li>
			          <li><a href="/ip/admin/SettingServlet"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
			          <li class="divider"></li>
			          <li><a href="/ip/admin/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			        </ul>
		  	</li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Cash Web-App example</h1>
        <ul>
          <li>Responsive application</li>
          <li>Bootstrap CSS</li>
          <li>MVC
            <ul>
              <li>(M)odel - JavaBeans</li>
              <li>(V)iew - JSP for input and output</li>
              <li>(C)ontroller - Servlet</li>
            </ul>
          </li>
        </ul>
      </div>
      
      <div class="well">
          
        <h3>Edit Currency</h3>
        <p>&nbsp;</p>
        <div class="row">
            <div class="col-md-6">
                <form class="form-horizontal" action="/cash/admin/EditCurrencyProcessServlet" method="post">
                    <fieldset>
                        <div class="form-group">
                            <label for="login" class="col-lg-2 control-label">Name</label>
                                <div class="col-lg-10">
                                    <input class="form-control" id="name" name="name" value="<jsp:getProperty name="currencyedit" property="name"/>" type="text" required>
                                </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-lg-2 control-label">Symbol</label>
                                <div class="col-lg-10">
                                    <input class="form-control" id="symbol" name="symbol" value="<jsp:getProperty name="currencyedit" property="symbol"/>" type="text" required>
                                </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <input type="hidden" name="id" value="<jsp:getProperty name="currencyedit" property="id"/>">
                                <button class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                                <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> Submit</button>
                            </div>
                        </div>
                    </fieldset>
                </form>                
            </div>
        </div>                    
      </div>
      
      <footer>
      	<p>&copy; RBK 2014 - SCJ/SCSJ 2303/3303</p>
      </footer>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/vendor/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>