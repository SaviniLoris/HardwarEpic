<?php

	function adminInject($main, $body) {

    $main->setContent("body", $body->get());
  }

?>