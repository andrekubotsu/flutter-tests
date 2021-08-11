import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpflutter/main.dart';

void main() {
  testWidgets('Entendendo teste de widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Login'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Nome'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Email'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
