require('dotenv').config({ path: 'back-end/.env' }); // Explicitly specify the path

console.log('MONGO_URI:', process.env.MONGO_URI); // Debugging line

const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();

app.use(cors());
app.use(bodyParser.json());

mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Connected to MongoDB'))
  .catch(err => console.error('MongoDB connection error:', err));

app.use('/products', require('./routes/productRoutes'));

app.listen(3000, () => console.log('Server running on port 3000'));