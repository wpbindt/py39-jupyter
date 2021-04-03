FROM python:3.9

WORKDIR /app/

RUN apt update && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --upgrade pip
ADD requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

RUN python3 -m ipykernel install --user \
    && mkdir -p /root/.jupyter \
    && echo '{"NotebookApp": {"token": ""}}' > /root/.jupyter/jupyter_notebook_config.json

