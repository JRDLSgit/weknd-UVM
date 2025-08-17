
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido a WEKND')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¡Promociones en tiempo real aquí!', style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text('Iniciar sesión'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/promotions'),
              child: Text('Ver promociones'),
            ),
          ],
        ),
      ),
    );
  }
}
