// import express from "express";
const express = require('express');
const bodyParser = require('body-parser');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const session = require('express-session');
var md5 = require('js-md5');
const configViewEngine = require('./configs/viewEngine');
require('dotenv').config();
const app = express()
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(session({
  secret: 'your_secret_key',
  resave: false,
  saveUninitialized: true
}));
app.use(session({
  secret: 'your-secret-key',
  resave: false,
  saveUninitialized: true
}));
//localStorge 
if (typeof localStorage === "undefined" || localStorage === null) {
  var LocalStorage = require('node-localstorage').LocalStorage;
  localStorage = new LocalStorage('./scratch');
}
localStorage.setItem('myFirstKey', 'myFirstValue');
console.log(localStorage.getItem('myFirstKey'));

const port = process.env.PORT || 4141;
const webRouter = require('./router/web');
//config template view engine
configViewEngine(app);

app.use('/', webRouter);

// run page cellphone
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})