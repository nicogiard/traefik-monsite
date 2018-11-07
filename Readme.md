# Pré-requis
`sudo nano /etc/hosts`
```
...
127.0.0.1       www.monsite.fr
127.0.0.1       www.monsite.ph
```

# Lancement
Lancer un container traefik
```
traefik.sh 
```
Lancer un container avec mon application (et des labels traefik)
```
app.sh
```
Voir les logs du traefik
```
docker logs -f traefik
```

# Résultats attendus / obtenus
- http://www.monsite.ph => devrait rediriger vers http://www.monsite.fr/en/philippines (visiblement c'est ok)
- http://www.monsite.ph/contact => devrait rediriger vers http://www.monsite.fr/contact (visiblement ca reste sur http://www.monsite.ph/contact)
- http://www.monsite.fr => devrait rester sur http://www.monsite.fr
