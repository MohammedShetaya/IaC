const express = require('express');
const helloRoutes = require('./routes/helloRoutes');
const app = express();
const PORT = 3000;

app.use('/hello', helloRoutes);

app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`);
});

module.exports = app;