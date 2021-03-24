<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{{ title }}</title>
    <script type=text/javascript>
      $SCRIPT_ROOT = {{ request.script_root|tojson|safe }};
    </script>
</head>
<body>
    <a href="{{ url_for('accueil') }}"><img src="/static/zodiac.png" alt="zodiac signs"></a>
    <h1>{{ title }}</h1>
    <br><br>
    <form id="horoscopeForm" action="" method="post">
        <p><input type="text" placeholder="Prénom" name="prenom"><br></p>
        <p><input type="text" placeholder="Nom" name="nom"><br></p>
        <p>
            <input placeholder="Date de naissance" type="text" name="dateNaissance" id="datepicker" readonly="readonly" />
        </p>
        <button id="getHoroscope" type="button">Voir mon horoscope</button>
    </form>

    <div id="horoscope_result"></div>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script src="/static/js/datepicker.js" type="text/javascript"></script>
    <script src="/static/js/horoscope.js" type="text/javascript"></script>
</body>
</html>
