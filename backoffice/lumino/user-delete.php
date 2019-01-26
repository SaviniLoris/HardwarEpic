<?php

require "include/dbms.inc.php.php";
require "include/template2.inc.php";
require "include/lumino.inc.php";

  $main = new Template("index.html");
  $body = new Template("user-search.html");
  
  $body->setContent("action_script", "delete");
  $body->setContent("action_title", "Elimina utente");
  $body->setContent("action_desc", "Da qui puoi eliminare definitivamente un utente.");

  adminInject($main, $body);

  $main->close();
  ?>