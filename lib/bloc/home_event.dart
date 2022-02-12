part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class GetDetails extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  String? cryptoName;

  GetDetails({required this.cryptoName});
}

class GetOrderBook extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  String? cryptoName;
  CryptoDetails? cryptoDetails;
  GetOrderBook({required this.cryptoName, required this.cryptoDetails});
}
