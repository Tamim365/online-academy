import 'package:design_course/live_stream/liveStreamScreen.dart';
import 'package:design_course/payment/paymentScreen.dart';
import 'package:design_course/routes.dart';
import 'package:design_course/splash/components/splash_content.dart';
import 'package:design_course/splash/splash_screen.dart';
import 'package:design_course/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomeScreen/homeUi.dart';
import 'splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
