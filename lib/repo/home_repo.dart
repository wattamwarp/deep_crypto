import 'dart:convert';

import 'package:deep_crypto/helper/helper.dart';
import 'package:deep_crypto/models/models.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  Future<CryptoDetails> getCryptoDetails({required String cryptoName}) async {
    var url = Uri.parse(DUrls.CRYPTO_DETAILS + cryptoName);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      CryptoDetails? cryptoDetails = CryptoDetails.fromJson(data);
      return cryptoDetails;
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
