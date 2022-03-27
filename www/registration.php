<?php

$message = '';

if (isset($_POST['new_account'])) {
    $new_name = $_POST['new_name'];
    $new_surname = $_POST['new_surname'];
    $new_street = $_POST['new_street'];
    $new_street_number = $_POST['new_street_number'];
    $new_postcode = $_POST['new_postcode'];
    $new_city = $_POST['new_city'];
    $new_email = $_POST['new_email'];
    $new_phone_number = $_POST['new_phone_number'];
    $new_password = $_POST['new_password'];
    $new_password_repeat = $_POST['new_password_repeat'];

    $recaptcha = new \ReCaptcha\ReCaptcha('6LcrreYUAAAAALTdoToeer_H4NZ1ECK4U76g0huL');
    $resp = $recaptcha->verify($_POST['g-recaptcha-response'], $_SERVER['REMOTE_ADDR']);

    if ($resp->isSuccess()) {
        if($new_name=='' || $new_surname=='' || $new_street == '' || $new_street_number == '' || $new_postcode == '' || $new_city == ''|| $new_email=='' || $new_phone_number=='' || $new_password=='' || $new_password_repeat==''){
            $message = "Pola nie mogą być puste.";
        }
        else {
            if (!preg_match('/^([1-9][0-9]*[a-zA-z]{0,1}[\/]{0,1}[0-9]*)$/D', $new_street_number)) {
                $message = "Podany adres jest niepoprawny.";
            } else {
                if (!preg_match('/^([0-9]{2}-[0-9]{3})$/D', $new_postcode)) {
                    $message = "Podany kod pocztowy jest niepoprawny.";
                } else {
                    if (!preg_match('/^[a-zA-Z0-9\-\_\.]+\@[a-zA-Z0-9\-\_\.]+\.[a-zA-Z]{2,5}$/D', $new_email)) {
                        $message = "Podany email jest niepoprawny.";
                    } else {
                        if (!preg_match('/^[0-9]{9}$/', $new_phone_number)) {
                            $message = "Podany numer telefonu jest niepoprawny.";
                        } else {
                            if (strcmp($new_password, $new_password_repeat) !== 0) {
                                $message = "Podane hasła różnią się.";
                            } else {
                                if (strlen($new_password) < 6) {
                                    $message = "Hasło musi mieć co najmniej 6 znaków.";
                                } else {
                                    $new_password = password_hash($new_password, PASSWORD_DEFAULT);
                                    try {
                                        $stmt = $dbh->prepare('INSERT INTO users (uid, email, password, name, surname, street, street_number, postcode, city, phone_number) VALUES (null, :email, :password, :name, :surname, :street, :street_number, :postcode, :city, :phone_number)');
                                        $stmt->execute([':email' => $new_email, ':password' => $new_password, ':name' => $new_name, ':surname' => $new_surname, ':street' => $new_street, ':street_number' => $new_street_number, ':postcode' => $new_postcode, ':city' => $new_city, ':phone_number' => $new_phone_number]);
                                        $message = "Konto zostało zarejestrowane.";
                                    } catch (PDOException $e) {
                                        $message = "Podany email jest już zajęty.";
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        $message = "Serio jesteś robotem?";
    }
}

echo $twig->render('registration.html.twig', ['message'=>$message]);
