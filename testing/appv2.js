function realizarPedido(id) {
    const cantidadInput = document.getElementById(`cantidad-${id}`);
    const stock = parseInt(document.getElementById(`stock-${id}`).textContent);
    const precio = parseFloat(document.getElementById(`precio-${id}`).textContent);
    const cantidad = parseInt(cantidadInput.value);

    if (cantidad > 0 && cantidad <= stock) {
        const valorVenta = cantidad * precio;
        const impuestos = valorVenta * 0.1; // 10% de impuestos
        const valorTotal = valorVenta + impuestos;

        // Enviar la solicitud al servidor para procesar el pedido y actualizar la base de datos.
        document.getElementById("pedidoForm").addEventListener("submit", function (e) {
            e.preventDefault(); // Evita el envío predeterminado del formulario
        
            const medicamento = document.getElementById("medicamento").value;
            const cantidad = parseInt(document.getElementById("cantidad").value);
        
            // Realiza una solicitud POST al backend
            fetch('/realizar-pedido', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ medicamento, cantidad })
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById("mensaje").textContent = data.message;
            })
            .catch(error => {
                console.error('Error al realizar el pedido:', error);
                document.getElementById("mensaje").textContent = 'Error al realizar el pedido';
            });
        });
        

        document.getElementById("mensaje").textContent = `Pedido realizado. Valor Total: $${valorTotal.toFixed(2)}`;
    } else {
        document.getElementById("mensaje").textContent = "Cantidad no válida o stock insuficiente.";
    }
}
