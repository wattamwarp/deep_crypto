import 'package:deep_crypto/bloc/home_bloc.dart';
import 'package:deep_crypto/common_widgets/custom_text.dart';
import 'package:deep_crypto/helper/helper.dart';
import 'package:deep_crypto/models/models.dart';
import 'package:deep_crypto/screens/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/HomeScreen';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const HomeScreen());
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  HomeBloc? _bloc;
  String? _cryptoName;

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    double _height = sizeConfig.safeHeight! * 100;
    double _width = sizeConfig.safeWidth! * 100;
    _bloc = BlocProvider.of<HomeBloc>(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _cryptoName != null
            ? FloatingActionButton(
                hoverColor: Colors.black,
                elevation: 10,
                onPressed: () {
                  _bloc!.add(GetDetails(cryptoName: _cryptoName));
                },
                backgroundColor: DColors.darkVoiletColor,
                child: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
        body: SingleChildScrollView(
          child: _buildForm(_height),
        ),
      ),
    );
  }

  Widget _buildForm(double _height) {
    return Column(
      children: [
        Container(
          height: 45,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: DColors.lightGreyColor.withOpacity(0.50),
          ),
          child: TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onSubmitted: (value) async {
              _cryptoName = _searchController.text;
              _bloc!.add(GetDetails(cryptoName: _cryptoName));
            },
            style: const TextStyle(),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter currency pair',
              hintStyle: const TextStyle(
                color: DColors.darkGreyColor,
              ),
              suffixIcon: InkWell(
                  onTap: () {
                    _cryptoName = _searchController.text;
                    _bloc!.add(GetDetails(cryptoName: _cryptoName));
                  },
                  child: const Icon(
                    Icons.search,
                    color: DColors.voiletColor,
                  )),
            ),
          ),
        ),
        BlocConsumer<HomeBloc, HomeState>(
          listener: (BuildContext context, HomeState state) {},
          builder: (BuildContext context, HomeState state) {
            if (state is ShowDetail) {
              return SizedBox(
                height: 215,
                child: Column(
                  children: [
                    currencyDetailsWidget(
                        currencyDetails: state.currencyDetails,
                        cryptoName: _searchController.text.toString()),
                    Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            _bloc!.add(GetOrderBook(
                                cryptoName: _cryptoName,
                                currencyDetails: state.currencyDetails));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: DText(
                              'VIEW ORDER BOOK',
                              variant: TypographyVariant.header,
                              textColor: DColors.voiletColor,
                            ),
                          ),
                        )),
                  ],
                ),
              );
            }
            if (state is ShowOrderBook) {
              return Column(
                children: [
                  currencyDetailsWidget(
                    currencyDetails: state.currencyDetails,
                    cryptoName: _searchController.text.toString(),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          _bloc!.add(GetDetails(cryptoName: _cryptoName));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: DText(
                            'HIDE ORDER BOOK',
                            variant: TypographyVariant.header,
                            textColor: DColors.voiletColor,
                          ),
                        ),
                      )),
                  orderBookWidget(orderBook: state.orderBook, height: _height),
                ],
              );
            }
            if (state is Loading) {
              return SizedBox(
                height: _height - 50,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: DColors.voiletColor,
                  ),
                ),
              );
            }
            return SizedBox(
              child: Column(
                children: const [
                  SizedBox(
                    height: 60,
                  ),
                  Icon(
                    Icons.search,
                    size: 100,
                    color: DColors.greyColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DText(
                    'Enter a currency pair to load data',
                    variant: TypographyVariant.header,
                    textColor: DColors.greyColor,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
