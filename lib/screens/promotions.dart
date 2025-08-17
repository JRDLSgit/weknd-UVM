
import 'package:flutter/material.dart';

class PromotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Promociones')),
      body: ListView(
        children: [
          ListTile(title: Text('2x1 en bebidas (6pm - 9pm)')),
          ListTile(title: Text('Entrada gratis con pulsera WEKND')),
        ],
      ),
    );
  }
}
