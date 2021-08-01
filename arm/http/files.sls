/etc/httpd/conf.d/hosts.conf:
  file.managed:
    - source: salt://arm/http/hosts.conf 
    - require:
      - service: httpd

/etc/httpd/conf.d/auth_cas.conf:
  file.managed:
    - source: salt://arm/http/auth_cas.conf 
    - require:
      - service: httpd
