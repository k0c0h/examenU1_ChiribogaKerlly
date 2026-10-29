import 'package:flutter/material.dart';

class DatoResultado extends StatelessWidget {
  final String titulo;
  final String valor;
  final bool destacado;

  const DatoResultado({
    super.key,
    required this.titulo,
    required this.valor,
    this.destacado = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titulo),
      trailing: Text(
        valor,
        style: TextStyle(
          fontWeight: destacado ? FontWeight.bold : FontWeight.w600,
          fontSize: destacado ? 20 : 16,
        ),
      ),
    );
  }
}
