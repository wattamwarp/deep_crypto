import 'package:deep_crypto/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {

  /// TO RUN INTEGRATIN TEST - START EMULATOR /CONNECT DEVICE
  /// RUN THIS COMMAND ON TERMINAL "flutter test integration_test -d mobile"

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Interation Test - testing whole application',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp()); // Create main app
      await tester
          .pumpAndSettle(); // Finish animations and scheduled microtasks
      await tester.pump(const Duration(seconds: 2));


      final Finder searchTF = find.byKey(const Key('searchKey'));
      final Finder searchIcon = find.byKey(const Key('searchIconKey'));
      final Finder refreshIcon = find.byKey(const Key('refreshKey'));
      final Finder viewOrderText = find.byKey(const Key('viewOrderKey'));
      final Finder hideOrderText = find.byKey(const Key('hideOrderKey'));


      expect(searchTF, findsOneWidget);
      expect(searchIcon, findsOneWidget);

      await tester.tap(searchTF);
      await tester.enterText(searchTF, 'btcusd');
      await tester.tap(searchIcon);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await tester.pump(const Duration(seconds: 3));


      await tester.tap(viewOrderText);
      await tester.pump(const Duration(seconds: 3));

      expect(find.text('HIDE ORDER BOOK'), findsOneWidget);
      expect(find.text('BID PRICE'), findsOneWidget);

      await tester.tap(hideOrderText);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      await tester.tap(refreshIcon);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(viewOrderText);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('HIDE ORDER BOOK'), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 20));
    },
  );
}
