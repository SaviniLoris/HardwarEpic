<?php

  require "include/dbms.inc.php";
  require "include/template2.inc.php";
  require "include/lumino.inc.php";

  $main = new Template("index.html");
  $body = new Template("error.html");
  $loginForm = new Template("login.html");

  $err = "Impossibile accedere alla pagina: ";

  if(isset($_GET['id'])) {
    if($_GET['id'] == "1001" || $_GET['id'] == "1002") {
       $err .= "Per favore esegui il login per accedere alla pagina!";
       $err .= "<br>Premere <a href='login.html' class='menu'>qui</a> per eseguire il login.";
    } else if($_GET['id'] == "1003") {
       $err .= "Non hai i permessi necessari per accedere a questa pagina!";
       $err .= "<br>Premere <a href=\"index.php\">qui</a> per tornare alla home.";
    } else if($_GET['id'] == "1004") {
      $err .= "Questa pagina non è attiva!";
      $err .= "<br>Premere <a href=\"index.php\">qui</a> per tornare alla home.";
    } else if($_GET['id'] == "1005") {
      $err .= "Errore nel server!";
      $err .= "<br>Premere <a href=\"index.php\">qui</a> per tornare alla home.";
    }
  }
  
  $body->setContent("num", $_GET['id']);
  $body->setContent("errore", $err);
    
  adminInject($main,$body);

  $main->close();
?>
