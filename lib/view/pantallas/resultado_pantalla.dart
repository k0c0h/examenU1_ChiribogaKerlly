import 'package:flutter/material.dart';

import '../../model/agua_model.dart';
import '../widgets/dato_resultado.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final agua = ModalRoute.of(context)!.settings.arguments as AguaModelo;

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado del consumo')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  DatoResultado(
                    titulo: 'Lectura anterior',
                    valor: '${agua.lecturaAnterior} m³',
                  ),
                  DatoResultado(
                    titulo: 'Lectura actual',
                    valor: '${agua.lecturaActual} m³',
                  ),
                  DatoResultado(
                    titulo: 'Consumo realizado',
                    valor: '${agua.consumo} m³',
                  ),
                  DatoResultado(
                    titulo: 'Tarifa aplicada',
                    valor: '\$${agua.tarifa.toStringAsFixed(2)} / m³',
                  ),
                  DatoResultado(
                    titulo: 'Total a pagar',
                    valor: '\$${agua.total.toStringAsFixed(2)}',
                    destacado: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.edit_rounded),
            label: const Text('Realizar otro cálculo'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              (route) => false,
            ),
            child: const Text('Volver al inicio'),
          ),
        ],
      ),
    );
  }

}
