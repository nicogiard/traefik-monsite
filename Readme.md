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

# Logs Traefik (juste après le démarrage du container de l'application)
```
time="2018-11-07T13:27:43Z" level=info msg="Using TOML configuration file /etc/traefik/traefik.toml"
time="2018-11-07T13:27:43Z" level=info msg="Traefik version v1.7.4 built on 2018-10-30_10:44:30AM"
time="2018-11-07T13:27:43Z" level=debug msg="Global configuration loaded {\"LifeCycle\":{\"RequestAcceptGraceTimeout\":0,\"GraceTimeOut\":10000000000},\"GraceTimeOut\":0,\"Debug\":true,\"CheckNewVersion\":true,\"SendAnonymousUsage\":false,\"AccessLogsFile\":\"\",\"AccessLog\":null,\"TraefikLogsFile\":\"\",\"TraefikLog\":null,\"Tracing\":null,\"LogLevel\":\"DEBUG\",\"EntryPoints\":{\"http\":{\"Address\":\":80\",\"TLS\":null,\"Redirect\":null,\"Auth\":null,\"WhitelistSourceRange\":null,\"WhiteList\":null,\"Compress\":false,\"ProxyProtocol\":null,\"ForwardedHeaders\":{\"Insecure\":true,\"TrustedIPs\":null}},\"traefik\":{\"Address\":\":8080\",\"TLS\":null,\"Redirect\":null,\"Auth\":null,\"WhitelistSourceRange\":null,\"WhiteList\":null,\"Compress\":false,\"ProxyProtocol\":null,\"ForwardedHeaders\":{\"Insecure\":true,\"TrustedIPs\":null}}},\"Cluster\":null,\"Constraints\":[],\"ACME\":null,\"DefaultEntryPoints\":[\"http\"],\"ProvidersThrottleDuration\":2000000000,\"MaxIdleConnsPerHost\":200,\"IdleTimeout\":0,\"InsecureSkipVerify\":false,\"RootCAs\":null,\"Retry\":null,\"HealthCheck\":{\"Interval\":30000000000},\"RespondingTimeouts\":null,\"ForwardingTimeouts\":null,\"AllowMinWeightZero\":false,\"KeepTrailingSlash\":false,\"Web\":null,\"Docker\":{\"Watch\":true,\"Filename\":\"\",\"Constraints\":null,\"Trace\":false,\"TemplateVersion\":2,\"DebugLogGeneratedTemplate\":false,\"Endpoint\":\"unix:///var/run/docker.sock\",\"Domain\":\"docker.local\",\"TLS\":null,\"ExposedByDefault\":false,\"UseBindPortIP\":false,\"SwarmMode\":false,\"Network\":\"\"},\"File\":null,\"Marathon\":null,\"Consul\":null,\"ConsulCatalog\":null,\"Etcd\":null,\"Zookeeper\":null,\"Boltdb\":null,\"Kubernetes\":null,\"Mesos\":null,\"Eureka\":null,\"ECS\":null,\"Rancher\":null,\"DynamoDB\":null,\"ServiceFabric\":null,\"Rest\":null,\"API\":{\"EntryPoint\":\"traefik\",\"Dashboard\":true,\"Debug\":true,\"CurrentConfigurations\":null,\"Statistics\":null},\"Metrics\":null,\"Ping\":{\"EntryPoint\":\"traefik\"},\"HostResolver\":null}"
time="2018-11-07T13:27:43Z" level=info msg="\nStats collection is disabled.\nHelp us improve Traefik by turning this feature on :)\nMore details on: https://docs.traefik.io/basics/#collected-data\n"
time="2018-11-07T13:27:43Z" level=info msg="Preparing server http &{Address::80 TLS:<nil> Redirect:<nil> Auth:<nil> WhitelistSourceRange:[] WhiteList:<nil> Compress:false ProxyProtocol:<nil> ForwardedHeaders:0xc000562a40} with readTimeout=0s writeTimeout=0s idleTimeout=3m0s"
time="2018-11-07T13:27:43Z" level=info msg="Preparing server traefik &{Address::8080 TLS:<nil> Redirect:<nil> Auth:<nil> WhitelistSourceRange:[] WhiteList:<nil> Compress:false ProxyProtocol:<nil> ForwardedHeaders:0xc000562a60} with readTimeout=0s writeTimeout=0s idleTimeout=3m0s"
time="2018-11-07T13:27:43Z" level=info msg="Starting server on :80"
time="2018-11-07T13:27:43Z" level=info msg="Starting server on :8080"
time="2018-11-07T13:27:43Z" level=info msg="Starting provider configuration.ProviderAggregator {}"
time="2018-11-07T13:27:43Z" level=info msg="Starting provider *docker.Provider {\"Watch\":true,\"Filename\":\"\",\"Constraints\":null,\"Trace\":false,\"TemplateVersion\":2,\"DebugLogGeneratedTemplate\":false,\"Endpoint\":\"unix:///var/run/docker.sock\",\"Domain\":\"docker.local\",\"TLS\":null,\"ExposedByDefault\":false,\"UseBindPortIP\":false,\"SwarmMode\":false,\"Network\":\"\"}"
time="2018-11-07T13:27:43Z" level=debug msg="Provider connection established with docker 18.03.1-ce (API 1.37)"
time="2018-11-07T13:27:43Z" level=debug msg="Filtering disabled container /traefik"
time="2018-11-07T13:27:43Z" level=debug msg="Filtering disabled container /postgres"
time="2018-11-07T13:27:43Z" level=debug msg="Configuration received from provider docker: {}"
time="2018-11-07T13:27:43Z" level=info msg="Server configuration reloaded on :80"
time="2018-11-07T13:27:43Z" level=info msg="Server configuration reloaded on :8080"
time="2018-11-07T13:27:57Z" level=debug msg="Provider event received {Status:start ID:9612a487000bcac3fb3e124bcc3a2331c8b03b61fe3d956ba148175f645f7e47 From:coaxys/play1:1.5.0 Type:container Action:start Actor:{ID:9612a487000bcac3fb3e124bcc3a2331c8b03b61fe3d956ba148175f645f7e47 Attributes:map[image:coaxys/play1:1.5.0 name:monsite traefik.phhome.frontend.redirect.regex:^http://www.monsite.ph/$ traefik.enable:true traefik.phhome.frontend.redirect.replacement:http://www.monsite.fr/en/philippines traefik.phhome.port:9000 traefik.phreste.port:9000 traefik.phreste.frontend.redirect.replacement:http://www.monsite.fr/ traefik.www.frontend.rule:Host:www.monsite.fr traefik.www.port:9000 traefik.backend.loadbalancer.method:wrr traefik.phhome.frontend.rule:Host:www.monsite.ph traefik.phreste.frontend.redirect.regex:^http://www.monsite.ph/(.*) traefik.phreste.frontend.rule:Host:www.monsite.ph]} Scope:local Time:1541597277 TimeNano:1541597277794031089}"
time="2018-11-07T13:27:57Z" level=debug msg="originLabelsmap[traefik.backend.loadbalancer.method:wrr traefik.enable:true traefik.phreste.frontend.redirect.regex:^http://www.monsite.ph/(.*) traefik.phreste.frontend.redirect.replacement:http://www.monsite.fr/ traefik.phreste.frontend.rule:Host:www.monsite.ph traefik.www.port:9000 traefik.phhome.frontend.redirect.regex:^http://www.monsite.ph/$ traefik.phhome.frontend.redirect.replacement:http://www.monsite.fr/en/philippines traefik.phhome.frontend.rule:Host:www.monsite.ph traefik.phhome.port:9000 traefik.phreste.port:9000 traefik.www.frontend.rule:Host:www.monsite.fr]"
time="2018-11-07T13:27:57Z" level=debug msg="allLabelsmap[:map[traefik.backend.loadbalancer.method:wrr traefik.enable:true] phreste:map[traefik.frontend.redirect.replacement:http://www.monsite.fr/ traefik.frontend.rule:Host:www.monsite.ph traefik.frontend.redirect.regex:^http://www.monsite.ph/(.*) traefik.port:9000] phhome:map[traefik.port:9000 traefik.frontend.redirect.regex:^http://www.monsite.ph/$ traefik.frontend.redirect.replacement:http://www.monsite.fr/en/philippines traefik.frontend.rule:Host:www.monsite.ph] www:map[traefik.frontend.rule:Host:www.monsite.fr traefik.port:9000]]"
time="2018-11-07T13:27:57Z" level=debug msg="Filtering disabled container /traefik"
time="2018-11-07T13:27:57Z" level=debug msg="Filtering disabled container /postgres"
time="2018-11-07T13:27:57Z" level=debug msg="originLabelsmap[traefik.backend.loadbalancer.method:wrr traefik.enable:true traefik.phreste.frontend.redirect.regex:^http://www.monsite.ph/(.*) traefik.phreste.frontend.redirect.replacement:http://www.monsite.fr/ traefik.phreste.frontend.rule:Host:www.monsite.ph traefik.www.port:9000 traefik.phhome.frontend.redirect.regex:^http://www.monsite.ph/$ traefik.phhome.frontend.redirect.replacement:http://www.monsite.fr/en/philippines traefik.phhome.frontend.rule:Host:www.monsite.ph traefik.phhome.port:9000 traefik.phreste.port:9000 traefik.www.frontend.rule:Host:www.monsite.fr]"
time="2018-11-07T13:27:57Z" level=debug msg="allLabelsmap[:map[traefik.backend.loadbalancer.method:wrr traefik.enable:true] phreste:map[traefik.frontend.redirect.replacement:http://www.monsite.fr/ traefik.frontend.rule:Host:www.monsite.ph traefik.port:9000 traefik.frontend.redirect.regex:^http://www.monsite.ph/(.*)] phhome:map[traefik.frontend.redirect.regex:^http://www.monsite.ph/$ traefik.frontend.redirect.replacement:http://www.monsite.fr/en/philippines traefik.frontend.rule:Host:www.monsite.ph traefik.port:9000] www:map[traefik.frontend.rule:Host:www.monsite.fr traefik.port:9000]]"
time="2018-11-07T13:27:57Z" level=debug msg="Configuration received from provider docker: {\"backends\":{\"backend-monsite-phhome\":{\"servers\":{\"server-monsite-d07d3fecbdebdc96cd451fceda3c0692\":{\"url\":\"http://172.17.0.4:9000\",\"weight\":1}},\"loadBalancer\":{\"method\":\"wrr\"}},\"backend-monsite-phreste\":{\"servers\":{\"server-monsite-d07d3fecbdebdc96cd451fceda3c0692\":{\"url\":\"http://172.17.0.4:9000\",\"weight\":1}},\"loadBalancer\":{\"method\":\"wrr\"}},\"backend-monsite-www\":{\"servers\":{\"server-monsite-d07d3fecbdebdc96cd451fceda3c0692\":{\"url\":\"http://172.17.0.4:9000\",\"weight\":1}},\"loadBalancer\":{\"method\":\"wrr\"}}},\"frontends\":{\"frontend-phhome-monsite-phhome\":{\"entryPoints\":[\"http\"],\"backend\":\"backend-monsite-phhome\",\"routes\":{\"route-frontend-phhome-monsite-phhome\":{\"rule\":\"Host:www.monsite.ph\"}},\"passHostHeader\":true,\"priority\":0,\"basicAuth\":null,\"redirect\":{\"regex\":\"^http://www.monsite.ph/$\",\"replacement\":\"http://www.monsite.fr/en/philippines\"}},\"frontend-phreste-monsite-phreste\":{\"entryPoints\":[\"http\"],\"backend\":\"backend-monsite-phreste\",\"routes\":{\"route-frontend-phreste-monsite-phreste\":{\"rule\":\"Host:www.monsite.ph\"}},\"passHostHeader\":true,\"priority\":0,\"basicAuth\":null,\"redirect\":{\"regex\":\"^http://www.monsite.ph/(.*)\",\"replacement\":\"http://www.monsite.fr/\"}},\"frontend-www-monsite-www\":{\"entryPoints\":[\"http\"],\"backend\":\"backend-monsite-www\",\"routes\":{\"route-frontend-www-monsite-www\":{\"rule\":\"Host:www.monsite.fr\"}},\"passHostHeader\":true,\"priority\":0,\"basicAuth\":null}}}"
time="2018-11-07T13:27:57Z" level=debug msg="Wiring frontend frontend-phhome-monsite-phhome to entryPoint http"
time="2018-11-07T13:27:57Z" level=debug msg="Creating backend backend-monsite-phhome"
time="2018-11-07T13:27:57Z" level=debug msg="Creating regex redirect http -> ^http://www.monsite.ph/$ -> http://www.monsite.fr/en/philippines"
time="2018-11-07T13:27:57Z" level=debug msg="Frontend frontend-phhome-monsite-phhome redirect created"
time="2018-11-07T13:27:57Z" level=debug msg="Adding TLSClientHeaders middleware for frontend frontend-phhome-monsite-phhome"
time="2018-11-07T13:27:57Z" level=debug msg="Creating load-balancer wrr"
time="2018-11-07T13:27:57Z" level=debug msg="Creating server server-monsite-d07d3fecbdebdc96cd451fceda3c0692 at http://172.17.0.4:9000 with weight 1"
time="2018-11-07T13:27:57Z" level=debug msg="Creating route route-frontend-phhome-monsite-phhome Host:www.monsite.ph"
time="2018-11-07T13:27:57Z" level=debug msg="Wiring frontend frontend-phreste-monsite-phreste to entryPoint http"
time="2018-11-07T13:27:57Z" level=debug msg="Creating backend backend-monsite-phreste"
time="2018-11-07T13:27:57Z" level=debug msg="Creating regex redirect http -> ^http://www.monsite.ph/(.*) -> http://www.monsite.fr/"
time="2018-11-07T13:27:57Z" level=debug msg="Frontend frontend-phreste-monsite-phreste redirect created"
time="2018-11-07T13:27:57Z" level=debug msg="Adding TLSClientHeaders middleware for frontend frontend-phreste-monsite-phreste"
time="2018-11-07T13:27:57Z" level=debug msg="Creating load-balancer wrr"
time="2018-11-07T13:27:57Z" level=debug msg="Creating server server-monsite-d07d3fecbdebdc96cd451fceda3c0692 at http://172.17.0.4:9000 with weight 1"
time="2018-11-07T13:27:57Z" level=debug msg="Creating route route-frontend-phreste-monsite-phreste Host:www.monsite.ph"
time="2018-11-07T13:27:57Z" level=debug msg="Wiring frontend frontend-www-monsite-www to entryPoint http"
time="2018-11-07T13:27:57Z" level=debug msg="Creating backend backend-monsite-www"
time="2018-11-07T13:27:57Z" level=debug msg="Adding TLSClientHeaders middleware for frontend frontend-www-monsite-www"
time="2018-11-07T13:27:57Z" level=debug msg="Creating load-balancer wrr"
time="2018-11-07T13:27:57Z" level=debug msg="Creating server server-monsite-d07d3fecbdebdc96cd451fceda3c0692 at http://172.17.0.4:9000 with weight 1"
time="2018-11-07T13:27:57Z" level=debug msg="Creating route route-frontend-www-monsite-www Host:www.monsite.fr"
time="2018-11-07T13:27:57Z" level=info msg="Server configuration reloaded on :80"
time="2018-11-07T13:27:57Z" level=info msg="Server configuration reloaded on :8080"
```
