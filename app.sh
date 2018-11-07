#!/bin/bash

docker run --name monsite -v /home/nicogiard/tmp/traefik/monsite:/app -p 9000:9000 -d \
 --label "traefik.phhome.frontend.redirect.regex=^http://www.monsite.ph/$" \
 --label "traefik.phhome.frontend.redirect.replacement=http://www.monsite.fr/en/philippines" \
 --label "traefik.phhome.frontend.rule=Host:www.monsite.ph" \
 --label "traefik.phhome.port=9000" \
 --label "traefik.phreste.frontend.redirect.regex=^http://www.monsite.ph/(.*)" \
 --label "traefik.phreste.frontend.redirect.replacement=http://www.monsite.fr/$${1}" \
 --label "traefik.phreste.frontend.rule=Host:www.monsite.ph" \
 --label "traefik.phreste.port=9000" \
 --label "traefik.www.frontend.rule=Host:www.monsite.fr" \
 --label "traefik.www.port=9000" \
 --label "traefik.backend.loadbalancer.method=wrr" \
 --label "traefik.enable=true" \
 coaxys/play1:1.5.0 run /app --%prod
