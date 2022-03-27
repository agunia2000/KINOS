<?php

if (isset($_SESSION['uid']) && isset($_SESSION['email'])) {
    $next_step_cart_link = "/cart/delivery-and-payment";
} else {
    $next_step_cart_link = "/cart/selection";
}

if (isset($_POST['cart_update'])) {

    $sid = $_POST['sid'];

    $stmt = $dbh->prepare('SELECT * FROM screenings JOIN movies USING (mid) WHERE sid = :sid');
    $stmt->execute([':sid' => $sid]);
    $screening = $stmt->fetch(PDO::FETCH_ASSOC);

    for ($i = 0; $i < count($_SESSION['cart']); $i++) {
        if ($_SESSION['cart'][$i]['sid'] == $sid) {
            unset($_SESSION['cart'][$i]);
            $_SESSION['cart'] = array_values($_SESSION['cart']);
            $i--;
        }
    }

    $sold_tickets = array();
    $stmt = $dbh->prepare('SELECT * FROM tickets WHERE sid = :sid');
    $stmt->execute([':sid' => $sid]);
    while ($ticket = $stmt->fetch(PDO::FETCH_ASSOC)) array_push($sold_tickets, $ticket);

    $seats_array = explode(",", $_POST['seats']);
    if (count($seats_array) > 1) {
        $warning = false;
        for ($i = 0; $i < count($seats_array) / 2; $i++) {
            $new_ticket = array();
            $new_ticket['sid'] = $sid;
            $new_ticket['title'] = $screening['title'];
            $new_ticket['day'] = $screening['day'];
            $new_ticket['time'] = $screening['time'];
            $new_ticket['hid'] = $screening['hid'];
            $new_ticket['tier'] = $seats_array[2 * $i];
            $new_ticket['seat'] = $seats_array[2 * $i + 1];
            $new_ticket['price'] = 20;

            $agreement = true;
            foreach ($sold_tickets as $sold_ticket) {
                if ($new_ticket['tier'] == $sold_ticket['tier'] && $new_ticket['seat'] == $sold_ticket['seat']) {
                    $agreement = false;
                    $warning = true;
                    break;
                }
            }
            if ($agreement) array_push($_SESSION['cart'], $new_ticket);
        }
        if ($warning) echo "<script type='text/javascript'>alert('Niektóre z wybranych przez Ciebie miejsc są już niedostępne. Wybierz miejsca ponownie.'); window.location = '/screening/$sid';</script>";
        else header('Location: /cart');
    }
}
if (isset($_GET['remove']) && intval($_GET['remove']) >= 0) {
    $id = intval($_GET['remove']);
    unset($_SESSION['cart'][$id]);
    $_SESSION['cart'] = array_values($_SESSION['cart']);
    header('Location: /cart');
}

echo $twig->render('cart.html.twig', ['cart' => $_SESSION['cart'], 'next_step_cart_link' => $next_step_cart_link]);
