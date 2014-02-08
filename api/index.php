<?php

/////////////////////////////////////////////////
//INIT
require 'Slim/Slim.php';

\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();
$app->contentType('application/json; charset=utf-8');

//////////////////////////////////////////////////////
// Functions
function getConnection() {
    $dbhost = "localhost";
    $dbuser = "XXXX";
    $dbpass = "YYYYY";
    $dbname = "ZZZZZ";
    $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $dbh;
}

function get_all_stations() {
    $sql = "SELECT * FROM stations WHERE 1";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->execute();
        $stations = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $db = null;
        echo json_encode($stations);
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }
}

function get_station($id) {
    $sql = "SELECT * FROM stations WHERE id=:id";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("id", $id);
        $stmt->execute();
        $station = $stmt->fetch(PDO::FETCH_ASSOC);
        $db = null;
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }

    $station["interlignes"] = (array) get_connexions($id);

    echo json_encode($station);
}

function get_connexions($id) {
    $sql = "SELECT fk_ligne FROM points WHERE fk_station=:id";
    $res = array();
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("id", $id);
        $stmt->execute();
        $lignes = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $db = null;
        foreach ($lignes as $l) {
            array_push($res, $l["fk_ligne"]);
        }
        return $res;
    } catch (PDOException $e) {
        return $res;
    }
}

function get_ligne($id, $echo = 1) {
    $result = array();

    //info de la ligne
    $sql = "SELECT * FROM lignes WHERE id=:id;";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("id", $id);
        $stmt->execute();
        $ligne = $stmt->fetch(PDO::FETCH_ASSOC);
        $db = null;
        $result = $ligne;
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }

    //Trajet
    $stations = get_path($id, 0);
    $path = array();
    foreach ($stations as $s) {
        array_push($path, array((float) $s['lat'], (float) $s['lon']));
    }

    $result["nb_stations"] = count($stations);
    $result["terminus1"] = $stations[0];
    $result["terminus2"] = $stations[count($stations) - 1];
    $result["path"] = $path;
    $result["stations"] = $stations;

    if ($echo)
        echo json_encode($result);
    else
        return $result;
}

function get_path($id, $echo = 1) {
    //les stations
    $sql = "SELECT s.*,p.position FROM stations s INNER JOIN points p ON p.fk_station = s.id WHERE fk_ligne=:id ORDER BY p.position ASC";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("id", $id);
        $stmt->execute();
        $stations = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $db = null;
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }

    if ($echo)
        echo json_encode($stations);
    else
        return $stations;
}

function get_all_lignes() {
    $result = array();

    $sql = "SELECT id FROM lignes WHERE 1 ORDER BY numero ASC;";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->execute();
        $lignes = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($lignes as $l)
            array_push($result, get_ligne($l["id"], 0));
        $db = null;
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }

    echo json_encode($result);
}

function search_station($query) {
    $query.="%";
    $sql = "SELECT * FROM stations WHERE nom LIKE :query";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("query", $query);
        $stmt->execute();
        $stations = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $db = null;
        echo json_encode($stations);
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }
}

function add_ligne() {
    //Ajoute simplement les infos d'une ligne pas le tracé...
    global $app;
    $request = $app->request();
    $info = json_decode($request->getBody());
    $sql = "INSERT INTO lignes (nom, numero, description, couleur) VALUES (:nom, :numero, :description, :couleur)";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("nom", $info->nom);
        $stmt->bindParam("description", $info->description);
        $stmt->bindParam("numero", $info->numero);
        $stmt->bindParam("couleur", $info->couleur);
        $stmt->execute();
        $info->id = $db->lastInsertID();
        $db = null;
        echo json_encode($info);
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }

    //tracé
    update_path($info->id, $info->stations);
}

function add_point($ligne, $station, $position) {
    //ajoute un point dans la BD
    $sql = "INSERT INTO points (fk_ligne, fk_station, position) VALUES (:ligne, :station, :position)";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("ligne", $ligne);
        $stmt->bindParam("station", $station);
        $stmt->bindParam("position", $position);
        $stmt->execute();
        $id_point = $db->lastInsertID();
        $db = null;

        return $id_point;
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }
}

function update_path($id, $tab) {
    //on efface le tracé précedent
    delete_path($id);

    //On ajoute le nouveau tracé
    foreach ($tab as $item) {
        add_point($id, $item->id, $item->position);
    }

    echo '{"success":{"text": "tracé mis à jour"}}';
}

function delete_path($id) {
    $sql = "DELETE FROM points WHERE fk_ligne=:id";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("id", $id);
        $stmt->execute();
        $db = null;
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
        return 1;
    }

    return 0;
}

function update_ligne($id) {
    //Maj uniquement des infos de la ligne, le tracé est géré par un autre appel
    global $app;
    $request = $app->request();
    $info = json_decode($request->getBody());

    $params = "";
    $required = array("nom", "description", "couleur", "visible", "numero"); //on n'utilise que certaines infos envoyées
    foreach ($info as $item => $value)
        if ($item != "" && in_array($item, $required))
            $params.=$item . "=:" . $item . ",";

    $params = substr($params, 0, -1);

    $sql = "UPDATE lignes SET " . $params . " WHERE id=:id";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);

        foreach ($info as $item => $value)
            if ($item != "" && in_array($item, $required))
                $stmt->bindParam($item, $info->{$item});

        $stmt->bindParam("id", $id);
        $stmt->execute();
        $db = null;
        if ($stmt->rowCount() > 0)
            echo json_encode($info);
        else
            echo '{"error":{"text": "Pas de ligne mise à jour"}}';
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }

    //tracé
    update_path($id, $info->stations);
}

function update_station($id) {
    global $app;
    $request = $app->request();
    $info = json_decode($request->getBody());

    $params = "";
    $required = array("nom", "description", "wikipedia"); //on n'utilise que certaines infos envoyées
    foreach ($info as $item => $value)
        if ($item != "" && in_array($item, $required))
            $params.=$item . "=:" . $item . ",";

    $params = substr($params, 0, -1);

    $sql = "UPDATE stations SET " . $params . " WHERE id=:id";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);

        foreach ($info as $item => $value)
            if ($item != "" && in_array($item, $required))
                $stmt->bindParam($item, $info->{$item});

        $stmt->bindParam("id", $id);
        $stmt->execute();
        $db = null;
        if ($stmt->rowCount() > 0)
            echo json_encode($info);
        else
            echo '{"error":{"text": "Pas de station mise à jour"}}';
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }
}

function delete_ligne($id) {
    $sql = "DELETE FROM lignes WHERE id=:id";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("id", $id);
        $stmt->execute();
        echo '{"success":{"text": "Ligne effacée"}}';
        $db = null;
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }

    delete_path($id);
}

//////////////////////////
// ROUTES
/////////////////////////
//////////////////////////
// GET
//default
$app->get('/', function () {
            $template = <<<EOT
<!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8"/>
            <title>Nothing to see here...</title>
        </head>
        <body>
            <h1>Got lost?</h1>
        </body>
    </html>
EOT;
            echo $template;
        });

//Toutes les stations
$app->get('/stations', 'get_all_stations');

//Une station
$app->get('/stations/:id', 'get_station');

//Toutes les lignes
$app->get('/lignes', 'get_all_lignes');

//Une ligne
$app->get('/lignes/:id', 'get_ligne');

//Tracé d'une ligne
//Recherche
$app->get('/stations/search/:query', 'search_station');

//////////////////////////////
// POST route (add)
$app->post('/lignes', 'add_ligne');


//////////////////////////////
// PUT route (update)
$app->put('/lignes/:id', 'update_ligne');
$app->put('/stations/:id', 'update_station');

//////////////////////////////
// DELETE route
$app->delete('/lignes/:id', 'delete_ligne');


////////////////////////
// RUN

$app->run();
