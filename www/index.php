<?php

require __DIR__ . '/vendor/autoload.php';

ini_set('display_errors', 1);
error_reporting(E_ALL);

include("config.inc.php");

session_start();

if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = array();
}

// Database connection, commented cause of errors

if (isset($config) && is_array($config)) {
    try {
        $dbh = new PDO('mysql:host=' . $config['db_host'] . ';dbname=' . $config['db_name'] . ';charset=utf8mb4', $config['db_user'], $config['db_password']);
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch (PDOException $e) {
        print "Nie mozna polaczyc sie z baza danych: " . $e->getMessage();
        exit();
    }
}
else {
    exit("Nie znaleziono konfiguracji bazy danych.");
}

if (isset($_GET['logout'])) {
    unset($_SESSION['uid']);
    unset($_SESSION['email']);
    header('Location: /');
}

if (isset($_SESSION['uid']) && isset($_SESSION['email'])) {
    $login_link = "/logout";
    $login_button = "Wyloguj się";
    $profile_link = "/profile";
    $profile_button = "Moje konto";
} else {
    $login_link = "/login";
    $login_button = "Zaloguj się";
    $profile_link = "/registration";
    $profile_button = "Zarejestruj się";
}

// Render index.html
echo $twig->render('index.html.twig', ['login_link' => $login_link, 'login_button' => $login_button, 'profile_link' => $profile_link, 'profile_button' => $profile_button]);

$pages_for_all = ['main', 'movies', 'hall', 'cart', 'contact', 'delivery-and-payment', 'confirmation'];
$pages_for_logged = ['profile'];
$pages_for_unlogged = ['login', 'registration', 'selection'];

if ((isset($_GET['page']) && $_GET['page'] && in_array($_GET['page'], $pages_for_all)) || (isset($_GET['page']) && $_GET['page'] && in_array($_GET['page'], $pages_for_logged) && isset($_SESSION['uid'])) || (isset($_GET['page']) && $_GET['page'] && in_array($_GET['page'], $pages_for_unlogged) && !isset($_SESSION['uid']))) {
    if (file_exists($_GET['page'] . '.php')) {
        include($_GET['page'] . '.php');
    } else {
        print '<p style="font-weight: bold; text-align: center; margin-top: 50px;"> Plik ' . $_GET['page'] . '.php nie istnieje.</p>';
    }
} elseif (!isset($_GET['page'])) {
    include('main.php');
} else {
    header('Location: /');
}

?>
