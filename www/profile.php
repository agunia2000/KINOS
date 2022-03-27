<?php

$current_tab = "";

//Moje bilety:
$stmt = $dbh->prepare('SELECT * FROM tickets JOIN screenings USING (sid) JOIN movies USING (mid) WHERE uid = :uid ORDER BY day, time, title, hid, tier, seat');
$stmt->execute([':uid' => $_SESSION['uid']]);
$tickets = array();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) array_push($tickets, $row);

$stmt = $dbh->prepare('SELECT * FROM users WHERE uid = :uid');
$stmt->execute([':uid' => $_SESSION['uid']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

//Zmień hasło:
$message_password = "";

if (isset($_POST['current_password']) && isset($_POST['changed_password']) && isset($_POST['changed_password_repeat'])) {

    $current_password = $_POST['current_password'];
    $changed_password = $_POST['changed_password'];
    $changed_password_repeat = $_POST['changed_password_repeat'];
    $current_tab = "account_info";

    if ($current_password == '' || $changed_password == '' || $changed_password_repeat == '') {
        $message_password = "Pola nie mogą być puste.";
    } else {
        if (password_verify($current_password, $user['password']) == false) {
            $message_password = "Aktualne hasło jest niepoprawne.";
        } elseif (strcmp($changed_password, $changed_password_repeat) !== 0) {
            $message_password = "Nowe hasła różnią się.";
        } elseif (strlen($changed_password) < 6) {
            $message_password = "Hasło musi mieć co najmniej 6 znaków.";
        } else {
            $changed_password = password_hash($changed_password, PASSWORD_DEFAULT);
            $stmt = $dbh->prepare('UPDATE users SET password = :password WHERE uid = :uid');
            $stmt->execute([':password' => $changed_password, ':uid' => $user['uid']]);
            $message_password = "Hasło zostało zmienione.";
        }
    }
}

//Zmień dane osobowe:
$name = $user['name'];
$surname = $user['surname'];
$street = $user['street'];
$street_number = $user['street_number'];
$postcode = $user['postcode'];
$city = $user['city'];
$email = $user['email'];
$phone_number = $user['phone_number'];
$message_user = "";

if (isset($_POST['changed_name']) && isset($_POST['changed_surname']) && isset($_POST['changed_street']) && isset($_POST['changed_street_number']) && isset($_POST['changed_postcode']) && isset($_POST['changed_city']) && isset($_POST['changed_phone_number']) && isset($_POST['changed_email'])) {

    $changed_name = $_POST['changed_name'];
    $changed_surname = $_POST['changed_surname'];
    $changed_street = $_POST['changed_street'];
    $changed_street_number = $_POST['changed_street_number'];
    $changed_postcode = $_POST['changed_postcode'];
    $changed_city = $_POST['changed_city'];
    $changed_email = $_POST['changed_email'];
    $changed_phone_number = $_POST['changed_phone_number'];
    $current_tab = "private_info";

    if ($changed_name == '' || $changed_surname == '' || $changed_street == '' || $changed_street_number == '' || $changed_postcode == '' || $changed_city == '' || $changed_email == '' || $changed_phone_number == '') {
        $message_user = "Pola nie mogą być puste.";
    } else {
        if (!preg_match('/^([1-9][0-9]*[a-zA-z]{0,1}[\/]{0,1}[0-9]*)$/D', $changed_street_number)) {
            $message_user = "Podany adres jest niepoprawny.";
        } else {
            if (!preg_match('/^([0-9]{2}-[0-9]{3})$/D', $changed_postcode)) {
                $message_user = "Podany kod pocztowy jest niepoprawny.";
            } else {
                if (!preg_match('/^[a-zA-Z0-9\-\_\.]+\@[a-zA-Z0-9\-\_\.]+\.[a-zA-Z]{2,5}$/D', $changed_email)) {
                    $message_user = "Podany email jest niepoprawny.";
                } else {
                    if (!preg_match('/^[0-9]{9}$/', $changed_phone_number)) {
                        $message_user = "Podany numer telefonu jest niepoprawny.";
                    } else {
                        try {
                            $stmt_2 = $dbh->prepare('UPDATE users SET email = :email, name = :name, surname = :surname, street = :street, street_number = :street_number, postcode = :postcode, city = :city, phone_number = :phone_number WHERE uid = :uid');
                            $stmt_2->execute([':email' => $changed_email, ':name' => $changed_name, ':surname' => $changed_surname, ':street' => $changed_street, ':street_number' => $changed_street_number, ':postcode' => $changed_postcode, ':city' => $changed_city, ':phone_number' => $changed_phone_number, ':uid' => $user['uid']]);
                            $message_user = "Dane zostały zmienione.";

                            $name = $changed_name;
                            $surname = $changed_surname;
                            $street = $changed_street;
                            $street_number = $changed_street_number;
                            $postcode = $changed_postcode;
                            $city = $changed_city;
                            $email = $changed_email;
                            $phone_number = $changed_phone_number;

                        } catch (PDOException $e) {
                            $message_user = "Podany email jest już zajęty.";
                        }
                    }
                }
            }
        }
    }
}


// Usuń konto:
$message_delete = "";

if (isset($_POST['password_confirm'])) {
    $password_confirm = $_POST['password_confirm'];
    $current_tab = "delete_account";

    if ($password_confirm == "") {
        $message_delete = "Musisz podać hasło.";
    } else {
        if (password_verify($password_confirm, $user['password'])) {
            $stmt = $dbh->prepare('DELETE FROM users WHERE uid = :uid');
            $stmt->execute([':uid' => $user['uid']]);
            header('Location: /logout');
        } else {
            $message_delete = "Podane hasło jest niepoprawne.";
        }
    }
}

echo $twig->render('profile.html.twig', [
    /*data to tickets:*/
    'tickets' => $tickets,

    /*data to password changing*/
    'message_password' => $message_password,

    /*data to personal info changing */
    'name' => $name,
    'surname' => $surname,
    'street' => $street,
    'street_number' => $street_number,
    'postcode' => $postcode,
    'city' => $city,
    'phone_number' => $phone_number,
    'email' => $email,
    'message_user' => $message_user,

    /*data to deleting an account*/
    'message_delete' => $message_delete,

    'current_tab' => $current_tab
]);

