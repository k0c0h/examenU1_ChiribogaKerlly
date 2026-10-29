import 'package:flutter/foundation.dart';

import '../model/agua_model.dart';

class AguaViewModel extends ChangeNotifier {
  AguaModelo? resultado;

  AguaModelo calcular({
    double lecturaAnterior = 0,
    double lecturaActual = 0,
  }) {
    if (lecturaActual < lecturaAnterior) {
      throw ArgumentError(
        'La lectura actual debe ser mayor o igual que la lectura anterior',
      );
    }

    final consumo = lecturaActual - lecturaAnterior;
    final tarifa = consumo <= 15 ? 0.40 : consumo <= 30 ? 0.60 : 0.80;

    notifyListeners();
    return resultado = AguaModelo(
      lecturaAnterior: lecturaAnterior,
      lecturaActual: lecturaActual,
      consumo: consumo,
      tarifa: tarifa,
      total: consumo * tarifa,
    );
    
    
  }
}
