import 'package:deep_crypto/models/currency_details.dart';
import 'package:deep_crypto/models/models.dart';
import 'package:deep_crypto/repo/home_repo.dart';
import 'package:flutter_test/flutter_test.dart';


/// Unit Testing
void main() {

  group('testing currency details', () {
    test('test BTCUSD currency details', () async {
      CurrencyDetails currencyDetails =
          await HomeRepo().getCurrencyDetails(cryptoName: 'btcusd');
      expect(currencyDetails.volume!.isNotEmpty, true);
    });

    test('test EURUSD currency details', () async {
      CurrencyDetails currencyDetails =
          await HomeRepo().getCurrencyDetails(cryptoName: 'eurusd');
      expect(currencyDetails.volume!.isNotEmpty, true);
    });

    test('test B currency details', () async {
      CurrencyDetails currencyDetails =
          await HomeRepo().getCurrencyDetails(cryptoName: 'b');
      expect(currencyDetails.volume!.isNotEmpty, true);
    });

    test('test empty (null value) currency details', () async {
      CurrencyDetails currencyDetails =
          await HomeRepo().getCurrencyDetails(cryptoName: '');
      expect(currencyDetails.volume!.isNotEmpty, true);
    });
  });

  group('testing currency order book', () {
    test('test BTCUSD currency order book', () async {
      OrderBook orderBook =
      await HomeRepo().getOrderBook(cryptoName: 'btcusd');
      expect(orderBook.bids!.isNotEmpty, true);
    });

    test('test EURUSD currency order book', () async {
      OrderBook orderBook =
      await HomeRepo().getOrderBook(cryptoName: 'eurusd');
      expect(orderBook.bids!.isNotEmpty, true);
    });

    test('test B currency order book', () async {
      OrderBook orderBook =
      await HomeRepo().getOrderBook(cryptoName: 'b');
      expect(orderBook.bids!.isNotEmpty, true);
    });

    test('test empty (null value) currency order book', () async {
      OrderBook orderBook =
      await HomeRepo().getOrderBook(cryptoName: '');
      expect(orderBook.bids!.isNotEmpty, true);
    });
  });
}
