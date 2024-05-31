const mysql = require('mysql2/promise');
// async function connectToDatabase() {
//   try {
//     const pool = await mysql.createPool({
//       host: 'localhost',
//       user: 'root',
//       password: '',
//       database: 'cellphone',
//       waitForConnections: true,
//       connectionLimit: 10,
//       queueLimit: 0
//     });
//     return pool;
//   } catch (error) {
//     console.error('Error connecting to the database:', error);
//     return null;
//   }
// }


// module.exports = connectToDatabase;
// module.exports = fetchDataAndWriteToFile;
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  database: 'cellphone',
  // password: 'password'
})
module.exports = pool;