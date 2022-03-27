<?php

if (empty($_SESSION['cart'])) {
    header('Location: /cart');
} else {
    if (isset($_SESSION['uid']) && isset($_SESSION['email'])) {
        $uid = $_SESSION['uid'];

        $stmt = $dbh->prepare('SELECT * FROM users WHERE uid = :uid');
        $stmt->execute([':uid' => $uid]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        $name = $user['name'];
        $surname = $user['surname'];
        $street = $user['street'];
        $street_number = $user['street_number'];
        $postcode = $user['postcode'];
        $city = $user['city'];
        $email = $user['email'];
        $phone_number = $user['phone_number'];

    } else {
        $uid = 0;
        $name = '';
        $surname = '';
        $street = '';
        $street_number = '';
        $postcode = '';
        $city = '';
        $email = '';
        $phone_number = '';
    }

    $message = '';

    if (isset($_POST['confirm_reservation'])) {
        $name = $_POST['name'];
        $surname = $_POST['surname'];
        $street = $_POST['street'];
        $street_number = $_POST['street_number'];
        $postcode = $_POST['postcode'];
        $city = $_POST['city'];
        $email = $_POST['email'];
        $phone_number = $_POST['phone_number'];

        $recaptcha = new \ReCaptcha\ReCaptcha('6LcrreYUAAAAALTdoToeer_H4NZ1ECK4U76g0huL');
        $resp = $recaptcha->verify($_POST['g-recaptcha-response'], $_SERVER['REMOTE_ADDR']);

        if ($resp->isSuccess()) {
            if ($name == '' || $surname == '' || $street == '' || $street_number == '' || $postcode == '' || $city == '' ||$email == '' || $phone_number == '') {
                $message = "Pola nie mogą być puste.";
            } else {
                if (!preg_match('/^([1-9][0-9]*[a-zA-z]{0,1}[\/]{0,1}[0-9]*)$/D', $street_number)) {
                    $message = "Podany adres jest niepoprawny.";
                } else {
                    if (!preg_match('/^([0-9]{2}-[0-9]{3})$/D', $postcode)) {
                        $message = "Podany kod pocztowy jest niepoprawny.";
                    } else {
                        if (!preg_match('/^[a-zA-Z0-9\-\_\.]+\@[a-zA-Z0-9\-\_\.]+\.[a-zA-Z]{2,5}$/D', $email)) {
                            $message = "Podany email jest niepoprawny.";
                        } else {
                            if (!preg_match('/^[0-9]{9}$/', $phone_number)) {
                                $message = "Podany numer telefonu jest niepoprawny.";
                            } else {
                                if (!isset($_POST['delivery'])) {
                                    $message = "Nie wybrano formy dostawy.";
                                } else {
                                    $delivery = $_POST['delivery'];
                                    if (!isset($_POST['payment'])) {
                                        $message = "Nie wybrano formy płatności.";
                                    } else {
                                        $payment = $_POST['payment'];
                                        if ($_POST['delivery']=="e-ticket" && $_POST['payment']=="by-collection") {
                                            $message = "Bilet elektroniczny jest dostępny tylko przy płatności przelewem.";
                                        } else {
                                            $agreement = true;
                                            $sold_tickets = array();
                                            $stmt = $dbh->prepare('SELECT * FROM tickets');
                                            $stmt->execute();
                                            while($ticket = $stmt->fetch(PDO::FETCH_ASSOC)) array_push($sold_tickets, $ticket);

                                            foreach ($_SESSION['cart'] as $cart_ticket) {
                                                foreach ($sold_tickets as $sold_ticket) {
                                                    if ($cart_ticket['sid'] == $sold_ticket['sid'] && $cart_ticket['tier'] == $sold_ticket['tier'] && $cart_ticket['seat'] == $sold_ticket['seat']) {
                                                        $index = array_search($cart_ticket, $_SESSION['cart']);
                                                        unset($_SESSION['cart'][$index]);
                                                        $_SESSION['cart'] = array_values($_SESSION['cart']);
                                                        $agreement = false;
                                                        break;
                                                    }
                                                }
                                            }

                                            if (!$agreement) {
                                                echo "<script type='text/javascript'>alert('Niektóre bilety, które masz w koszyku są już niedostępne. Twój koszyk został zaktualizowany.'); window.location = '/cart';</script>";
                                            } else {
                                                foreach ($_SESSION['cart'] as $ticket) {
                                                    try {
                                                        $stmt = $dbh->prepare('INSERT INTO tickets (tid, sid, tier, seat, price, delivery, payment, uid, email, name, surname, street, street_number, postcode, city, phone_number) VALUES (null, :sid, :tier, :seat, :price, :delivery, :payment, :uid, :email, :name, :surname, :street, :street_number, :postcode, :city, :phone_number)');
                                                        $stmt->execute([':sid' => $ticket['sid'], ':tier' => $ticket['tier'], ':seat' => $ticket['seat'], ':price' => $ticket['price'], ':delivery' => $delivery, ':payment' => $payment, ':uid' => $uid, ':email' => $email, ':name' => $name, ':surname' => $surname, ':street' => $street, ':street_number' => $street_number, ':postcode' => $postcode, ':city' => $city, ':phone_number' => $phone_number]);
                                                    } catch (PDOException $e) {}
                                                }
                                                unset($_SESSION['cart']);
                                                $_SESSION['confirmation'] = true;
                                                header('Location: /cart/confirmation');
                                            }
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

    echo $twig->render('cart3.html.twig', [
        'name' => $name,
        'surname' => $surname,
        'street' => $street,
        'street_number' => $street_number,
        'postcode' => $postcode,
        'city' => $city,
        'email' => $email,
        'phone_number' => $phone_number,
        'message' => $message,
        'cart' => $_SESSION['cart']
    ]);
}


