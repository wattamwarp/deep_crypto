

part of'home_bloc.dart';

abstract class HomeState{}

class InitState extends HomeState{}

class Loading extends HomeState{}

class ShowDetail extends HomeState{
  CryptoDetails cryptoDetails;
  ShowDetail({required this.cryptoDetails});
}

class ShowOrderBook extends HomeState{
  CryptoDetails cryptoDetails;
  OrderBook orderBook;
  ShowOrderBook({required this.cryptoDetails,required this.orderBook});
}