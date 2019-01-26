<?php

 require "include/dbms.inc.php";
 require "include/template2.inc.php";
 require "include/lumino.inc.php";
 require "include/auth.inc.php";

  $main = new Template("index.html");
  $body = new Template("prova.html");

  $main->setContent("username",$_SESSION['auth']['username']);
  
  adminInject($main, $body);
  
  if(isset($_GET['logout'])) {
    session_unset();
	$main = new Template("login.html");
	$body = new Template("prova.html");
	adminInject($main, $body);
  }
  
  $main->close();
?>
