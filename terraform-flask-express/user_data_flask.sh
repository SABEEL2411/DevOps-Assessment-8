#!/bin/bash
sudo apt update -y
sudo apt install -y python3 python3-pip

mkdir -p /home/ubuntu/flask_app
cat <<EOF > /home/ubuntu/flask_app/app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from Flask Backend!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
EOF

nohup python3 /home/ubuntu/flask_app/app.py &

