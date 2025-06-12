FROM python:3.9-slim

RUN mkdir -p /root/.pip && \
    tee /root/.pip/pip.conf > /dev/null <<'EOF'
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
trusted-host = pypi.tuna.tsinghua.edu.cn
disable-pip-version-check = true
EOF

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 8080

CMD ["python", "app.py"]

## docker build -t firfe/portall:1.0.8 .