<?php

$message = '';

if (isset($_POST['login'])) {
    if ($_POST['email'] == '' || $_POST['password'] == '') {
        $message = "Pola nie mogą być puste.";
    }
    else {
        $stmt = $dbh->prepare("SELECT * FROM users WHERE email = :email");
        $stmt->execute([':email' => $_POST['email']]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($user) {
            if (password_verify($_POST['password'], $user['password'])) {
                $_SESSION['uid'] = $user['uid'];
                $_SESSION['email'] = $user['email'];
                header('Location: /profile');
            } else $message = "Hasło niepoprawne.";
        } else $message = "Nie ma takiego użytkownika.";
    }
}

echo $twig->render('login.html.twig', ['message'=>$message]);

