const express = require('express');
const app = express();
const port = 3000;
const version = 'v1';

app.get('/', (req, res) => {
  res.json({ status: 'ok', message: version });
});

app.listen(port, () => {
  console.log(`App listening on port ${port}, version ${version}`);
});
