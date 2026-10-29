import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/agua_viewmodel.dart';

class AguaPantalla extends StatefulWidget {
  const AguaPantalla({super.key});

  @override
  State<AguaPantalla> createState() => _AguaPantallaState();
}

class _AguaPantallaState extends State<AguaPantalla> {
  final lecturaAnteriorController = TextEditingController();
  final lecturaActualController = TextEditingController();
  final formularioKey = GlobalKey<FormState>();

  void calcular() {
    if (!formularioKey.currentState!.validate()) return;

    try {
      final resultado = context.read<AguaViewModel>().calcular(
            lecturaAnterior: double.parse(lecturaAnteriorController.text),
            lecturaActual: double.parse(lecturaActualController.text),
          );
      Navigator.pushNamed(context, '/resultado', arguments: resultado);
    } on FormatException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } on ArgumentError catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Lecturas inválidas')),
      );
    }
  }

  String? validarLectura(String? valor) {
    if (valor == null || valor.trim().isEmpty) return 'Ingresa una lectura';
    final lectura = double.tryParse(valor);
    if (lectura == null || lectura < 0) return 'Ingresa un número válido';
    return null;
  }

  String? validarLecturaActual(String? valor) {
    final error = validarLectura(valor);
    if (error != null) return error;

    final lecturaAnterior = double.parse(lecturaAnteriorController.text);
    final lecturaActual = double.parse(valor!);
    if (lecturaActual < lecturaAnterior) {
      return 'Debe ser mayor o igual a la lectura anterior';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lecturas del medidor')),
      body: Form(
        key: formularioKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              'Ingresa las lecturas',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),        
            SizedBox(height: 24),
            TextFormField(
              controller: lecturaAnteriorController,
              validator: validarLectura,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Lectura anterior (m³)',
                prefixIcon: Icon(Icons.history_rounded),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: lecturaActualController,
              validator: validarLecturaActual,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Lectura actual (m³)',
                prefixIcon: Icon(Icons.speed_rounded),
              ),
            ),
            SizedBox(height: 28),
            SizedBox(
              height: 52,
              child: FilledButton.icon(
                onPressed: calcular,
                icon: Icon(Icons.calculate_rounded),
                label: Text('Calcular valor a pagar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
