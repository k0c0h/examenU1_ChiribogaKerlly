import 'package:flutter_test/flutter_test.dart';

import 'package:examenu1_chiribogakerlly/main.dart';

void main() {
  testWidgets('muestra la pantalla de inicio', (tester) async {
    await tester.pumpWidget(const MiApp());

    expect(find.text('Calcula tu consumo'), findsOneWidget);
    expect(find.text('Empezar cálculo'), findsOneWidget);
  });

  testWidgets('navega a la pantalla de lecturas', (tester) async {
    await tester.pumpWidget(const MiApp());
    await tester.tap(find.text('Empezar cálculo'));
    await tester.pumpAndSettle();

    expect(find.text('Lecturas del medidor'), findsOneWidget);
    expect(find.text('Lectura anterior (m³)'), findsOneWidget);
    expect(find.text('Lectura actual (m³)'), findsOneWidget);
  });
}
