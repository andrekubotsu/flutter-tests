import 'package:flutter_test/flutter_test.dart';
import 'package:fpflutter/main.dart';

void main() {
  testWidgets('Entendendo teste de widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('0'), findsOneWidget);
  });
}
