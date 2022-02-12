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
      CryptoDetails cryptoDetails =
          await homeRepo.getCryptoDetails(cryptoName: event.cryptoName!);
      emit(ShowDetail(cryptoDetails: cryptoDetails));
    }
    if (event is GetOrderBook) {
      emit(Loading());
      OrderBook orderBook =
          await homeRepo.getOrderBook(cryptoName: event.cryptoName!);
      emit(ShowOrderBook(cryptoDetails:event.cryptoDetails! ,orderBook: orderBook));
    }
  }
}
