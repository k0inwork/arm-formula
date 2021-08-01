{% import_json 'arm/python/python_modules.json' as python_modules %}

python-pkgs:
  pkg:
    - installed
    - names:
      - python3
      - python3-pip
      - python2-pip
      - python3-devel
      - gcc 
      - bison

{% for mod, ver in python_modules.items() %}
{{mod}}::
  pip.installed:
    {% if ver %}
    - name: {{mod}} == {{ver}}
    {% else %}
    - find-links: '{{mod}}' 
    {% endif %}
    - bin_env: '/usr/bin/pip3'
    - require:
      - pkg: python3-pip
{% endfor %}
