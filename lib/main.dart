import 'package:flutter/material.dart';
import 'dart:async'; // Required for Future.delayed

void main() => runApp(const WekndApp());

class WekndApp extends StatelessWidget {
  const WekndApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WEKND',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const SplashScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        '/home': (BuildContext context) => const HomeScreen(),
        '/business': (BuildContext context) => const BusinessDashboard(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'assets/logoapp.jpg',
              height: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              'WEKND',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Iniciar sesión',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Entrar', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promociones en tiempo real'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const <Widget>[
          PromoCard(title: '2x1 en tragos', place: 'Bar Sunset', time: '8:00pm - 10:00pm'),
          PromoCard(title: 'Entrada gratis', place: 'Club Éxtasis', time: 'Antes de las 11:00pm'),
          PromoCard(title: 'Descuento del 30%', place: 'Restaurante La Terraza', time: 'Toda la noche'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/business');
        },
        label: const Text('Panel de Negocios'),
        icon: const Icon(Icons.business),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String title;
  final String place;
  final String time;

  const PromoCard({
    super.key,
    required this.title,
    required this.place,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.local_offer, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$place\n$time'),
        isThreeLine: true,
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}

class BusinessDashboard extends StatelessWidget {
  const BusinessDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Negocios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Estadísticas de Hoy',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              child: Column(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.group, color: Colors.deepPurple),
                    title: Text('Visitantes', style: TextStyle(fontSize: 16)),
                    trailing: Text('234', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.deepPurple),
                    title: Text('Promociones activas', style: TextStyle(fontSize: 16)),
                    trailing: Text('5', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16),
                  ListTile(
                    leading: Icon(Icons.attach_money, color: Colors.deepPurple),
                    title: Text('Ventas estimadas', style: TextStyle(fontSize: 16)),
                    trailing: Text('\$12,400', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // This will pop BusinessDashboard and go back to HomeScreen
                },
                icon: const Icon(Icons.home),
                label: const Text('Regresar al Inicio', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}