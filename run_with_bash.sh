docker run --rm --name codeql-docker \
  --entrypoint /bin/bash \
  -v "./sample-codeql-ci/vulnerable-source-code/python/:/opt/src" \
  -v "./codeqllab/codeql-docker/results:/opt/results" \
  -e "LANGUAGE=python" \
  -e "FORMAT=sarif-latest" \
  -e "QS=python-security-and-quality.qls" \
  -e "THREADS=20" \
  -it fl4ming0/codeql:1.1
