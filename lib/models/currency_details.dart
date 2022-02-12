// To parse this JSON data, do
//
//     final currencyDetails = currencyDetailsFromJson(jsonString);

import 'dart:convert';

CurrencyDetails currencyDetailsFromJson(String str) => CurrencyDetails.fromJson(json.decode(str));

String currencyDetailsToJson(CurrencyDetails data) => json.encode(data.toJson());

class CurrencyDetails {
  CurrencyDetails({
    this.volume,
    this.last,
    this.timestamp,
    this.bid,
    this.vwap,
    this.high,
    this.low,
    this.ask,
    this.open,
  });

  String? volume;
  String? last;
  String? timestamp;
  String? bid;
  String? vwap;
  String? high;
  String? low;
  String? ask;
  double? open;

  factory CurrencyDetails.fromJson(Map<String, dynamic> json) => CurrencyDetails(
    volume: json["volume"],
    last: json["last"],
    timestamp: json["timestamp"],
    bid: json["bid"],
    vwap: json["vwap"],
    high: json["high"],
    low: json["low"],
    ask: json["ask"],
    open: json["open"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "volume": volume,
    "last": last,
    "timestamp": timestamp,
    "bid": bid,
    "vwap": vwap,
    "high": high,
    "low": low,
    "ask": ask,
    "open": open,
  };
}
