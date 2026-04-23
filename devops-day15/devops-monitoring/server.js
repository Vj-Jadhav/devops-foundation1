const express = require('express');
const client = require('prom-client');

const app = express();
const PORT = 3000;

const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics({
  register: client.register
});

app.get('/', (req, res) => {
  res.send('Server is running');
});

app.get('/metrics', async (req, res) => {
  res.set('Content-Type', client.register.contentType);
  res.end(await client.register.metrics());
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});