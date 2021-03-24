<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>404 page not found</title>
</head>
<body>
<a href="{{ url_for('accueil') }}"><img src="/static/404.png" alt="not found image"></a>
<br><br>
<p>La page <strong>{{ url }}</strong> est introuvable. Veuillez vérifier la syntaxe.</p>
<p>Retourner à l'<a href="{{ url_for('accueil') }}">accueil</a>
</body>
</html>
