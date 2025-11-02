#!/bin/bash
# Update packages
sudo apt update -y
sudo apt install -y python3 python3-pip nodejs npm

# --- Flask App ---
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

# --- Express App ---
mkdir -p /home/ubuntu/express_app
cat <<EOF > /home/ubuntu/express_app/app.js
const express = require('express');
const app = express();
app.get('/', (req, res) => {
  res.send('Hello from Express Frontend!');
});
app.listen(3000, '0.0.0.0', () => console.log('Express running on port 3000'));
EOF

nohup node /home/ubuntu/express_app/app.js &

