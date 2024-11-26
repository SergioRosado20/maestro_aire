import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índice seleccionado en el BottomNavigationBar

  void _onItemTapped(int index) {
    print(_selectedIndex);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> productList = [
      {'name': 'Portátiles', 'image': 'lib/assets/productos/p1.jpg'},
      {'name': 'De Ventana', 'image': 'lib/assets/productos/p2.jpg'},
      {'name': 'De Pared', 'image': 'lib/assets/productos/p3.jpg'},
      {'name': 'De Techo', 'image': 'lib/assets/productos/p4.jpg'},
    ];

    List<Map<String, String>> proveedorList = [
      {'type': 'Vendedor', 'name': 'Mirage', 'image': 'lib/assets/proveedores/proveedor1.jpg'},
      {'type': 'Instalador', 'name': 'Climatización Rosario', 'image': 'lib/assets/proveedores/proveedor2.png'},
      {'type': 'Vendedor', 'name': 'York', 'image': 'lib/assets/proveedores/proveedor3.jpg'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 239, 239, 239),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Buscar productos...",
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(  // Para permitir el desplazamiento vertical
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Carrusel de imágenes
            CarouselSlider(
              options: CarouselOptions(
                height: 200,  // Altura del carrusel
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [
                'lib/assets/b1.jpg', // Aquí puedes poner tus URLs de imágenes
                'lib/assets/b2.jpg',
                'lib/assets/b3.jpg',
              ].map((url) {
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Color de la sombra con opacidad
                        blurRadius: 10, // Difuminado de la sombra
                        offset: const Offset(4, 4), // Desplazamiento de la sombra
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20.0), // Borde redondeado
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), // Ajusta el radio del borde aquí
                    child: Image.asset(
                      url,
                      fit: BoxFit.fitWidth, // Ajusta el modo de relleno de la imagen
                      width: 350,
                    ),
                  ),
                );
              }).toList(),
            ),
            
            // Título de la sección de productos
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Más vendido en la zona",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            
            // Productos con desplazamiento horizontal
            SizedBox(
              height: 160,  // Altura de la fila de productos
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length, // Número de productos a mostrar
                itemBuilder: (context, index) {
                  // Obtenemos el nombre y la imagen del producto desde el mapa
                  String productName = productList[index]['name']!;
                  String productImage = productList[index]['image']!;
                  
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/producto');
                      },
                      child: Container(
                        width: 110, // Ancho de cada producto
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  productImage, // Usamos la imagen del mapa
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                productName,  // Usamos el nombre del mapa
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

// Título de la sección de productos
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Vendedores y Servicios",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),

            SizedBox(
              height: 270,  // Altura de la fila de productos
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: proveedorList.length, // Número de productos a mostrar
                itemBuilder: (context, index) {
                  // Obtenemos el nombre y la imagen del producto desde el mapa
                  String proveedorName = proveedorList[index]['name']!;
                  String proveedorImage = proveedorList[index]['image']!;
                  String proveedorType = proveedorList[index]['type']!;
                  
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200, // Ancho de cada proveedoro
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 245, 245, 245),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // Color de la sombra con opacidad ligera
                            blurRadius: 6, // Difuminado de la sombra
                            offset: const Offset(1, 2), // Desplazamiento horizontal y vertical de la sombra
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                proveedorImage, // Usamos la imagen del mapa
                                fit: BoxFit.cover,
                                width: 200,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  proveedorType,  // Usamos el nombre del mapa
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Color.fromARGB(255, 177, 177, 177)),
                                ),
                                Text(
                                  proveedorName,  // Usamos el nombre del mapa
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  'Ver más',  // Usamos el nombre del mapa
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex, // Índice seleccionado
        onTap: _onItemTapped, // Cambia el índice cuando se presiona un ítem
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),

    );
  }
}