docker run --rm -it \
  --name codeql-docker \
  -v "./sample-codeql-ci/vulnerable-source-code/python/:/opt/src" \
  -v "./codeql-docker/results:/opt/results" \
  -e LANGUAGE=python \
  -e FORMAT=sarif-latest \
  -e QS=python-security-and-quality.qls \
  -e THREADS=20 \
  --entrypoint /bin/bash \
  fl4ming0/codeql:1.1
