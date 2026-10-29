import 'package:flutter/material.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.water_drop_rounded,
                    size: 64,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 28),
                Text(
                  'Calcula tu consumo',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 12),
                Text(
                  'Obtén el valor mensual de tu planilla de agua de forma rápida y sencilla.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/calcular'),
                    icon: Icon(Icons.arrow_forward_rounded),
                    label: Text('Empezar cálculo'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
