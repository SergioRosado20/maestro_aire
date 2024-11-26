import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // O el color que prefieras
        foregroundColor: Colors.transparent, // O el color que prefieras
        elevation: 0, // Opcional: elimina la sombra
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/maestro_aire.png', // Ruta del archivo en tu proyecto
                      height: 100,   // Ajusta el tamaño del logo
                    ),
                    const Text(
                      'Maestro Aire',
                      style: TextStyle(fontSize: 30, fontFamily: 'Ninja', letterSpacing: 2.0),
                    ),
                    const SizedBox(height: 70),
                    const Text(
                      'Crea una cuenta',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),
                    ),
                    const Text(
                      'Ingresa tu número de teléfono para registrarte',
                      style: TextStyle(fontSize: 16, ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Número de Teléfono",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.black), // Color de fondo
                    foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
                      ),
                    )
                  ),
                  onPressed: () {
                    // Aquí puedes agregar la lógica de autenticación
                    //print("Correo: ${emailController.text}");
                    //print("Contraseña: ${passwordController.text}");
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text(
                    "Continuar",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                    )
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1, // Grosor de la línea
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "O",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'lib/assets/google_logo.png', // Logo de Google
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Continuar con Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'lib/assets/apple.png', // Logo de Google
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Continuar con Apple',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black, // Color predeterminado para el texto
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Al hacer clic en Continuar, ',
                        style: TextStyle(color: Colors.grey[700]), // Estilo del texto normal
                      ),
                      TextSpan(
                        text: ' acepta nuestros ',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextSpan(
                        text: 'Términos de servicio',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Color azul para "Términos de servicio"
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Lógica cuando se hace clic en "Términos de servicio"
                            print('Clic en Términos de servicio');
                          },
                      ),
                      TextSpan(
                        text: ' y ',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextSpan(
                        text: 'Política de Privacidad',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Color azul para "Política de Privacidad"
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Lógica cuando se hace clic en "Política de Privacidad"
                            print('Clic en Política de Privacidad');
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}