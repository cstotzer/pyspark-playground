FROM quay.io/jupyter/pyspark-notebook

USER root

# Install required software
RUN apt-get update && apt-get install --no-install-recommends -y \
    pipx && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER jovyan

# Installing uv and let uv install dependencies, we'll use the pre-existing
# virtual environment living in /home/jovyan/base_env using the --active switch
# to keep container size to a minimun.
RUN pipx install uv \
    --pip-args="--no-cache-dir --disable-pip-version-check" \
    --python python3.12 \
    --active
