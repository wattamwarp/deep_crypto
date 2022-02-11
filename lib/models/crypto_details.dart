// To parse this JSON data, do
//
//     final cryptoDetails = cryptoDetailsFromJson(jsonString);

import 'dart:convert';

CryptoDetails cryptoDetailsFromJson(String str) => CryptoDetails.fromJson(json.decode(str));

String cryptoDetailsToJson(CryptoDetails data) => json.encode(data.toJson());

class CryptoDetails {
  CryptoDetails({
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

  factory CryptoDetails.fromJson(Map<String, dynamic> json) => CryptoDetails(
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
