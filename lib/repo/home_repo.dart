import 'dart:convert';

import 'package:deep_crypto/helper/helper.dart';
import 'package:deep_crypto/models/models.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  Future<CurrencyDetails> getCurrencyDetails({required String cryptoName}) async {
    var url = Uri.parse(DUrls.CURRENCY_DETAILS + cryptoName);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      CurrencyDetails? currencyDetails = CurrencyDetails.fromJson(data);
      return currencyDetails;
    } else {
      throw Exception('Failed');
    }
  }

  Future<OrderBook> getOrderBook({required String cryptoName}) async {
    var url = Uri.parse(DUrls.ORDER_BOOK + cryptoName);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      OrderBook? orderBook = OrderBook.fromJson(data);
      return orderBook;
    } else {
      throw Exception('Failed');
    }
  }
}
