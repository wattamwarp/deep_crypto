

part of'home_bloc.dart';

abstract class HomeState{}

class InitState extends HomeState{}

class Loading extends HomeState{}

class ShowDetail extends HomeState{
  CurrencyDetails currencyDetails;
  ShowDetail({required this.currencyDetails});
}

class ShowOrderBook extends HomeState{
  CurrencyDetails currencyDetails;
  OrderBook orderBook;
  ShowOrderBook({required this.currencyDetails,required this.orderBook});
}