<?php

if(isset($_POST['send'])){
    $email = $_POST['email'];
    $message = $_POST['message'];
    $stmt = $dbh->prepare('INSERT INTO inbox (id, email, message) VALUES (null, :email, :message)');
    $stmt->execute([':email' => $email, ':message' => $message]);
    header('Location: /contact');
}

echo $twig->render('contact.html.twig');