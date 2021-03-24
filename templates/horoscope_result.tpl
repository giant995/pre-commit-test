{% if is_valid %}
<img src=>
<p>Cher {{ prenom }} {{ nom }}, le {{ date_naissance }} signifie que vous êtes un <a href="/static/{{ sign }}.png">{{ sign }}</a></p>
<p>Aujourd'hui, vous faites le tri autour de vous. Vous avez besoin de relations sincères, vraies et profondes. Dans le domaine des sentiments vous trouvez chaussure à votre pied. Autour de vous des personnes correspondent complètement à vos attentes.</p>
<p><strong>En couple:</strong> La passion vous anime dans votre relation de couple. Vous êtes très attentionné envers votre partenaire, baisers langoureux, gestes tendres, attentions particulières. Entre vous l'ambiance se réchauffe. Votre soirée se présente bien avec de la douceur au programme.</p>
<p><strong>Célibataire:</strong> Dans le domaine professionnel, une rencontre semble se profiler. Guettez les petits nouveaux qui traînent à la machine à café. Cupidon tire sa flèche aujourd'hui, ouvrez grand les yeux ! Laissez-vous séduire sans penser au lendemain !</p>
{% else %}
<p>Erreur: {{ error_msg }}</p>
{% endif %}
