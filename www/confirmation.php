<?php

if ($_SESSION['confirmation']) {
    echo $twig->render('confirmation.html.twig');
    $_SESSION['confirmation'] = false;
} else header('Location: /');