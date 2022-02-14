import 'package:bloc/bloc.dart';
import 'package:deep_crypto/models/models.dart';
import 'package:deep_crypto/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitState()) {
    on(_onEvent);
  }

  HomeState get initialState => InitState();

  _onEvent(HomeEvent event, Emitter<HomeState> emit) async {
    HomeRepo homeRepo = HomeRepo();
    if (event is GetDetails) {
      emit(Loading());

      bool valid = valiadations(event.cryptoName!);
      if (valid) {
        CurrencyDetails currencyDetails =
            await homeRepo.getCurrencyDetails(cryptoName: event.cryptoName!);
        emit(ShowDetail(currencyDetails: currencyDetails));
      }else{
        emit(Error(errorMsg: 'Enter valid currency pair'));
      }
    }
    if (event is GetOrderBook) {
      emit(Loading());
      OrderBook orderBook =
          await homeRepo.getOrderBook(cryptoName: event.cryptoName!);
      emit(ShowOrderBook(
          currencyDetails: event.currencyDetails!, orderBook: orderBook));
    }
  }

  bool valiadations(String text) {
    List<String> currencyPairs = [
      'btcusd',
      'btceur',
      'btcgbp',
      'btcpax',
      'btcusdc',
      'gbpusd',
      'gbpeur',
      'eurusd',
      'xrpusd',
      'xrpeur',
      'xrpbtc',
      'xrpgbp',
      'xrppax',
      'ltcusd',
      'ltceur',
      'ltcbtc',
      'ltcgbp',
      'ethusd',
      'etheur',
      'ethbtc',
      'ethgbp',
      'ethpax',
      'ethusdc',
      'bchusd',
      'bcheur',
      'bchbtc',
      'bchgbp',
      'paxusd',
      'paxeur',
      'paxgbp',
      'xlmbtc',
      'xlmusd',
      'xlmeur',
      'xlmgbp',
      'linkusd',
      'linkeur',
      'linkgbp',
      'linkbtc',
      'linketh',
      'omgusd',
      'omgeur',
      'omggbp',
      'omgbtc',
      'usdcusd',
      'usdceur'
    ];

    if (currencyPairs.contains(text)) {
      return true;
    }

    return false;
  }
}
