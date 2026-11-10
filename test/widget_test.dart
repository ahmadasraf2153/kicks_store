
import 'package:flutter_test/flutter_test.dart';
import 'package:kicks_store/main.dart';

void main() {
  testWidgets('KicksStore tampil dengan benar', (WidgetTester tester) async {
    await tester.pumpWidget(const KicksStoreApp());

    expect(find.text('KicksStore'), findsOneWidget);
    expect(find.text('Find Your Perfect Shoes'), findsOneWidget);
  });
}
