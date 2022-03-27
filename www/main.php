<?php

$stmt = $dbh->prepare("SELECT * FROM movies WHERE available_date <= CURDATE() AND expiration_date >= CURDATE() ORDER BY available_date DESC");
$stmt->execute();

$mid = array();
$poster_paths = array();

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    array_push($mid, $row['mid']);
    array_push($poster_paths, $row['poster_path']);
}

$array_length = count($mid);

echo $twig->render('main.html.twig', [
    'mid' => $mid,
    'poster_path' => $poster_paths,
    'array_length' => $array_length,
]);