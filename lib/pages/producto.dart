import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del Proveedor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Proveedor 1",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Especialista en instalación y mantenimiento de aires acondicionados."),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Agregar al carrito o contactar
                print("Contactar proveedor");
              },
              child: const Text("Contactar"),
            ),
          ],
        ),
      ),
    );
  }
}