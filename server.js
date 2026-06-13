
const express = require('express');
const cors = require('cors');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static('.'));

// Home Route
app.get('/', (req, res) => {

  res.sendFile(__dirname + '/index.html');

});

// Register Route
app.post('/register', (req, res) => {

  console.log('Received Form Data:');

  console.log(req.body);

  res.json({
    success: true,
    message: 'Registration Successful'
  });

});

// Start Server
const PORT = 3000;

app.listen(PORT, () => {

  console.log('Server running at http://localhost:3000');

});
