<?php

require "include/dbms.inc.php.php";
require "include/template2.inc.php";
require "include/lumino.inc.php";


  $main = new Template("user.html");
  $body = new Template("index.html");

  adminInject($main, $body);

  $main->close();
?>