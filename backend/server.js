const express = require('express');
const { Client } = require('pg');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

// Configura la conexión a la base de datos PostgreSQL
const dbConfig = {
    user: 'postgres',
    host: 'localhost',
    database: 'FarmaciaDB',
    password: 'MrcLfm5126',
    port: 5432,
};

const client = new Client(dbConfig);
client.connect();

// Ruta para obtener la lista de medicamentos
app.get('/medicamentos', (req, res) => {  
  const query = 'SELECT * FROM medicamentos';
    client.query(query, (err, result) => {
        if (err) {
            console.error('Error en la consulta:', err);
            res.status(500).json({ message: 'Error en la base de datos' });
        } else {
            res.status(200).json(result.rows);
        }
    });
});

// Ruta para procesar un pedido de medicamento
app.post('/realizar-pedido', (req, res) => {
    const { medicamento_id, cantidad } = req.body;

  // lógica para verificar si hay suficiente stock
  // y realizar el pedido, actualizando la base de datos.

  // actualización de stock:
    const updateQuery = 'UPDATE medicamentos SET stock = stock - $1 WHERE id = $2';
    client.query(updateQuery, [cantidad, medicamento_id], (err, result) => {
    if (err) {
        console.error('Error al actualizar el stock:', err);
        res.status(500).json({ message: 'Error en la base de datos' });
    } else {
        res.status(200).json({ message: 'Pedido realizado con éxito' });
    }
    });
});

// Inicia el servidor en el puerto 3000
app.listen(3000, () => {
    console.log('Servidor en ejecución en el puerto 3000');
});
