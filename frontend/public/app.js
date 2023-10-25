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
