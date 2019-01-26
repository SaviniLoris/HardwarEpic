<?PHP

require "include/dbms.inc.php";
 require "include/template2.inc.php";
 require "include/lumino.inc.php";
 require "include/auth.inc.php";

$main = new Template("index.html");
$body = new Template("dashboard.html");

 if (!isset($_POST['step'])) {
        $_POST['step'] = 0;
    } 
switch ($_POST['step']) {
        case 0:        
            break;
            
        case 1:
            $result = $db->query("INSERT INTO utente VALUES (
                                    0,
                                    '{$_POST['username']}',
                                    '{$_POST['password']}')");
}

$main->setContent("username",$_SESSION['auth']['username']);

adminInject($main, $body);
$main->close();
?>