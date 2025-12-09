##################################### JAVA ###################################


docker run --rm --name codeql-docker   --entrypoint /bin/bash   -v "./src:/opt/src"   -v "./results:/opt/results"   -e "LANGUAGE=java"   -e "FORMAT=sarif-latest"   -e "QS=java-security-and-quality.qls"   -e "THREADS=5"   -it fl4ming0/codeql:1.1


apt-get update && apt-get install -y --no-install-recommends \
    openjdk-8-jdk \
    ant \
    git \
    curl \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

codeql database create /opt/src/codeql-db --language=java --source-root=/opt/src/ --command="ant clean compile -Dplatforms.JDK_1.8.home=/usr/lib/jvm/java-8-openjdk-amd64"
codeql database analyze --threads=10 --ram 12000  --format=sarif-latest  --output=/opt/results/issue.sarif /opt/src/codeql-db/ java-security-and-quality.qls





##################################### CPP #######################################


docker run --rm --name codeql-docker   --entrypoint /bin/bash   -v "./src:/opt/src"   -v "./results:/opt/results"   -e "LANGUAGE=cpp"   -e "FORMAT=sarif-latest"   -e "QS=cpp-security-and-quality.qls"   -e "THREADS=5"   -it fl4ming0/codeql:1.1



apt-get update && apt-get install -y \
    build-essential \
    gcc g++ make cmake \
    git wget curl unzip ca-certificates \
    python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*



codeql database create /opt/src/codeql-db --language=cpp --source-root=/opt/src/ --command="sh build.cmd"

codeql database analyze --threads=2  --format=sarif-latest  --output=/opt/results/issue.sarif /opt/src/codeql-db cpp-security-and-quality.qls
