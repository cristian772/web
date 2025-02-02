import os
from flask import Flask, render_template
from flask_wtf.csrf import CSRFProtect
from flask_sslify import SSLify

app = Flask(__name__)

# Génération d'une clé secrète aléatoire pour les sessions et la sécurité
app.secret_key = os.urandom(24)

# Protection contre les attaques CSRF
csrf = CSRFProtect(app)

# Forcer l'utilisation de HTTPS
sslify = SSLify(app)

# Route principale
@app.route('/')
def index():
    # Liste des promotions classées par catégorie
    promotions_by_category = {
        "Tech": [
            {'title': 'Ordinateur Dell', 'description': 'PC Portable Dell Inspiron', 'link': 'https://www.amazon.fr/Dell-Inspiron-Ordinateur-Processeur-Graphique/dp/B0CZC5NV1H', 'image': "https://m.media-amazon.com/images/I/71QsHNnkWHL._AC_SL1500_.jpg"},
            {'title': 'Casque Audio', 'description': 'Casque Sony avec réduction de bruit', 'link': 'https://www.amazon.fr/Sony-Casque-Bluetooth-Reduction-Wh1000xm4/dp/B08C7KG5LP', 'image': "https://m.media-amazon.com/images/I/51SqdXdtPGL._AC_SL1200_.jpg"}
        ],
        "Vêtements": [
            {'title': 'T-shirt Nike', 'description': 'T-shirt Nike 100% coton', 'link': 'https://www.nike.com/fr/t/t-shirt-club-pour-homme', 'image': "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/d3c0c7b8-9a8d-46f1-9f1a-fcfb1545503c/t-shirt-club-pour-homme-H4LxVJ.png"},
            {'title': 'Chaussures Adidas', 'description': 'Baskets Adidas ultraboost', 'link': 'https://www.adidas.fr/ultraboost', 'image': "https://assets.adidas.com/images/w_600,f_auto,q_auto/58b0631a7a854de1978aad0b01164016_9366/Ultraboost_22_Chaussures_Noir_GX3061_01_standard.jpg"}
        ],
        "Maison": [
            {'title': 'Aspirateur Robot', 'description': 'Aspirateur iRobot connecté', 'link': 'https://www.amazon.fr/iRobot-Roomba-Aspirateur-Connect%C3%A9-Autonomie/dp/B08P3KJCGD', 'image': "https://m.media-amazon.com/images/I/71uhGcf1tsL._AC_SL1500_.jpg"}
        ]
    }

    return render_template('index.html', promotions_by_category=promotions_by_category)

# Lancer l'application
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
