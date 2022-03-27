<?php

$sid = $_GET['screening'];
$stmt = $dbh->prepare('SELECT * FROM halls JOIN screenings USING (hid) JOIN movies USING (mid) WHERE sid = :sid AND ((day <= CURDATE() + 7 AND day > CURDATE()) OR (day = CURDATE() AND time >= CURTIME() + INTERVAL 30 MINUTE))');
$stmt->execute([':sid' => $sid]);
$screening = $stmt->fetch(PDO::FETCH_ASSOC);

if ($screening) {
    $mid = $screening['mid'];
    $title = $screening['title'];
    $day = $screening['day'];
    $time = $screening['time'];
    $tiers = $screening['tiers'];
    $seats = $screening['seats_in_tier'];

    $sold_seats = array();
    $stmt = $dbh->prepare('SELECT * FROM tickets WHERE sid = :sid');
    $stmt->execute([':sid' => $sid]);
    while($ticket = $stmt->fetch(PDO::FETCH_ASSOC)) array_push($sold_seats, $ticket);

    $chosen_seats = array();
    foreach ($_SESSION['cart'] as $ticket)
        if ($ticket['sid'] == $sid)
            array_push($chosen_seats, $ticket);

    echo $twig->render('hall.html.twig', ['mid' => $mid, 'sid' => $sid, 'title' => $title, 'day' => $day, 'time' => $time, 'tiers' => $tiers, 'seats' => $seats, 'sold_seats' => $sold_seats, 'chosen_seats' => $chosen_seats]);
}
else header('Location: /');


