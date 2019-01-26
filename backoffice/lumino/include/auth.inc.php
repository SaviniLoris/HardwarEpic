<?php

session_start(); // attiva la gestione sessione


if ((!isset($_POST['username'])) AND (!isset($_POST['password']))) {
      /*
       * controllo se l'utente ha inserito username e password nella form di login,
       * se l'utente inserisce u e p nella form di login, lo script login.php viene
       * richiamato attraverso la action della form
       *
      */
	  
      if (!isset($_SESSION['auth'])) {;
          // non è in sessione
          Header("Location: error.php?id=1002");
          exit;
      }
  } else {
	  
    $login_query = "SELECT * FROM utente WHERE username = '{$_POST['username']}' AND password = '{$_POST['password']}'";
	    
      $db->query($login_query);
      $result = $db->getResult();
	  
      if (!$result) {
          /* utente o password errate */
          Header("Location: error.php?id=1001");
          exit;
      }
      /*
       * username e password corrette, utente loggato
      */
      $_SESSION['auth'] = $result[0];
  }

?>