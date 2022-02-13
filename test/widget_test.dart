// This is a basic Flutter screens.widget test.
//
// To perform an interaction with a screens.widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the screens.widget
// tree, read text, and verify that the values of screens.widget properties are correct.


import 'package:deep_crypto/models/models.dart';

import 'package:deep_crypto/screens/widget/widget.dart';

import 'package:deep_crypto/app.dart';



///widget testing
void main() {
  CurrencyDetails? currencyDetails;

  OrderBook? orderBook;

  setUp(() {
    currencyDetails = CurrencyDetails.fromJson(currencyDetialJson);
    orderBook = OrderBook.fromJson(orderBookJson);
  });

  testWidgets('widget testing - testing currency details',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: currencyDetailsWidget(
            cryptoName: 'btcusd', currencyDetails: currencyDetails!),
      ),
    ));

    await tester.pump(const Duration(seconds: 1));

    expect(find.text('BTCUSD'), findsOneWidget);

    Finder textFinder = find.text('\$' + currencyDetails!.open.toString());
    expect(textFinder, findsOneWidget);

    textFinder = find.text('\$' + currencyDetails!.low.toString());
    expect(textFinder, findsOneWidget);

    textFinder = find.text('\$' + currencyDetails!.high.toString());
    expect(textFinder, findsOneWidget);

    textFinder = find.text('\$' + currencyDetails!.last.toString());
    expect(textFinder, findsOneWidget);
  });

  testWidgets('widget testing - testing currency order book',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: orderBookWidget(orderBook: orderBook, height: 500),
      ),
    ));

    await tester.pump(const Duration(seconds: 1));

    Finder textFinder = find.text(orderBook!.bids![0][0].toString());
    expect(textFinder, findsWidgets);

    textFinder = find.text(orderBook!.bids![0][1].toString());
    expect(textFinder, findsWidgets);

    textFinder = find.text(orderBook!.asks![0][0].toString());
    expect(textFinder, findsWidgets);

    textFinder = find.text(orderBook!.asks![0][1].toString());
    expect(textFinder, findsWidgets);
  });
}
