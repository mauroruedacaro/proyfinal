// Simulación de datos de medicamentos

const medicamentos = [
    { id: 1, nombre: "Medicamento 1", stock: 10, precio: 10.99, impuesto: 0.1 },
    { id: 2, nombre: "Medicamento 2", stock: 5, precio: 8.99, impuesto: 0.08 },
    // Agregar más medicamentos
];

// Función para cargar medicamentos en el select
function cargarMedicamentos() {
    const select = document.getElementById("medicamento-select");
    medicamentos.forEach(medicamento => {
        const option = document.createElement("option");
        option.value = medicamento.id;
        option.textContent = medicamento.nombre;
        select.appendChild(option);
    });
}

// Función para actualizar el resumen de la venta
function actualizarVentaResumen() {
    const medicamentoId = document.getElementById("medicamento-select").value;
    const cantidad = parseInt(document.getElementById("cantidad").value);
    const medicamento = medicamentos.find(m => m.id == medicamentoId);

    if (medicamento) {
        const valorVenta = cantidad * medicamento.precio;
        const impuestos = valorVenta * medicamento.impuesto;
        const valorTotal = valorVenta + impuestos;

        document.getElementById("valor-venta").textContent = valorVenta.toFixed(2);
        document.getElementById("impuestos").textContent = impuestos.toFixed(2);
        document.getElementById("valor-total").textContent = valorTotal.toFixed(2);

        document.getElementById("venta-resumen").style.display = "block";
    }
}

// Cargar medicamentos y configurar el botón de venta
cargarMedicamentos();
document.getElementById("realizar-venta").addEventListener("click", actualizarVentaResumen);
