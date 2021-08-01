postgres-repo:
  pkgrepo.managed:
    - humanname: PostgreSQL 12 for RHEL/CentOS 7 - x86_64
    - baseurl: https://download.postgresql.org/pub/repos/yum/12/redhat/rhel-7-x86_64
    - gpgcheck: 0
    - enabled: 1

postgres-pkgs:
  pkg:
    - installed
    - names:
      - postgresql12-server
      - postgresql12
    - require:
      - postgres-repo

Install db:
  cmd.run:
    - name: postgresql-12-setup initdb
    - creates: /var/lib/pgsql/12/data/pg_ident.conf
    - require:
      - postgres-pkgs

/var/lib/pgsql/12/data/pg_hba.conf:
  file.managed:
    - createTrue: False
    - contents:
      - local   all             all                                     peer
      - host    all             all             127.0.0.1/32            password  
      - host    all             all             ::1/128                 password
    - require:
      - Install db

sudo -u postgres  psql -c "alter user postgres with password 'postgres';"; date > /tmp/postgres_started:
  cmd:
    - wait
    - watch:
      - service: postgresql-12.service

postgresql-12.service:
  service.running:
    - enable: True
    - start: True
    - require:
      - /var/lib/pgsql/12/data/pg_hba.conf

