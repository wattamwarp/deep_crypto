import 'dart:async';

import 'package:deep_crypto/helper/helper.dart';
import 'package:deep_crypto/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/SplashScreen';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const SplashScreen());
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    double _height = sizeConfig.safeHeight! * 100;
    double _width = sizeConfig.safeWidth! * 100;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: _height,
          width: _width,
          child: Image.asset(
            'assets/logo.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
