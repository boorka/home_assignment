FROM apache/airflow:3.1.6

# Install system deps as root
USER root

RUN apt-get update \
 && apt-get install -y openjdk-17-jdk \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Switch back to airflow for pip installs
USER airflow

RUN pip install --no-cache-dir pyspark==3.5.1

# Optional but nice
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PYSPARK_PYTHON=python
