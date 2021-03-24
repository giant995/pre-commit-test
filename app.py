from flask import Flask, render_template, request, jsonify

import datetime

from ml_stripper import strip_tags

app = Flask(__name__)


@app.route('/', methods=['GET'])
def accueil(is_pristine=True):
    title = "Laboratoire 2 - Zodiac-o-tron"

    return render_template('accueil.tpl', title=title, is_pristine=is_pristine)


@app.route('/horoscope/')
def horoscope():
    is_valid = True
    error_msg = ''

    nom = strip_tags(request.args.get('nom', '0', type=str))
    if nom == '':
        is_valid = False
        error_msg = error_msg + ' Paramètre [nom] manquant'

    prenom = strip_tags(request.args.get('prenom', '0', type=str))
    if prenom == '':
        is_valid = False
        error_msg = error_msg + ' Paramètre [prénom] manquant'

    zodiac_signs = [
        'capricorne',
        'verseau',
        'poisson',
        'belier',
        'taureau',
        'gemeaux',
        'cancer',
        'lion',
        'vierge',
        'balance',
        'scorpion',
        'sagitaire'
    ]

    # indice corresponds to the month
    # first element of inner list is the seperating day of the month for the sign, check if day is less or equal
    # second element of inner list, if check is true the sign is at this index number in zodias_signs
    # third element of inner list, else if check is false the sign is at his index number in zodiac_signs
    equivalence_table = [
        [20, 0, 1],
        [19, 1, 2],
        [20, 2, 3],
        [19, 3, 4],
        [20, 4, 5],
        [21, 5, 6],
        [23, 6, 7],
        [23, 7, 8],
        [22, 8, 9],
        [22, 9, 10],
        [22, 10, 11],
        [20, 11, 0]
    ]
    date_naissance = strip_tags(request.args.get('dateNaissance', '0', type=str))
    if date_naissance == '':
        error_msg = error_msg + ' Paramètre [date] manquant'

    try:
        datetime.datetime.strptime(date_naissance, '%d/%m/%Y')
    except ValueError:
        is_valid = False
        error_msg = error_msg + ' Paramètre [date] invalide'

    sign = ''
    if is_valid:
        date_parts = list(map(int, date_naissance.split('/')))
        month_eq_table = equivalence_table[date_parts[1] - 1]
        if date_parts[0] <= month_eq_table[0]:
            sign = zodiac_signs[month_eq_table[1]]
        else:
            sign = zodiac_signs[month_eq_table[2]]

    return jsonify(
        {'data': render_template(
            'horoscope_result.tpl',
            is_valid=is_valid,
            error_msg=error_msg,
            nom=nom,
            prenom=prenom,
            date_naissance=date_naissance,
            sign=sign
        )}
    )


@app.errorhandler(404)
def page_not_found(error):
    return render_template('erreur404.tpl', url=request.path), 404


if __name__ == "__main__":
    app.run(ssl_context=('cert.pem', 'key.pem'))
