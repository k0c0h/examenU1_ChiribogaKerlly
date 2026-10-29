import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodel/agua_viewmodel.dart';
import 'view/pantallas/agua_pantalla.dart';
import 'view/pantallas/inicio_pantalla.dart';
import 'view/pantallas/resultado_pantalla.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AguaViewModel(),
      child: const MiApp(),
    ),
  );
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pago de agua',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF087EA4)),
        scaffoldBackgroundColor: const Color(0xFFF4F8FA),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const InicioPantalla(),
        '/calcular': (_) => const AguaPantalla(),
        '/resultado': (_) => const ResultadoPantalla(),
      },
    );
  }
}
