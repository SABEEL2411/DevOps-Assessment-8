#!/bin/bash
sudo apt update -y
sudo apt install -y nodejs npm

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

