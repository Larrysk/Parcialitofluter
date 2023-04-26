import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parcialito/main.dart';

void main() {
  testWidgets('FibonacciScreen muestra resultado correcto', (WidgetTester tester) async {
    // Construir el widget
    await tester.pumpWidget(MaterialApp(home: FibonacciScreen()));

    // Encontrar los widgets necesarios
    final textFieldFinder = find.byType(TextField);
    final buttonFinder = find.byType(ElevatedButton);
    final resultFinder = find.text('El resultado es: 0');

    // Verificar que el resultado inicial sea 0
    expect(resultFinder, findsOneWidget);

    // Ingresar un valor en el TextField
    await tester.enterText(textFieldFinder, '6');

    // Tocar el botón para calcular
    await tester.tap(buttonFinder);
    await tester.pump();

    // Verificar que el resultado sea correcto
    expect(find.text('El resultado es: 8'), findsOneWidget);
  });
}