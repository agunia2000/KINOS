<?php

echo $twig->render('movies_head.html.twig');

if (isset($_GET['show']) && intval($_GET['show']) > 0) {
    $mid = intval($_GET['show']);

    $stmt = $dbh->prepare('UPDATE movies SET click_counter = click_counter + 1 WHERE mid = :mid AND available_date <= CURDATE() AND expiration_date >= CURDATE()');
    $stmt->execute([':mid' => $mid]);

    $screenings = array();
    $stmt = $dbh->prepare('SELECT * FROM screenings WHERE mid = :mid AND ((day <= CURDATE() + 7 AND day > CURDATE()) OR (day = CURDATE() AND time >= CURTIME() + INTERVAL 30 MINUTE)) ORDER BY day, time LIMIT 10');
    $stmt->execute([':mid' => $mid]);
    while($screening = $stmt->fetch(PDO::FETCH_ASSOC)) array_push($screenings, $screening);

    $stmt = $dbh->prepare('SELECT * FROM movies WHERE mid = :mid AND available_date <= CURDATE() AND expiration_date >= CURDATE()');
    $stmt->execute([':mid' => $mid]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($row) {
        $title = $row['title'];
        $description = $row['description'];
        $director = $row['director'];
        $genre = $row['genre'];
        $duration = $row['duration'];
        $min_age = $row['min_age'];
        $production = $row['production'];
        $poster_path = $row['poster_path'];
        $available_date = $row['available_date'];
        $expiration_date = $row['expiration_date'];
        $trailer_URL = $row['trailer_URL'];

        echo $twig->render('movie_details.html.twig', [
            'title' => $title,
            'description' => $description,
            'director' => $director,
            'genre' => $genre,
            'duration' => $duration,
            'min_age' => $min_age,
            'production' => $production,
            'poster_path' => $poster_path,
            'available_date' => $available_date,
            'expiration_date' => $expiration_date,
            'trailer_URL' => $trailer_URL,
            'screenings' => $screenings,
        ]);
    } else header('Location: /');
}

else if(isset($_POST['filter'])){
    echo $twig->render('movies_return.html.twig');

    $title = "%" . $_POST['title'] . "%";
    $genre = "%" . $_POST['genre'] . "%";
    $min_age = $_POST['min_age'] == '' ? 99 : intval($_POST['min_age']);
    $query = 'SELECT * FROM movies WHERE title LIKE :title AND genre LIKE :genre AND min_age <= :min_age AND available_date <= CURDATE() AND expiration_date >= CURDATE() ORDER BY ';
    if($_POST['sort'] == 'click_counter') $query .= 'click_counter DESC';
    else if($_POST['sort'] == 'title') $query .= 'title ASC';
    else $query .= 'available_date DESC';
    $stmt = $dbh->prepare($query);
    $stmt->execute([':title' => $title, ':genre' => $genre, ':min_age' => $min_age]);

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $mid = $row['mid'];
        $title = $row['title'];
        $director = $row['director'];
        $genre = $row['genre'];
        $duration = $row['duration'];
        $min_age = $row['min_age'];
        $production = $row['production'];
        $poster_path = $row['poster_path'];
        $available_date = $row['available_date'];
        $expiration_date = $row['expiration_date'];

        echo $twig->render('movies.html.twig', [
            'mid' => $mid,
            'title' => $title,
            'director' => $director,
            'genre' => $genre,
            'duration' => $duration,
            'min_age' => $min_age,
            'production' => $production,
            'poster_path' => $poster_path,
            'available_date' => $available_date,
            'expiration_date' => $expiration_date
        ]);
    }
}

else {
    $genreList = array();
    $stmt = $dbh->prepare('SELECT DISTINCT genre FROM movies');
    $stmt->execute();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
        array_push($genreList, $row['genre']);

    echo $twig->render('movie_searching.html.twig', ['genreList' => $genreList]);

    $stmt = $dbh->prepare('SELECT * FROM movies WHERE available_date <= CURDATE() AND expiration_date >= CURDATE() ORDER BY available_date DESC');
    $stmt->execute();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $mid = $row['mid'];
        $title = $row['title'];
        $director = $row['director'];
        $genre = $row['genre'];
        $duration = $row['duration'];
        $min_age = $row['min_age'];
        $production = $row['production'];
        $poster_path = $row['poster_path'];
        $available_date = $row['available_date'];
        $expiration_date = $row['expiration_date'];

        echo $twig->render('movies.html.twig', [
            'mid' => $mid,
            'title' => $title,
            'director' => $director,
            'genre' => $genre,
            'duration' => $duration,
            'min_age' => $min_age,
            'production' => $production,
            'poster_path' => $poster_path,
            'available_date' => $available_date,
            'expiration_date' => $expiration_date
        ]);
    }
}
