import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ASE456-Individual-Project/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration Tests', () {
    testWidgets('Timer starts and updates UI', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('25:00'), findsOneWidget);

      await tester.tap(find.text('Start'));
      await tester.pump(Duration(seconds: 1));

      expect(find.text('24:59'), findsOneWidget);

      await tester.tap(find.text('Reset'));
      await tester.pumpAndSettle();

      expect(find.text('25:00'), findsOneWidget);
    });

    testWidgets('Fruit changes on button press and updates background color',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      var initialColor =
          tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;

      await tester.tap(find.text('Change Fruit!'));
      await tester.pumpAndSettle();

      var newColor =
          tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;
      expect(newColor, isNot(equals(initialColor)));
    });
  });
}
