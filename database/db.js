//INVOCACION DE MYSQL
const mysql = require('mysql');
const connection = mysql.createConnection({
  //Con variables de entorno
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_DATABASE
});

//CONEXION CON LA BASE DE DATOS
connection.connect((error)=>{
  if (error) {
    console.error('EL ERROR DE CONEXION ES: ' + error);
    return;
  }
  console.log('CONECTADO A LA BASE DE DATOS!! :D');
});

module.exports = connection;