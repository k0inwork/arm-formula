# This is the QA environment state tree for testing
# Anyone should be able to run this state tree on any supported platform when
# it is complete
include:
  - arm.core
  - arm.python
  - arm.redis
  - arm.http
  - arm.postgres
