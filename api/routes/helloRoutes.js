const express = require('express');
const router = express.Router();
const HelloController = require('../controllers/helloController');

const helloController = new HelloController();

router.get('/', helloController.getHello.bind(helloController));

module.exports = router;
