redis-epel:
  pkg:
    - installed
    - sources:
      - epel-release : 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'

redis:
  pkg:
    - installed
  service.running:
    - enable: True
    - start: True
  require:
    - pkg: redis-epel
