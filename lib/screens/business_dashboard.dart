import 'package:flutter/material.dart';

class BusinessDashboard extends StatelessWidget {
  const BusinessDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel de Negocios')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Estadísticas de Hoy', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.group, color: Colors.deepPurple),
                    title: Text('Visitantes'),
                    trailing: Text('234'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.deepPurple),
                    title: Text('Promociones activas'),
                    trailing: Text('5'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.attach_money, color: Colors.deepPurple),
                    title: Text('Ventas estimadas'),
                    trailing: Text('\$12,400'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.home),
                label: const Text('Regresar al Inicio'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
